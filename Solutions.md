# Solutions

The following solution branches exist to demonstrate how this problem can be solved in a number of different ways. Each solution is self-contained on a seperate `solution/` branch. Checkout the branch and follow the instructions below to see the results.

## Solution - Webpack Resolve Alias

### Running the Solution

```
git checkout solution/webpack-resolve
cd app
npm start
```

### Explanation

The least intrusive solution, the `webpack.config.js` and `webpack.config.prod.js` in the `app` project have been updated to include the following `resolve.alias`:

```
alias: {
	'react': path.resolve(__dirname, 'node_modules/react'),
	'react-dom': path.resolve(__dirname, 'node_modules/react-dom')
}
```

This tells the webpack build in __this__ project to use the `react` and `react-dom` dependencies located within its own `node_modules` when ever it encounters either of the following import statemebts (even if those statements are in one of the sub-module dependencies, or any other `node_module` dependency):

```
import React from 'react';
// or const React = require('react');
```

```
import ReactDOM from 'react-dom'
// or const ReactDOM from 'react-dom';
```

### Pros

- __Automatic__ - No manual commands or other setup.
- __Parallel Development__ - You can continue to work on other sub-modules in parallel (try running the `app` and one or more other `sub-modules` with `npm start` and make changes).
- __Applies to all NPM dependencies__ - Particulaly useful if you are using an NPM dependency (which you don't control) is presenting the ReactOwner refs issue.


### Cons

- Base project (ie: `app`) has to be running with a webpack build.