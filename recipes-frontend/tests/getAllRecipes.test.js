// import {}

import RecipeItem from "../components/RecipeItem"

describe("Render Recipe Listing Component", () => {

  test("check if any recipes", async () => {
    const component = renderer.create(
      <RecipeItem recipe={
        {
          "id" : "123",
          "image": {
            "url": ""
          },
          "title": "dummy",
        }
      } />
    );
    let tree = component.toJSON();
    expect(tree).toMatchSnapshot();
  })

});