module.exports = {

    options: {
        curly: true,
        eqeqeq: false,
        eqnull: true,
        browser: true,
        globals: {
            jQuery: true
        }
    },
    theme: {
        src: [
            "build/js/main.js",
            "build/js/pages/*.js"
        ]
    }

};