const autoprefixer = require('autoprefixer')
const ExtractTextPlugin = require("extract-text-webpack-plugin")
const CopyWebpackPlugin = require("copy-webpack-plugin")

const postcss = [
  autoprefixer({
    browsers: ['> 1%', 'last 2 versions', 'ie >= 11']
  })
]

module.exports = {
  devtool: "source-map",
  entry: {
    "app": ["./web/static/css/app.scss", "./web/static/js/app.js"]
  },

  output: {
    path: "./priv/static",
    filename: "js/[name].js"
  },

  resolve: {
    modulesDirectories: [ "node_modules", __dirname + "/web/static/js" ]
  },

  module: {
    loaders: [
      { test: /\.js$/, loader: "babel", exclude: /node_modules/}, 
      { test: /\.vue$/, loader: 'vue' },
      { test: /\.css$/, loader: ExtractTextPlugin.extract("style", "css")}, 
      { test: /\.scss$/, loader: ExtractTextPlugin.extract(
          "style",
          "css!sass?includePaths[]=" + __dirname +  "/node_modules"
        )
      }
    ]
  },
  vue: {
    loaders: {
      scss: 'style!css!sass'
    },
    postcss
  },

  plugins: [
    new ExtractTextPlugin("css/[name].css"),
    new CopyWebpackPlugin([{ from: "./web/static/assets" }])
  ]
}
