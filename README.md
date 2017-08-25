# The ReactOwner problem for sub-module development

The purpose of this project is to demonstrate the ReactOwner problem for sub-module development in isolation, and to attempt to find a workable solution to said problem.

## What's the problem?

You have an app and a number of sub-modules, which you want to work on in parallel, each of which depend on React and ReactDOM. All sub-modules are dependencies of `App`, and in the case of `Module B`, is also a dependency of `Module C`.

__Dependency Tree:__

```
app/
├── module-a
├── module-b
├── module-c
│   ├── module-b
```

When using refs in React, __all refs__ must be for the same instance of React. Otherwise you'll end up with the following [exception](https://facebook.github.io/react/warnings/refs-must-have-owner.html) being thrown causing your app to crash and burn 🔥:

```
Uncaught Error: addComponentAsRefTo(...): Only a ReactOwner can have refs.
You might be adding a ref to a component that was not created inside a component's `render` method,
or you have multiple copies of React loaded (details: https://fb.me/react-refs-must-have-owner).
```

This is being demonstrated by `Module B` having a ref.

## Getting Started

The `master` branch represents the problem, and the `solution/` branches represent proposed solutions to the problem.

### Installation

A handy installation script has been provided to get you up and running. The `setup.sh` script will do the following:

1. Install npm dependencies in app and all sub-modules.
2. Create global npm links for all sub-modules.
3. `npm link` all sub-modules into `app`, and link `module-b` into `module-c`.
4. Run a production build for all sub-modules.

Once You have cloned the project simply run:

```
cd /path/to/npm-peer-test
./setup.sh
```

If the script does not have the correct permissions to be executed, run the following and then try again:

```
chmod +x setup.sh
```

### Running the app (dev)

```
cd /path/to/npm-peer-test/app
npm start
```

Navigate to [http://localhost:8080/](http://localhost:8080/) in your browser.

### Running the sub-modules (dev)

#### Module A

```
cd /path/to/npm-peer-test/module-a
npm start
```

Navigate to [http://localhost:8081/](http://localhost:8081/) in your browser.

#### Module B

```
cd /path/to/npm-peer-test/module-b
npm start
```

Navigate to [http://localhost:8082/](http://localhost:8082/) in your browser.

#### Module C

```
cd /path/to/npm-peer-test/module-c
npm start
```

Navigate to [http://localhost:8083/](http://localhost:8083/) in your browser.

## Building

In any of the sub-directories run `npm run build` to build a production bundle of that thing. For example:

```
cd /path/to/npm-peer-test/module-a
npm run build
```