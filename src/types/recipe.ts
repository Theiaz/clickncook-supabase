type RecipeData = {
  name: string | null
  description?: string
  imgName?: string
  imgUrl?: string
}

type RecipeMeta = {
  id: string
  authorId: Author['id']
}

type Recipe = RecipeData & RecipeMeta
type Author = {
  id: string
  name: string
}

export { type Author, type Recipe, type RecipeData }
