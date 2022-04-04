## 1. Generals
-  Clone and setup local Clone:
    - In C:/Users/{username} Ordner erstellen /.ssh
    - Console Befehl: ssh-keygen U:/.ssh/id_rsa
    - Dann diesen ssh-Key in repo ablegen
- Docu Atlassian: https://www.atlassian.com/git/tutorials/setting-up-a-repository
- Commit to feature branch and then to master branch (pull request)
changes from others, but your own changes are not overwritten
- Commit to my feature branch workflow:
Commit add (in VS code: stage changes via +-symbol, only stage the files that need to be uploaded) -> git commit -m "your message" (or GNU nano editor: write comment at the end, Ctrl+X-> y -> Enter) -> git push -> end
-  you can either take it in VSCode from the commit or with git stash <filename> in git bash
- pull without committing the unwanted files: Git stash, git pull [branch], git stash pop (on e.g. master, if on local branch pop, the changes from master are gone again).
- list all branch: git branch --all / --remote
https://www.atlassian.com/git/tutorials/using-branches
- switch branch: git switch / checkout [branchName]
- if remote branch is not shown -> git fetch -> git branch --remote
- before commit, first checkout master, so that the branch is already up-to-date
- Merge Master before working on a local branch! If no features from other feature branches are needed. Howto: 
- Git update and merge master, workflow (https://gist.github.com/whoisryosuke/36b3b41e738394170b9a7c230665e6b9):
    - Git fetch (get info about the remote changes)
    - Git merge origin/master (the newest remote master branch is merged to local feature branch, the differences are also then shown to newest local master)
    - Old and outdated:  
        git checkout master  
        git fetch -p origin (--prune Before fetching, remove any remote tracking references that no longer exist on the remote.)  
        git merge origin/master  
        git checkout <feature-branch> -p origin  
        git merge master  
        Or git pull origin master = git fetch + git merge)
- on BitBucket, the general page shows the difference in terms of master, and clicking on commit id shows the differences from the previous commit
- git branches explained (well): locally you also have multiple branches which have their own status and changes you can switch between. Origin/- means remote repo. https://www.nobledesktop.com/learn/git/git-branches
-  When Merge opens MERGE_MSG.txt editor, it is because Merge is automatically a Merge, so you need to enter a Merge Message. You just type the message in the editor and close the window, so the commit is done. After that you can push git
- git ignore: personal ignore in .git/info/exclude. This is not tracked. .gitignore is tracked -all
https://www.atlassian.com/git/tutorials/saving-changes/gitignore#personal-git-ignore-rules
- "END" in Git Bash: press "Q "

## 2. git manupulation:

- Add and remove a remote: https://stackoverflow.com/questions/19097259/how-to-move-a-git-repository-into-another-directory-and-make-that-directory-a-gi
- Useful git manipulations: 13 Advanced (but useful) Git Techniques and Shortcuts
- Git revert <commit-name>: go back one commit
- Github: press '.' on a github repo opens a web version of VSCode, where you can edit code and submit commits
- Git reset --hard branch-name: hard going back and deleting all local history
Git checkout -: check out last branch you were on
