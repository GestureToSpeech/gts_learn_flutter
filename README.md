# GTS Learn App
## First project launch
After launching the project in an application such as android studio, type the following commands in the console:
- `make setup`,
- `make builder`,

## Commit and Branch Naming

- Branch names must start with one of the following prefixes:
`feature/`, `style/`, `chore/`, or `fix/`.
- Branch names should include the task number from Jira, for example `feature/LA-123-new-feature`.
- Commit messages should use ":" instead of "/" and should give a brief description of the changes made,
for example: `feat: implement login functionality`.

## Generate feature
To quickly add a new feature to your application, use the command `make feature`.
Next, enter the name of the page you want to add.

## Deployment with Fastlane

- We use `fastlane` to automate the process of building, testing, and deploying our app.
- To see available commands, run `fastlane` command in the console.
- Before deploying, make sure to update the version number and build number in the `fastlane/Appfile`

## Collaboration
Each new feature/bug/chore shouldn't be merged directly to develop or master.
You should create a new branch, add changes to this new branch, create a Pull Request to develop
branch and, once it is approved, you can merge it. 

