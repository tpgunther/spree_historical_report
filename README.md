Spree Historical Report
=====================

This gem allows Spree to store and generate a simple report of the SKU and the date when a products is out of stock.

## Demo

A demo is available at http://spree-historical-report.herokuapp.com

The historical report is in the administration backend, in the report section, under historical report

  ```
    user: spree@example.com
    pass: spree123
  ```

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_historical_report', github: 'tpgunther/spree_historical_report', branch: '3-1-stable'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_historical_report:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

Copyright (c) 2016 Tomás Günther, released under the New BSD License
