const webpack = require("webpack");
const path = require("path");
const RemovePlugin = require("remove-files-webpack-plugin");
const CopyPlugin = require("copy-webpack-plugin");
const nodeExternals = require("webpack-node-externals");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const buildPath = path.resolve(__dirname, "build");

const ui = {
  entry: "./ui/index.js",
  output: {
    path: path.resolve(buildPath, "ui"),
    filename: "index_bundle.js",
  },
  plugins: [
    new HtmlWebpackPlugin(),
    new RemovePlugin({
      before: {
        include: [path.resolve(buildPath, "ui")],
      },
      watch: {
        include: [path.resolve(buildPath, "ui")],
      },
    }),
  ],
}; 

const server = {
  entry: "./server/index.js",
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: ["ts-loader", "eslint-loader"],
        exclude: /node_modules/,
      },
    ],
  },
  plugins: [
    new webpack.DefinePlugin({ "global.GENTLY": false }),
    new RemovePlugin({
      before: {
        include: [path.resolve(buildPath, "server")],
      },
      watch: {
        include: [path.resolve(buildPath, "server")],
      },
    }),
  ],
  optimization: {
    minimize: true,
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js"],
  },
  output: {
    filename: "[contenthash].server.js",
    path: path.resolve(buildPath, "server"),
  },
  target: "node",
  externals: [nodeExternals()],
};

const client = {
  entry: "./client/index.js",
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: ["ts-loader", "eslint-loader"],
        exclude: /node_modules/,
      },
    ],
  },
  plugins: [
    new RemovePlugin({
      before: {
        include: [path.resolve(buildPath, "client")],
      },
      watch: {
        include: [path.resolve(buildPath, "client")],
      },
    }),
  ],
  optimization: {
    minimize: true,
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js"],
  },
  output: {
    filename: "[contenthash].client.js",
    path: path.resolve(buildPath, "client"),
  },
};

module.exports = [server, client, ui];
