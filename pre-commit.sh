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


if git rev-parse --verify HEAD >/dev/null 2>&1
then
        against=HEAD
else
        # Initial commit: diff against an empty tree object
        against=$(git hash-object -t tree /dev/null)
fi;

# If there are whitespace errors, print the offending file names and fail.
exec git diff-index --check --cached $against --
