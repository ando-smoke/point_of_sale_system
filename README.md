Point-of-Sale System
======================



Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
rake
sinatra
sinatra-contrib
sinatra-activerecord
pg
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system, and running in an active session. At the time of
creation of this application, Postgres 9.4 was used. To create the necessary database schema, enter the following Rake statements into the command line:
```rake
rake db:create
rake db:migrate
rake db:test:prepare
```

At the time of initial creation of this application, Ruby
version 2.2.0 was used.

Database Schema
-----

The following database schema was used for this application:

```db schema
DATABASES:
point_of_sale_dev
point_of_sale_test

TABLES:
purchases
id (integer PRIMARY KEY)
created_at (timestamp)
updated_at (timestamp)

products
id (integer PRIMARY KEY)
name (varchar)
price (float)
purchase_id (integer)
created_at (timestamp)
updated_at (timestamp)
```

Usage
-----

Upon completion of the above steps in the Installation section, open
up your preferred web browser and enter the following address:

```url
localhost:4567/
```

Initially choose "manager" or "cashier" as the user type. If the "manager" type is selected, enter one or more desired products from inventory.  If the "cashier" type is selected, the list of current products is displayed to the end user.  The user then selects one or more products to purchase.  Upon completion, the user clicks on the "Submit Purchase" button, producing a summary of all purchased products and total purchase cost.

Known Bugs
----------

None as of 2015-01-27.

Author
------

Kathryn Carr & Andy Uppendahl

License
-------

MIT license.
