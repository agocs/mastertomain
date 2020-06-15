#! /bin/sh
set -e

REMOTE=origin

if [ $# -eq 1 ]
	then 
		REMOTE=$1 # replace origin with the user's name for their remote

fi

URLPART=`git remote get-url ${REMOTE} | cut -d ":" -f 2 | cut -d "." -f 1`

# Make sure your master branch is up to date
git checkout master
git pull ${REMOTE} master 

git checkout -b main # copy master into main
git push ${REMOTE} main # push main branch

echo "OK! The main branch has been pushed to your remote. Click on the following link to set it to the default branch!"
echo ""
echo ">>>>> https://github.com/${URLPART}/settings/branches"
echo ""
echo "Once you've done that, I'll clean up here by running the following commands:"
echo "  - git branch -d master"
echo "  - git push -d ${REMOTE} master"
echo "  - git remote set-head ${REMOTE} main"
echo ""
echo "If you'd like to continue, press y. Otherwise, press any other key."

read -r -p "Continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
	echo "OK, cleaning up!"
        git branch -d master
	git push -d ${REMOTE} master
	git remote set-head ${REMOTE} main
        ;;
    *)
	echo "OK, exiting without changing anything else"
        exit 1
        ;;
esac
