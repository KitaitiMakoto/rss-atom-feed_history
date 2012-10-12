require 'rss/atom/feed_history'
require 'rss/maker'

module RSS
  module Maker
    module Atom
      module FeedHistory
        class << self
          def append_features(klass)
            super

            klass.def_other_element 'fh_complete'
          end
        end
      end
    end

    class ChannelBase; include Atom::FeedHistory; end
  end
end
