module.exports = {
  purge: {
    enabled: true,
    mode: 'all',
    preserveHtmlElements: false,
    content: ['./src/**/*.html'],
    options: {
      keyframes: true
    },
  }
}

