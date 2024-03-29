import { expect, test as setup } from '@playwright/test'

const authFile = 'playwright/.auth/user.json'

setup('login', async ({ page }) => {
  await page.goto('/login')

  await page.getByLabel('Email').fill('foo@foo.de')
  await page.getByLabel('Email').press('Tab')
  await page.getByLabel('Password').fill('123456')
  page.once('dialog', (dialog) => {
    console.log(`Dialog message: ${dialog.message()}`)
    dialog.dismiss().catch(() => {})
  })
  await page.getByRole('button', { name: 'Login' }).click()

  await expect(page).toHaveURL('/')

  await page.context().storageState({ path: authFile })
})
