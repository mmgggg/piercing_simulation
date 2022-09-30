module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/javascript/packs/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('daisyui'),
  ],
}

// plugins: [
//   require('@tailwindcss/forms'),
//   require('@tailwindcss/aspect-ratio'),
//   require('@tailwindcss/typography'),
//   require('daisyui'),    // ← 追記する
// ],
// }
