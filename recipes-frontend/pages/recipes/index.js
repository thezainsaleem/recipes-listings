import Head from 'next/head'
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.css'

import RecipeList from "../../components/RecipeList"

export default function Home({recipes}) {
  return (
    <div >
      <Head>
        <title>Recipes</title>
      </Head>
      <div class="row no-gutters w-100">
        <RecipeList recipes={recipes}/>
      </div>
    </div>
  )
}


export const getServerSideProps = async ({req, res}) => {
  let recipes = [];

  try{
      const recipesResponse = await axios({
        url: `${process.env.SERVER_URL}/api/v1/recipes`,
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
