# StudentsAPI

This is a job interview assignment for the internship at one of Vkontakte's services. 

So this application is written in [Ruby](https://www.ruby-lang.org/en/) using [Rails](https://rubyonrails.org/) framework. The terms of reference for this API is located at [`docs/openapi.yml`](https://github.com/temaxuck/students-api/blob/main/docs/openapi.yaml).

## Requirements

This application was written, tested and built with:
- Ruby (version 3.0.2)
- Rails (version 7.1.3.2)
- PostgreSQL (version 16.1)
- Docker (version 20.10.17)

Therefore, I cannot guaranty this application to be written, tested and built using different versions this tools.

## Getting started

### Get source code of the application

```console
$ cd /path/to/repos
$ git clone git@github.com:temaxuck/students-api.git
$ cd students-api
```

### Set environment variables

To build and run this app you are going to need to set some environment variables. Usually I create `.env` file and declare them there, but you may also use `$ export ENVVAR=VALUE` linux syntax. 

Here are necessary environment variables:

Rails variables
- SECRET_KEY_BASE (for production mode, you may generate it with `$ bin/rails secret`)
- RAILS_MAX_THREADS (optional)

Database connection variables
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_HOST
- POSTGRES_PORT
- POSTGRES_DATABASE
- POSTGRES_CI_DATABASE

Here's an example of `.env` file:

```.env
# Rails variables
RAILS_MAX_THREADS=10
# Do not expose it
SECRET_KEY_BASE=be1cbf0e9c866dad95052d4ccb6b3e70c47e47723174baeed5291c996d8d8d087216c9d7769af3b1f60c69ebac2ac10cbf44952240f1296e24d3aab3aebc4ad3
EDITOR="code --wait"

# Database connection variables
# Do not expose them
POSTGRES_USER=user
POSTGRES_PASSWORD=hackme
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DATABASE=students

POSTGRES_CI_DATABASE=test_students

```

### Run the application

To run the application you can either build it with `docker-compose` or simply run it on your machine locally.

#### Build and run with docker-compose

```console
$ docker-compose up -d
```

Now wait until the container builds and runs. 

#### Run on your machine

Install dependencies:

```console
$ bundler install
```

Run PostgreSQL database using command:

```console
$ make postgres
```

Next, create database and load schema:

```console
$ bin/rails db:create
$ bin/rails db:schema:load
```

(Optionally) Seed your database with some data:


```console
$ bin/rails db:seed
```

This is going to take a while because Ruby would have to create 3000+ records in your database, if `RAILS_ENV` environment variable is set to `development`, and 110 records, if `RAILS_ENV` is set to `production`.

### Run tests

```console
$ bin/rails test
```

## CI

For this project I use [Github Actions](https://docs.github.com/en/actions) tools. Github Actions workflow configuration file is located at [`.github/workflows/CI.yml`](https://github.com/temaxuck/students-api/blob/main/.github/workflows/CI.yml)

## Preferred way to contact me

If you would like to see me as an intern or a developer in your team, please contact me through [email](gorropand@gmail.com) (gorropand@gmail.com) or through [Telegram](t.me/temaxuck) ([t.me/temaxuck]((t.me/temaxuck)))
