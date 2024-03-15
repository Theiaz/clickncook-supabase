import type { InsertDto, Row, UpdateDto } from '@/types/supabase'
import type { CategoryDto } from '../categories/dto'

export type RecipeDto = Row<'recipes'> & { categories: CategoryDto[] }
export type RecipeInsertDto = InsertDto<'recipes'>
export type RecipeUpdateDto = UpdateDto<'recipes'>
