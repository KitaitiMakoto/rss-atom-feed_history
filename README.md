RSS::Atom::FeedHistory
======================

Enables standard bundled RSS library parse and make feeds including "[Feed Paging and Archiving][RFC5005]."

[RFC5005]:http://www.ietf.org/rfc/rfc5005.txt

Installation
------------

Add this line to your application's Gemfile:

    gem 'rss-atom-feed_history'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rss-atom-feed_history

Usage
-----

    require 'rss/atom/feed_history'
    
    feed = RSS::Parser.parse uri
    feed.complete? # => true when the feed includes <fh:complete/>
    arch = open(feed.previous_archive_page) if feed.archived?

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Merge Request

To do
-----

* Consideration whether the method name `***_page` is proper or not.
* Validation.
* Maker.
