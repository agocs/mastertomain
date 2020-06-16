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
Warning: Permanently added the RSA host key for IP address '140.82.114.3' to the list of known hosts.
From github.com:agocs/fullwidth
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master
Already up to date.
Switched to a new branch 'main'
Warning: Permanently added the RSA host key for IP address '140.82.113.3' to the list of known hosts.
Total 0 (delta 0), reused 0 (delta 0)
remote:
remote: Create a pull request for 'main' on GitHub by visiting:
remote:      https://github.com/agocs/fullwidth/pull/new/main
remote:
To github.com:agocs/fullwidth.git
 * [new branch]      main -> main
OK! The main branch has been pushed to your remote. Click on the following link to set it to the default branch!

>>>>> https://github.com/agocs/fullwidth/settings/branches

Once you've done that, I'll clean up here by running the following commands:
  - git branch -d master
  - git push -d origin master
  - git remote set-head origin main

If you'd like to continue, press y. Otherwise, press any other key.
Continue? [y/N]
```

Now click the link into Github and change your default branch! If everything looks good, press `y` (and then press enter), and the script will clean up for you.

```
If you'd like to continue, press y. Otherwise, press any other key.
Continue? [y/N] y
OK, cleaning up!
Deleted branch master (was 62e9a23).
To github.com:agocs/fullwidth.git
 - [deleted]         master
```


## Something's gone wrong!

If something's messed up, no need to worry! If you haven't changed your default branch, you can undo these changes by:

```
git branch -d main
git push -d origin main #replace "origin" with the name of your remote if necessary
```

This will remove the `main` branch both locally and remotely, so you can make whatever changes you need to make to your master before re-running the script.
