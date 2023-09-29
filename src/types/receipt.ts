interface Receipt {
  id: string
  name: string | null
  description?: string
  imgUrl?: string
  imgName?: string
  authorId: Author['id']
}

interface Author {
  id: string
  name: string
}

export { type Author, type Receipt }
