import { expect, test } from '@playwright/test'
import { SupabaseClient, createClient } from '@supabase/supabase-js'
import { dirname } from 'node:path'
import { fileURLToPath } from 'node:url'
import { join } from 'path'

const supabaseUrl = 'http://localhost:54321'
// we are using service role key to bypass RLS for data deletion
const supabaseServiceRoleKey =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImV4cCI6MTk4MzgxMjk5Nn0.EGIM96RAZx35lJzdJsyH-qQwv8Hdp7fsn3W0YpN81IU'
const supabase: SupabaseClient = createClient(supabaseUrl, supabaseServiceRoleKey)

test.afterEach(async () => {
  const { data } = await supabase.from('recipes').select()
  if (data) {
    const id = data[0].id
    await supabase.from('recipes').delete().eq('id', id)
    await supabase.storage.emptyBucket('recipe_images')
  }
})

test('create a recipe without images', async ({ page }) => {
  await page.goto('/')
  await page.getByTestId('new-recipe').click()

  // fill data
  await page.getByTestId('name-input').fill('New name')
  await page.getByTestId('name-input').press('Tab')

  await page.getByTestId('rating-3').click()

  await page.getByTestId('time-input').click()
  await page.getByTestId('time-input').fill('35')
  await page.getByTestId('time-input').press('Tab')

  await page
    .getByTestId('description-input')
    .fill('A longer description\n\nWith some line \n\nbreaks')
  await page.getByTestId('description-input').press('Tab')

  await page.getByTestId('categories-button').click()
  await page.getByTestId('category-1').click()
  await page.getByTestId('category-2').click()

  // submit
  await page.getByTestId('create-btn').click()

  await expect(page).toHaveURL('/')
})

test('create a recipe with multiple images', async ({ page }) => {
  await page.goto('/')
  await page.getByTestId('new-recipe').click()

  // fill data
  await page.getByTestId('name-input').fill('New name')
  await page.getByTestId('name-input').press('Tab')

  await page.getByTestId('rating-3').click()

  await page.getByTestId('time-input').click()
  await page.getByTestId('time-input').fill('35')
  await page.getByTestId('time-input').press('Tab')

  await page
    .getByTestId('description-input')
    .fill('A longer description\n\nWith some line \n\nbreaks')
  await page.getByTestId('description-input').press('Tab')

  await page.getByTestId('categories-button').click()
  await page.getByTestId('category-1').click()
  await page.getByTestId('category-2').click()

  // img upload
  const _dirname = dirname(fileURLToPath(import.meta.url))
  const img1 = join(_dirname, './testdata/img1.jpg')
  const img2 = join(_dirname, './testdata/img2.jpg')
  await page.getByTestId('image-upload').setInputFiles([img1, img2])

  await expect(page.getByTestId('previous-image')).toBeVisible()
  await expect(page.getByTestId('next-image')).toBeVisible()

  // submit
  await page.getByTestId('create-btn').click()

  await expect(page).toHaveURL('/')
})
