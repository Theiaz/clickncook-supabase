import { expect, test } from '@playwright/test'

test('visits the app root url', async ({ page }) => {
  await page.goto('/')
  await expect(page.locator('[data-test="claim"]')).toBeVisible()
})

test('login and create recipe', async ({ page }) => {
  await page.goto('/')
  // create button
  await page.getByRole('button').first().click()

  //login
  await page.getByLabel('Email').fill('foo@foo.de')
  await page.getByLabel('Email').press('Tab')
  await page.getByLabel('Password').fill('123456')
  page.once('dialog', (dialog) => {
    console.log(`Dialog message: ${dialog.message()}`)
    dialog.dismiss().catch(() => {})
  })
  await page.getByRole('button', { name: 'Login' }).click()

  await expect(page.getByRole('button', { name: 'Create Recipe' })).toBeVisible()
})
