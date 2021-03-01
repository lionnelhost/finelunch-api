This is a Code convention for branching 


## Naming convention for branches 
  - every branch should follow this convention [initials]-[name of feature]
  - Example : pl-create-user-authentification  (pl for Patrick Lionnel)
  - there is a develop branch from wich all branches should be checked out 
  - there is a main branch from wich develop are checked out

## Convention for Pull Request 

  - checkout your working branch from develop 
  - make sure to analyse and break down your feature before start 
  - please Review you code befor make a pull request to develop 
  - if you have a subtask, make the your subtask PR from to the maintask branch  and the maintask branch will target Develop 
  - we need two valid PR before merge the PR 
  - make sure to add reviewer when you submit a pull request and add the related bagdes


## Git Workflow 

```shell 
  git checkout develop
  git pull origin develop 
  
  git checkout -b your-branch-name
  git add . 
  git commit -m "your commit message" 
  git push origin your-branch-name 
 ```
 
 Then go to github, fill the PR template, add reviewers, related badges and sub;it your Pull Request