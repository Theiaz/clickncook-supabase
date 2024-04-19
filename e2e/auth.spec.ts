import { expect, test } from '@playwright/test'

test('login', async ({ page }) => {
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
  await expect(page.getByTestId('next-button')).toBeVisible()
})

test('navigate to register screen from login screen', async ({ page }) => {
  await page.goto('/login')
  page.getByTestId('register-button').click()

  await expect(page).toHaveURL('/register')
  await expect(page.getByTestId('submit-button')).toBeVisible()
})

test('register', async ({ page }) => {
  await page.goto('/register')
  await expect(page).toHaveURL('/register')

  const mail = `${crypto.randomUUID()}@bar.de`
  await page.getByTestId('email-input').fill(mail)
  await page.getByTestId('email-input').press('Tab')
  await page.getByTestId('email-confirm-input').fill(mail)
  await page.getByTestId('email-confirm-input').press('Tab')

  const password = '123456'
  await page.getByTestId('password-input').fill(password)
  await page.getByTestId('password-input').press('Tab')
  await page.getByTestId('password-confirm-input').fill(password)

  page.once('dialog', async (dialog) => {
    expect(dialog.message()).toContain('Please confirm your registration via email')
    await dialog.accept()
  })
  await page.getByTestId('submit-button').click()
})
