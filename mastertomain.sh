#! /bin/sh


REMOTE=origin

if [ $# -eq 1 ]
	then 
		REMOTE=$1 # replace origin with the user's name for their remote

fi

URLPART=`git remote get-url ${REMOTE} | cut -d ":" -f 2 | cut -d "." -f 1`

# Make sure your master branch is up to date
git checkout master
git pull ${REMOTE} master 

checkout -b main # copy master into main
git push origin main # push main branch

echo "OK! The main branch has been pushed to your remote. Click on the following link to set it to the default branch!"
echo ""
echo ">>>>> https://github.com/${URLPART}/settings/branches"
echo ""
echo "Afterwards, run"
echo ""
echo ">>>>> git branch -d master"
echo ">>>>> git push -d ${REMOTE} master"
echo ""
echo "to remove the master branch."
