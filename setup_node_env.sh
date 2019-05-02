#!/bin/bash

# Set up environment
# Python Virtual Environment (https://docs.python.org/3/tutorial/venv.html)
# Node Virtual Environment (https://github.com/ekalinin/nodeenv)

NODE_ENV_DIR="node-env"
NODE_VERSION="9.11.2"

if [ -d "node-env" ]; then
  echo "The directory $NODE_ENV_DIR already exists. Abort..."
  exit 1;
fi
virtualenv node-env
. node-env/bin/activate
pip install -e git+https://github.com/ekalinin/nodeenv.git#egg=nodeenv
nodeenv --node="$NODE_VERSION" -p
deactivate
. node-env/bin/activate

## Checking versions
echo "Current PATH  : $PATH"
echo "Installed node: $(node -v)"
echo "Installed npm;: $(npm -v)"
