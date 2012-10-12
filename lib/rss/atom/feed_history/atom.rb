module RSS
  module Atom
    class Feed
      install_ns FeedHistory::PREFIX, FeedHistory::URI
      include FeedHistory
    end
  end
end
