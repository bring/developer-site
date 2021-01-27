const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  mode: "production",
  entry: { main: "./css/main.css" },

  module: {
    rules: [
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
    path: path.join(__dirname, "./static/css"),
    // filename: "[name].css",
  },

  plugins: [
    new MiniCssExtractPlugin({

    }),
  ],
};
