require 'test/unit/full'
require 'rexml/document'
require 'rss/maker/atom/feed_history'

class TestFeedHistory < Test::Unit::TestCase
  def setup
    @uri = 'http://purl.org/syndication/history/1.0'
  end

  class TestMaker < TestFeedHistory
    def test_namespace_existence
      doc = REXML::Document.new(make_feed.to_s)
      assert_include doc.root.namespaces.values, @uri
    end

    def test_set_fh_element
      feed = make_feed {|maker| maker.channel.fh_complete = true}
      doc = REXML::Document.new(feed.to_s)
      fh_elements = REXML::XPath.match(doc, "//*[namespace-uri()='#{@uri}']")
      assert_not_empty fh_elements
    end

    def test_set_complete
      complete_feed = make_feed {|maker| maker.channel.fh_complete = true}
      doc = REXML::Document.new(complete_feed.to_s)
      complete_element = REXML::XPath.first(doc, "//*[namespace-uri()='#{@uri}'][local-name()='complete']")
      assert_equal '<fh:complete/>', complete_element.to_s
    end

    def test_set_archive
      archive_feed = make_feed {|maker| maker.channel.fh_archive = true}
      doc = REXML::Document.new(archive_feed.to_s)
      archive_element = REXML::XPath.first(doc, "//*[namespace-uri()='#{@uri}'][local-name()='archive']")
      assert_equal '<fh:archive/>', archive_element.to_s
    end

    def test_unset_complete
      non_complete_feed = make_feed {|maker|
        maker.channel.fh_complete = false
        maker.channel.fh_archive = true
      }
      doc = REXML::Document.new(non_complete_feed.to_s)
      complete_element = REXML::XPath.first(doc, "//*[namespace-uri()='#{@uri}'][local-name()='complete']")
      assert_nil complete_element
    end

    private

    def make_feed
      RSS::Maker.make('atom') do |maker|
        %w[id author title].each do |property|
          maker.channel.send "#{property}=", property
        end
        maker.channel.updated = Time.now

        yield maker if block_given?
      end
    end
  end
end
