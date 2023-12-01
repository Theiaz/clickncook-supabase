type RecipeData = {
  name: string | null
  description?: string
  images: File[]
  rating: number
  cookingTime?: number
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
