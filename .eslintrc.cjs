/* eslint-env node */
require('@rushstack/eslint-patch/modern-module-resolution')

module.exports = {
  root: true,
  extends: [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    '@vue/eslint-config-typescript',
    '@vue/eslint-config-prettier/skip-formatting'
  ],
  parserOptions: {
    ecmaVersion: 'latest'
  },
  rules: {
    'vue/multi-word-component-names': [
      'error',
      {
        ignores: ['Button', 'Input', 'Label', 'Textarea', 'Skeleton', 'Slider']
      }
    ]
    //'@typescript-eslint/no-floating-promises': 'error' // playwright best practice
  }
}
