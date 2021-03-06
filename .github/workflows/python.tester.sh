#!/usr/bin/env sh

set -e

pip3 --disable-pip-version-check install -r .github/workflows/python.tester.requirements.txt
find algorithm-design -type d -exec touch {}/__init__.py \;
coverage run -m unittest discover -s . -p "*.py"
coverage report --show-missing --omit="*/__init__.py"
coverage xml -i
