const { environment } = require('@rails/webpacker')



const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
// const webpack = require('webpack')
// environment.plugins.prepend('Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery-ujs/src/rails',
//         jQuery: 'jquery-ujs/src/rails'
//     })
// )


module.exports = environment