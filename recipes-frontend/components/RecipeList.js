import styles from "../styles/Recipe.module.css"
import 'bootstrap/dist/css/bootstrap.css'

import RecipeItem from "./RecipeItem"

const RecipeList = ({recipes}) => {
  return(
    <div class="row p-5 w-100">
      <div class="center">
        <h2>Recipes</h2>
      </div>
      <div class="justify-content-center">
        {
          recipes.map(recipe => <RecipeItem recipe={recipe} /> )
        }
      </div>

    </div>
  )

}

export default RecipeList