#!/bin/bash
git $@
erro=$?
if [[ $erro != 0 ]] 
then
	exit $erro
fi
if [[ $1 == "push" ]]
then
	if [[ $(expr $(date +%s) - $(git log -1 --date=raw | tail -n +3 | replace ' ' '' | replace Date: '' | cut -d '+' -f -1 | head -n 1)) > 60 ]]
	then
		echo took longer than 60 seconds
		break
	fi
echo Commited:\"$(git log -1 | tail -n +5)\" in $(git remote get-url origin) | tweet
fi
