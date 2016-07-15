module.exports = {

    options: {
        processors: [
            require('autoprefixer')({
                browsers: ['last 2 versions']
            }),
            require('cssnano')()
        ]
    },

    theme: {
        files: {
            "out/flow/src/css/styles.min.css": "out/flow/src/css/styles.min.css"
        }
    }

};
