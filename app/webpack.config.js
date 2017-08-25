const webpack = require('webpack');
const path = require('path');

module.exports = {
	target: 'web',
	devtool: 'cheap-module-eval-source-map',
	entry: {
		index: './src/index.js'
	},
	output: {
		path: path.join(__dirname, 'lib'),
		publicPath: '/',
		filename: '[name].js'
	},
	resolve: {
		modules: ['node_modules'],
		extensions: ['.js', '.jsx'],
		alias: {
			'react': path.resolve(__dirname, 'node_modules/react'),
			'react-dom': path.resolve(__dirname, 'node_modules/react-dom')
		}
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
	devServer: {
  		contentBase: '.',
		port: 8080
	}
}