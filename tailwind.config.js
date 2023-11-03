/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.{js,ts,vue}'],
  theme: {
    colors: {
      primary: '#00473E',
      'primary-bg': '#00473E',
      'primary-text': '#475D5B',
      secondary: '#FAAE2B',
      neutral: '#C4C4C4',
      white: '#ffffff',
      black: '#000000'
    },
    extend: {}
  },
  plugins: []
}
