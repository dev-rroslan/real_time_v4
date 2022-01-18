// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('daisyui'),
  ],
  daisyui: {
    styled: true,
    themes: true,
    base: true,
    utils: true,
    logs: false,
    rtl: false,
  },
  theme: {
    extend: {
      colors: require('daisyui/colors'),
    },
  }

}
