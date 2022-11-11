#!/usr/bin/env bash

# use flag --no-verify to bypass hook.

PWD=`pwd`
NAME=$(git config user.name)
EMAIL=$(git config user.email)

# Check for correct username
if [[ $NAME == *"sanjitprasad786"* ]]; then
  echo "[INFO] Verified name: $NAME"
else
  echo "[ERROR] Invalid name: $NAME => Please configure the Github username and retry."
  echo "Steps:"
  echo "   cd $PWD"
  echo '   git config user.name "sanjitprasad786"'
  echo ""
  exit 1;
fi;

# Check for correct useremail
if [[ $EMAIL == *"sanjit.prasad@nutanix.com"* ]]; then
  echo "[INFO] Verified email: $EMAIL"
else
  echo "[ERROR] Invalid email: $EMAIL => Please configure the company email and retry."
  echo "Steps:"
  echo "   cd $PWD"
  echo '   git config user.email "sanjit.prasad@nutanix.com"'
  echo ""
  exit 1;
fi;

# Check if this is the initial commit
if git rev-parse --verify HEAD >/dev/null 2>&1
then
    echo "pre-commit: About to create a new commit..."
    against=HEAD
else
    echo "pre-commit: About to create the first commit..."
    against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Use git diff-index to check for whitespace errors
echo "pre-commit: Testing for whitespace errors..."
if ! git diff-index --check --cached $against
then
    echo "pre-commit: Aborting commit due to whitespace errors"
    exit 1
else
    echo "pre-commit: No whitespace errors :)"
    exit 0
fi;

