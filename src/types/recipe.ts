type Enumerate<N extends number, Acc extends number[] = []> = Acc['length'] extends N
  ? Acc[number]
  : Enumerate<N, [...Acc, Acc['length']]>

type IntRange<F extends number, T extends number> = Exclude<Enumerate<T>, Enumerate<F>>

type Rating = IntRange<0, 5>


type RecipeData = {
  name: string | null
  description?: string
  images: File[]
  rating: number
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
