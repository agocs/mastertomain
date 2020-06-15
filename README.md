# Master to Main

This is a simple bash script that makes changing your Github default branch from "master" to "main" as simple as possible.

## Installation

`cp mastertomain.sh /usr/local/bin/mastertomain`


## Usage

`cd` into the root directory of any Git repository whose default branch you want to change. The run:

```
mastertomain
```

`mastertomain` assumes your git remote is named "origin", but accepts one optional argument if your remote is not named origin. For example, if your remote is named "upstream", you would run `mastertomain upstream`.


You should see the following output:

```
Already on 'master'
Your branch is up to date with 'origin/master'.
From github.com:agocs/rabbit-mq-stress-tester
 * branch            master     -> FETCH_HEAD
Already up to date.
Switched to a new branch 'main'
Total 0 (delta 0), reused 0 (delta 0)
remote:
remote: Create a pull request for 'main' on GitHub by visiting:
remote:      https://github.com/agocs/rabbit-mq-stress-tester/pull/new/main
remote:
To github.com:agocs/rabbit-mq-stress-tester.git
 * [new branch]      main -> main
OK! The main branch has been pushed to your remote. Click on the following link to set it to the default branch!

>>>>> https://github.com/agocs/rabbit-mq-stress-tester/settings/branches

Afterwards, run

>>>>> git branch -d master
>>>>> git push -d origin master

to remove the master branch.
```


