#!/bin/bash

# Create variables for paths

SOURCE_DIR=$PWD

APP_DIR="$SOURCE_DIR/app"
MODULE_A_DIR="$SOURCE_DIR/module-a"
MODULE_B_DIR="$SOURCE_DIR/module-b"
MODULE_C_DIR="$SOURCE_DIR/module-c"

# Unlink NPM Links to app's react and react-dom dependencies in each of the sub-modules
echo "Delete React and ReactDOM links from sub-modules"

# -- Module A
cd $MODULE_A_DIR
rm -rf "node_modules/react"
rm -rf "node_modules/react-dom"
echo "-- deleted react and react-dom from Module A"
cd $SOURCE_DIR

# -- Module B
cd $MODULE_B_DIR
rm -rf "node_modules/react"
rm -rf "node_modules/react-dom"
echo "-- deleted react and react-dom from Module B"
cd $SOURCE_DIR

# -- Module C
cd $MODULE_C_DIR
rm -rf "node_modules/react"
rm -rf "node_modules/react-dom"
echo "-- deleted react and react-dom from Module C"
cd $SOURCE_DIR

# Re-install the React and ReactDOM dependencies in each of the sub-modules
echo "Re-instaliing React and ReactDOM dependencies from npm in the sub-modules"

# -- Module A
cd $MODULE_A_DIR
npm install react react-dom
echo "-- installed react and react-dom for Module A"
cd $SOURCE_DIR

# -- Module B
cd $MODULE_B_DIR
npm install react react-dom
echo "-- installed react and react-dom for Module B"
cd $SOURCE_DIR

# -- Module C
cd $MODULE_C_DIR
npm install react react-dom
echo "-- installed react and react-dom for Module C"
cd $SOURCE_DIR

echo "Done."