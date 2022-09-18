# GTS Learn App
## First project launch
After launching the project in an application such as android studio, type the following commands in the console:
- `make setup`,
- `make builder`,

## Repository naming convention
Each branch should start with a keyword: `feature` if it is a new feature, `fix` if it is a bugfix, or `chore` if it doesn't relate to the app development itself but to some additional work that has to be done to maintain the app (e.g. documentation update, creating helper script).
Example of a branch name: `feature/add-sign-in-button`.

## Generate feature
To quickly add a new feature to your application, use the command `make feature`. Next, enter the name of the page you want to add.

## Collaboration
Each new feature/bug/chore shouldn't be merged directly to develop or master. You should create a new branch, add changes to this new branch, create a Pull Request to develop branch and, once it is approved, you can merge it. 