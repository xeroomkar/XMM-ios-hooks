# iOS Hooks 

## Setup
* Create a new directory in your repo called `scripts`
    * Create a sub-directory within it called `hooks`
* Move all hooks (commit-msg, pre-commit, pre-push) into the `<your_repo>/scripts/hooks/` directory
* Move `setup-hooks.sh` into the `<your_repo>/scripts/` directory
* Move to the top level directory of your repo and run `./scripts/setup-hooks.sh`
    * This may require you to first run `chmod +x scripts/setup-hooks.sh` first
* Now, the hooks will be *installed*\* into `<your_repo>/.git/hooks` directory to be used in your project
    * \*Technically they are not actually there, they are symbolically/soft linked from the `.git/` directory back to the `scripts/` directory
* ???
* Profit   


## Abilities:
* `commit-msg` hook to check Jira ticket in branch name, in commit message, and that they match
* `pre-commit` hook to check commits aren't being made to develop branch or main branch
* `pre-push` hook to get an usable device ID from list of "un-booted/shutdown" devices on disk, then build and test the project before pushing

## What's the point of hooks?
* Enforce linking of a Jira ticket to commits
* Support Trunk based development or Gitflow processes by preventing the ability to make changes to `main` or `develop` branches
* Prevent engineers from pushing *app breaking* code
    * Can be considered a cost-saving exercise
        * Your CI tool reaches in to the repo, on push, to build and test the code, but fails because an engineer didn't manually check if their changes breaks build or test (a normal a typical oversight)
        * A pre-push hook will prevent this and ensure your CI tool will have no wasted builds

Overall, help enforce team/pod-wide code quality standards


## Credits
This was built to be used in the x4e-ios (Xero Me iOS) project, used here: [Xero Me iOS Repo](https://github.com/xero-github/x4e-ios)   

Inspiration (specifically for the the `setup-hooks.sh`) drawn from Xero Lite team, here: [Xero Lite iOS repo](https://github.com/xero-github/lite-ios)   
