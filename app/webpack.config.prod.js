const webpack = require('webpack');
const PeerDepsExternalsPlugin = require('peer-deps-externals-webpack-plugin');
const path = require('path');

module.exports = {
	target: 'web',
	devtool: 'cheap-source-map',
	entry: {
		index: './src/index.js'
	},
	output: {
		path: path.join(__dirname, 'dist'),
		publicPath: '/',
		filename: '[name].js',
	},
	resolve: {
		modules: ['node_modules'],
		extensions: ['.js', '.jsx']
	},
	module: {
		rules: [
			{
			  test: /\.(js|jsx)$/,
			  use: [{ loader: 'babel-loader' }],
			  exclude: /(node_modules)/
			}
		]
	},
	plugins: [
		new PeerDepsExternalsPlugin()
	]
}