const webpack = require('webpack')
const path = require("path")
const MiniCssExtractPlugin = require("mini-css-extract-plugin")

module.exports = {
  entry: {
    "js/servicefiltering": "./js/servicefiltering.js",
    "js/api": "./js/api.js",
    "js/algolia": "./js/search/algolia.jsx",
    "js/scrollmarker": "./js/scrollmarker.js",
    "css/main": "./css/main.css",
  },

  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-react", "@babel/preset-env"],
          },
        },
      },
      {
        test: /\.css$/,
        use: [
          MiniCssExtractPlugin.loader,
          { loader: "css-loader", options: { url: false } },
          "postcss-loader",
        ],
      },
    ],
  },

  output: {
    path: path.join(__dirname, "./static/"),
  },

  plugins: [
    new MiniCssExtractPlugin({}),
    new webpack.ProvidePlugin({
      process: 'process/browser',
    })
  ],
}
