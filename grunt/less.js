module.exports = {

    options: {
        compress: true,
        yuicompress: true,
        optimization: 2,
        plugins: [
            new (require('less-plugin-autoprefix'))({browsers: ["last 2 versions"]})
        ]
    },

    theme: {
        files: {
            "out/azure_v2/src/css/styles.min.css": "build/less/azure_v2.less"
        }
    },

    vendor: {
        files: {
            "out/azure_v2/src/css/libs/jquery.flexslider.min.css": "build/vendor/jquery-flexslider2/less/flexslider.less"
        }
    }

};