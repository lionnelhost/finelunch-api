# Project

[Finelunch](https://finelunch.herokuapp.com) is a web base application design to manage lunch ordering for FineTech Group. 

## Install

### Clone the repository

```shell
git clone https://github.com/lionnelhost/finelunch-api.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.3`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.3
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

create 
```shell 
    .env
``` 
file and setup env variables

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```

## Deploy

soon

