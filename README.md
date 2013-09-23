# Welcome to Spree Look Book

Spree Look Book enables you to create or edit looks(collection of products) or themes to show a style, or stylist or a clothing line from admin interface. A lookbook can be described as "fashion diaries" because fashion bloggers are constantly updating them on a daily or weekly basis. This gives customers/viewers ideas on how to style outfits, or to show what the latest fashions are. Looks can be created from admin interface by adding a group of different products(For example: A shirt, pants, shoes, and so on..). Those looks can be later put on store in a group(*a.ka. Look Book*).

For more information: [Lookbook](http://en.wikipedia.org/wiki/Lookbook)

----------

[![Dependency Status](https://gemnasium.com/suryart/spree_lookbook.png)](https://gemnasium.com/suryart/spree_lookbook) 
[![Code Climate](https://codeclimate.com/github/suryart/spree_lookbook.png)](https://codeclimate.com/github/suryart/spree_lookbook)
[![Build Status](https://travis-ci.org/suryart/spree_lookbook.png?branch=1-3-stable)](https://travis-ci.org/suryart/spree_lookbook)
[![Coverage Status](https://coveralls.io/repos/suryart/spree_lookbook/badge.png?branch=1-3-stable)](https://coveralls.io/r/suryart/spree_lookbook?branch=1-3-stable)

## INSTALLATION

### In a rails application with Spree installed include the following line in your Gemfile:
  * Get the latest greatest from github: 
    
      ```ruby
        gem 'spree_lookbook' , :git => 'git://github.com/suryart/spree_lookbook.git'
      ```

  * Get the 1-3-stable branch for Spree 1.3.x from github: 
    
      ```ruby
        gem 'spree_lookbook' , :git => 'git://github.com/suryart/spree_lookbook.git', :branch => '1-3-stable'
      ```

  * Or get it from rubygems.org by mentioning the following line in your Gemfile:
    
      ```ruby 
        gem 'spree_lookbook', '1.3.0'
      ```

### Then run the following commands: 

    $ bundle install
    $ rails g spree_lookbook:install 
    $ rake db:migrate
    $ rails s 


## TODOs

* Improve testing and write more test cases.
* Enhance the admin interface for lookbook and looks.

## Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_lookbook/factories'
```


## Contributing

1. [Fork](https://help.github.com/articles/fork-a-repo) the project
2. Make one or more well commented and clean commits to the repository. You can make a new branch here if you are modifying more than one part or feature.
3. Add tests for it. This is important so I don’t break it in a future version unintentionally.
4. Perform a [pull request](https://help.github.com/articles/using-pull-requests) in github's web interface.

## NOTE

The current version supports Spree 1.3.x. Older/ Latest versions of Spree are unlikely to work, so attempt at your own risk.


## License
Copyright (c) 2013 Surya Tripathi, released under the New BSD License
