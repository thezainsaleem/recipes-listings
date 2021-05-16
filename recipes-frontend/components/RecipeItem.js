import Link from 'next/link'
import 'bootstrap/dist/css/bootstrap.css'


const RecipeItem = ({recipe}) => {
  return(
    <div class="col col-md-6">
      <Link href="/recipes/[id]" as={`/recipes/${recipe.id}`}>
        <a data-cy="nav-item" class="card text-decoration-none my-2">
          <div class="row">
            <div class="col col-md-4">
              <img
                src={`https:${recipe.image.url}`}
                alt="Picture of the author"
                width="auto"
                height={100}
              />
            </div>
            <div class="col my-auto">
              <h3>{recipe.title}</h3>
            </div>
          </div>
        </a>

      </Link>
    </div>
  )

}

export default RecipeItem