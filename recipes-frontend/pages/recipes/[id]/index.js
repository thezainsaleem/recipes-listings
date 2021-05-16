import 'bootstrap/dist/css/bootstrap.css'
import axios from 'axios'

const recipe = ({recipe}) => {
  return(
    <div class="row no-gutters w-100">
      <div class="d-flex justify-content-center">
        <div class="col-3">
          <div class="py-3">
          <img
              src={`https:${recipe.image.url}`}
              alt="Picture of the author"
              width={500}
              height={500}
              />
          </div>
          <h3>{recipe.title}</h3>
          <p><b>Instructions: </b></p>
          <p>{recipe.description}</p>
          <h5>Tags</h5>
          <p>{recipe.tags}</p>
          <h5>
            Chef
          </h5>
          <p>{((recipe.chef || {}).name) || "--"}</p>
        </div>
      </div>
    </div>
  )

}


export const getServerSideProps = async ({req, res, params}) => {
  try{
    const recipeRes = await axios({
      url: `${process.env.SERVER_URL}/api/v1/recipes/${params.id}`,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': req.cookies.token
      },
      validateStatus: ()=>{return true },
    })
    const recipe = recipeRes.data
    return {
      props: {
        recipe
      }
    }
  }
  catch(err){
    console.log(err.message)
  }
  return {
    props: {}
  }

}

export default recipe
