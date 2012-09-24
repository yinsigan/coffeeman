# CoffeeMan

It's the source of http://coffeeman.herokuapp.com , a light weight bbs for developer. like https://github.com/chloerei/code_campo

## Dependency

* ruby 1.9.3
* rails 3.2.7
* active_record

## Setup

    git clone git://github.com/yinsigan/coffeeman.git
    cd coffeeman
    bundle install
    change config/application.yml
    rake db:migrate
    rake db:seed
    rails s

## Config admin

In config/application.yml, replace admin_emails, for example:

    admin_emails:
      - "youremail@yourdomain.com"
      - "anotheradmin@yourdomain.com"

Restart application, then the user use this email will be admin.

## Deploy on heroku

    heroku create --stack cedar
    git push heroku master
    heroku run rake db:migrate
    heroku run rake db:seed
    heroku open

