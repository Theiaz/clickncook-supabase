import type { InsertDto, Row, UpdateDto } from '@/types/supabase'

export type RecipeDto = Row<'recipes'>
export type RecipeInsertDto = InsertDto<'recipes'>
export type RecipeUpdateDto = UpdateDto<'recipes'>
