import { expect, test } from '@playwright/test'
import { dirname } from 'node:path'
import { fileURLToPath } from 'node:url'
import { join } from 'path'

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
