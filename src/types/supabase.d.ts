import type { Database } from './schema'

// supabase generics - https://supabase.com/docs/reference/javascript/typescript-support
export type Row<T extends keyof Database['public']['Tables']> =
  Database['public']['Tables'][T]['Row']
export type InsertDto<T extends keyof Database['public']['Tables']> =
  Database['public']['Tables'][T]['Insert']
export type UpdateDto<T extends keyof Database['public']['Tables']> =
  Database['public']['Tables'][T]['Update']
export type Enums<T extends keyof Database['public']['Enums']> = Database['public']['Enums'][T]

// export type DbResult<T> = T extends PromiseLike<infer U> ? U : never
// export type DbResultOk<T> = T extends PromiseLike<{ data: infer U }> ? Exclude<U, null> : never
// export type DbResultErr = PostgrestError

// receipts
export type ReceiptDto = Row<'receipts'>
export type ReceiptInsertDto = InsertDto<'receipts'>
export type ReceiptUpdateDto = UpdateDto<'receipts'>
