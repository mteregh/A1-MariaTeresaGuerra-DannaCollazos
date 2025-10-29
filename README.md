# README


## Troubleshooting

If you had already created database for this project and you're dealing with some problems with migrations you should run the next commands:

```bash
bin/rails db:drop
rm db/schema.rb
bin/rails db:prepare
bin/rails db:migrate
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
