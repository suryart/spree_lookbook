# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_lookbook'
  s.version     = '1.3.0'
  s.summary     = 'Spree Look Book for creating a look from a group of different products.'
  s.description = 'Spree Look Book enables you to create or edit looks(collection of products) or themes to show a style, or stylist or a clothing line, from admin interface. This gives customers/viewers ideas on how to style outfits, or to show what the latest fashions are.'
  s.required_ruby_version = '>= 1.9.2'

  s.author    = 'Surya Tripathi'
  s.email     = 'raj.surya19@gmail.com'
  s.homepage  = 'https://github.com/suryart/spree_lookbook'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.3.0'

  s.add_development_dependency 'capybara', '~> 2.0.2'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2.0'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'guard-rspec',  '3.0.2'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
