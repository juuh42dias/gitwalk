# WIP: GitWalk :octocat:

![Ruby CI](https://github.com/juuh42dias/gitwalk/actions/workflows/ruby-ci.yml/badge.svg)

This is a simple fetcher Github Repo Stars.


## Index
* [Project dependencies](#project-dependencies)
* [Creating the database user](#creating-database-user)
* [Project Instalation](#project-instalation)
  * [Cloning Project](#cloning-project)
  * [Setup project](#setup-project)
  * [Running tests](#running-tests)
  * [Running app](#running-app)
* [Usage Gitwalk](#project-usage)
  * [Creating user](#creating-user)
  * [Retrieving data](#retrieving-data)
* [Contact](#contact)
* [Contributing](#contributing)

## [Project dependencies](#project-dependencies)
* Ruby 3.2.0
* Rails 7.0.4.2
* PostgreSQL
* Redis
* Foreman

### Follow these instrunctions to install dependencies

If you use MacOS:
**Ruby**: https://github.com/rbenv/rbenv#homebrew-on-macos
**PostgreSQL**: https://www.postgresql.org/download/macosx/
**Redis**: https://redis.io/docs/getting-started/installation/install-redis-on-mac-os/

If you use Ubuntu:
**Ruby**: https://github.com/rbenv/rbenv-installer#rbenv-installer
**PostgreSQL**:https://www.postgresql.org/download/linux/ubuntu/
**Redis**: https://redis.io/docs/getting-started/installation/install-redis-on-linux/

**Foreman**: `gem install foreman`

## [Creating database user](#creating-database-user)
* `$ sudo -u postgres psql` for Linux users
* `$ psql postgres` for Brew Mac users
* `$ create role gitwalk with createdb login password 'gitwalk123';`
or you can use pg_hba.config with [trust method](https://www.postgresql.org/docs/current/auth-trust.html#:~:text=When%20trust%20authentication%20is%20specified,and%20user%20columns%20still%20apply.)
Obs: trust IS ONLY for development local mode


## [Project Instalation](#project-instalation)
### [Cloning project](#cloning-project)
* `git clone git@github.com:juuh42dias/gitwalk.git`

### [Setup project](#setup-project)
* `bin/setup`

**Execute the bin/setup script. This script will:**

* Verify if the necessary Ruby version is installed
* Install the gems using Bundler
* Create local copies of .env and database.yml
* Create, migrate and populate the database

### [Running tests](#running-tests)
**Run!**
* Run the `bundle exec rspec` to guarantee that everything is working fine.

### [Running app](#running-app)
* If everything is ok, run `foreman s -f Procfile.dev`
you can check app running on http://localhost:3000
* Procfile runs web and worker services

* If you prefer use docker, run `docker-compose up`
* Obs: if you have Macbook M1, before run docker-compose maybe you should run `docker build . --platform linux/amd64` to build images using amd64 arch

## [Project Use](#project-use)
### [Creating user](#creating-user)
**Request:**
```shell
curl --request POST \
  --url 'http://localhost:3000/api/v1/github/users?=' \
  --header 'Content-Type: application/json' \
  --cookie BetterErrors-2.9.1-CSRF-Token=15c9505e-551f-480f-b527-72efd587d7c9 \
  --data '{
  "username": "juuh42dias"
}'
```
**Response:**
```json
{
    "user": {
        "id": 2,
        "username": "juuh42dias",
        "created_at": "2023-02-06T03:49:47.809Z",
        "updated_at": "2023-02-06T03:49:47.809Z"
    },
    "message": "We are processing your repo projects"
}
```
### [Retrieving user (with your projects)](#retrieving-data)

**Request:**
```shell
curl --request GET \
  --url 'http://localhost:3000/api/v1/github/users/juuh42dias?username=' \
  --cookie BetterErrors-2.9.1-CSRF-Token=15c9505e-551f-480f-b527-72efd587d7c9
```
**Response:**
```json
{
    "id": 2,
    "username": "juuh42dias",
    "created_at": "2023-02-06T03:49:47.809Z",
    "updated_at": "2023-02-06T03:49:47.809Z",
    "projects": [
        {
            "id": 31,
            "name": "100-days-of-code",
            "star_count": 0,
            "user_id": 2,
            "created_at": "2023-02-06T03:49:50.976Z",
            "updated_at": "2023-02-06T03:49:50.976Z"
        },
        {
            "id": 32,
            "name": "agendamento-vacina",
            "star_count": 1,
            "user_id": 2,
            "created_at": "2023-02-06T03:49:50.976Z",
            "updated_at": "2023-02-06T03:49:50.976Z"
        },
        {
            "id": 33,
            "name": "aprenda-rubyonrails",
            "star_count": 7,
            "user_id": 2,
            "created_at": "2023-02-06T03:49:50.976Z",
            "updated_at": "2023-02-06T03:49:50.976Z"
        }
    ]
}
```
Enjoy the app!

## [Contact](#contact)

[Juliana Dias](juliana.dev) – <hello@juliana.dev>

[https://gitlab.com/juuh42dias/](https://gitlab.com/juuh42dias)
[https://github.com/juuh42dias/](https://github.com/juuh42dias/)

## [Contributing](#contributing)

1. Fork it (<https://github.com/juuh42dias/bank_account/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
