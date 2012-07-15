# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rss/atom/feed_history/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["KITAITI Makoto"]
  gem.email         = ["KitaitiMakoto@gmail.com"]
  gem.description   = %q{Enables standard bundled RSS library parse and make feeds including "Feed Paging and Archiving"(RFC 5005).}
  gem.summary       = %q{Feed Paging and Archiving support for standard bundled RSS library}
  gem.homepage      = "http://rss-ext.rubyforge.org/"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rss-atom-feed_history"
  gem.require_paths = ["lib"]
  gem.version       = RSS::Atom::FeedHistory::VERSION

  gem.add_development_dependency 'test-unit'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'redcarpet'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-doc'
end
