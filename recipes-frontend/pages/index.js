import Head from 'next/head'
import axios from 'axios';

import RecipeList from "../components/RecipeList"

export default function Home({recipes}) {
  return (
    <div >
      <Head>
        <title>Mango</title>
        <RecipeList recipes={recipes}/>
      </Head>
    </div>
  )
}


export const getServerSideProps = async ({req, res}) => {
  let recipes = [];

  try{
      const recipesResponse = await axios({
        url: "http://localhost:3000/api/v1/recipes",
        method: "GET",
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': req.cookies.token
        },
        validateStatus: ()=>{ return true },
      });
      if(recipesResponse.status == 403){
        // Unauthenticated
        // res.writeHead(302, { Location: '/login' })
        // res.end()
      }
      recipes = await recipesResponse.data
      console.log(recipes)
      return {
        props: {
          recipes
        }
      }

  }
  catch(err){
    console.log(err.message)
  }

  return {
    props: {
      recipes
    }
  }
}
