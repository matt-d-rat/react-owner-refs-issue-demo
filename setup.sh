#!/bin/bash

# Create variables for paths

SOURCE_DIR=$PWD

APP_DIR="$SOURCE_DIR/app"
MODULE_A_DIR="$SOURCE_DIR/module-a"
MODULE_B_DIR="$SOURCE_DIR/module-b"
MODULE_C_DIR="$SOURCE_DIR/module-c"

# NPM install dependencies for all
echo "Installing NPM dependencies"

# -- App
cd $APP_DIR
npm install --loglevel silent
echo "-- App dependencies installed"
cd $SOURCE_DIR

# -- Module A
cd $MODULE_A_DIR
npm install --loglevel silent
echo "-- Module A dependencies installed"
cd $SOURCE_DIR

# -- Module B
cd $MODULE_B_DIR
npm install --loglevel silent
echo "-- Module B dependencies installed"
cd $SOURCE_DIR

# -- Module C
cd $MODULE_C_DIR
npm install --loglevel silent
echo "-- Module C dependencies installed"
cd $SOURCE_DIR

# Create global npm links for sub-modules
echo "Creating NPM Links"

# -- Module A
cd $MODULE_A_DIR
npm link
echo "-- npm linked Module A"
cd $SOURCE_DIR

# -- Module B
cd $MODULE_B_DIR
npm link
echo "-- npm linked Module B"
cd $SOURCE_DIR

# -- Module C
cd $MODULE_C_DIR
npm link
echo "-- npm linked Module C"
cd $SOURCE_DIR

# Create module dependency links
echo "NPM Linking sub-modules"

# -- Module B --> Module C
cd $MODULE_C_DIR
npm link npm-peer-test-module-b
echo "-- npm linked Module B as a dependency of Module C"
cd $SOURCE_DIR

# -- Module A, Module B, Module C --> App
cd $APP_DIR
npm link npm-peer-test-module-a
echo "-- npm linked Module A as a dependency of App"

npm link npm-peer-test-module-b
echo "-- npm linked Module B as a dependency of App"

npm link npm-peer-test-module-c
echo "-- npm linked Module C as a dependency of App"
cd $SOURCE_DIR


# Build Modules
echo "Building sub-modules"

# -- Module A
cd $MODULE_A_DIR
npm run build
echo "-- Built Module A"
cd $SOURCE_DIR

# -- Module B
cd $MODULE_B_DIR
npm run build
echo "-- Built Module B"
cd $SOURCE_DIR

# -- Module C
cd $MODULE_C_DIR
npm run build
echo "-- Built Module C"
cd $SOURCE_DIR


echo "Done."