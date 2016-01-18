module.exports = {

    scripts: {
        options: {
            separator: ";"
        },
        files: {
            "path/to/production.min.js": [
                "path/to/scripts.min.js",
                "path/to/more-scripts.min.js"
            ]
        }
    },

    styles: {
        options: {
            separator: " "
        },
        files: {
            "path/to/production.min.css": [
                "path/to/style.min.css",
                "path/to/more-style.min.css"
            ]
        }
    }

};