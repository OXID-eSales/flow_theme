module.exports = {

    options: {
        includePaths: [
            // 'node_modules/bootstrap-sass/assets/stylesheets',
            'node_modules',
            // 'node_modules/font-awesome/scss',
            // 'node_modules/font-awesome/scss',
            // 'node_modules/bootstrap-select/sass',
        ]
    },

    theme: {
        files: {
            "out/flow/src/css/styles.min.css": "build/scss/flow.scss"
        }
    }

};
