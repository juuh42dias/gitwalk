# Banking Account - SA

![rspec](https://ruby.ci/badges/9fec11b5-097d-427b-bbdf-757c2aa25902/rspec)

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
* [Api Documentation](https://github.com/juuh42dias/bank_account/wiki/API-Documentation)
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
* Obs: if you have Macbook M1, maybe you should run `docker build . --platform linux/amd64` to build images using amd64 arch

## [Project Use](#project-use)
