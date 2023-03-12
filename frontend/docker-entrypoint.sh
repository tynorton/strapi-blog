#!/bin/sh
set -ea
if [ ! -d "node_modules" ] || [ ! "$(ls -qAL node_modules 2>/dev/null)" ]; then
  if [ -f "yarn.lock" ]; then

    echo "Node modules not installed. Installing using yarn ..."
    yarn install

  else

    echo "Node modules not installed. Installing using npm ..."
    npm install

  fi
fi

echo "Building your app ..."
yarn run build

echo "Starting your app ..."
exec yarn run start
