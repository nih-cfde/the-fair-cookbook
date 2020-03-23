#!/bin/bash
# Repurposed from https://github.com/yegor256/jekyll-github-deploy/blob/master/bash/deploy.sh
set -x
set -e
set -o pipefail

URL=$(git config --get remote.origin.url)
BRANCH=gh-pages
BRANCH_FROM=master
SRC=$(pwd)
TEMP=$(mktemp -d -t jgd-XXX)
trap "rm -rf ${TEMP}" EXIT
CLONE=${TEMP}/clone
COPY=${TEMP}/copy

echo -e "Cloning Github repository:"
git clone -b "${BRANCH_FROM}" "${URL}" "${CLONE}"
cp -R ${CLONE} ${COPY}

cd "${CLONE}"

echo -e "\nBuilding Jekyll site:"
if [ -e _site ]; then
  rm -rf _site
fi

# Setup python environment
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt

# Setup Ruby environment
bundle install --path vendor/bundle

# Setup jupyter book
make install

# Install site
make site

if [ ! -e _site ]; then
  echo -e "\nJekyll didn't generate anything in _site!"
  exit -1
fi

cp -R _site ${TEMP}

cd ${TEMP}
rm -rf ${CLONE}
mv ${COPY} ${CLONE}
cd ${CLONE}

echo -e "\nPreparing ${BRANCH} branch:"
if [ -z "$(git branch -a | grep origin/${BRANCH})" ]; then
  git checkout --orphan "${BRANCH}"
else
  git checkout "${BRANCH}"
fi

echo -e "\nDeploying into ${BRANCH} branch:"
rm -rf *
cp -R ${TEMP}/_site/* .
rm -f README.md
git add .
git commit -am "new version $(date)" --allow-empty
git push origin ${BRANCH} 2>&1 | sed 's|'$URL'|[skipped]|g'

echo -e "\nCleaning up:"
rm -rf "${CLONE}"
rm -rf "${SITE}"
