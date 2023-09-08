import type { Author } from './author'

interface Receipt {
  id: string
  name: string | null
  description?: string | null
  imgUrl?: string | null
  authorId: Author['id']
}

export type { Receipt }
