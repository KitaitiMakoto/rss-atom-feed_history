require 'rss/atom/feed_history'
require 'rss/maker'

module RSS
  module Maker
    module Atom
      module FeedHistory
        class << self
          def append_features(klass)
            super

            ::RSS::Atom::FeedHistory::ELEMENTS.each do |name|
              full_name = "#{::RSS::Atom::FeedHistory::PREFIX}_#{name}"
              klass.def_other_element full_name
            end
          end
        end
      end
    end

    class ChannelBase; include Atom::FeedHistory; end
  end
end
