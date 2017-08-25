#!/bin/bash

# Create variables for paths

SOURCE_DIR=$PWD

APP_DIR="$SOURCE_DIR/app"
MODULE_A_DIR="$SOURCE_DIR/module-a"
MODULE_B_DIR="$SOURCE_DIR/module-b"
MODULE_C_DIR="$SOURCE_DIR/module-c"

# Delete react and react-dom from sub-modules node_modules
echo "Deleting React NPM dependencies from sub-modules"

# -- Module A
cd "$MODULE_A_DIR/node_modules"
rm -rf react
rm -rf react-dom
echo "-- Deleted react and react-dom from Module A's node_modules"
cd $SOURCE_DIR

# -- Module B
cd "$MODULE_B_DIR/node_modules"
rm -rf react
rm -rf react-dom
echo "-- Deleted react and react-dom from Module B's node_modules"
cd $SOURCE_DIR

# -- Module C
cd "$MODULE_C_DIR/node_modules"
rm -rf react
rm -rf react-dom
echo "-- Deleted react and react-dom from Module C's node_modules"
cd $SOURCE_DIR

# Create NPM Links to app's react and react-dom dependencies in each of the sub-modules
echo "Creating NPM Links for React and ReactDOM"

# -- Module A
cd $MODULE_A_DIR
npm link "$APP_DIR/node_modules/react"
npm link "$APP_DIR/node_modules/react-dom"
echo "-- npm linked react and react-dom for Module A from App"
cd $SOURCE_DIR

# -- Module B
cd $MODULE_B_DIR
npm link "$APP_DIR/node_modules/react"
npm link "$APP_DIR/node_modules/react-dom"
echo "-- npm linked react and react-dom for Module B from App"
cd $SOURCE_DIR

# -- Module C
cd $MODULE_C_DIR
npm link "$APP_DIR/node_modules/react"
npm link "$APP_DIR/node_modules/react-dom"
echo "-- npm linked react and react-dom for Module C from App"
cd $SOURCE_DIR

echo "Done."