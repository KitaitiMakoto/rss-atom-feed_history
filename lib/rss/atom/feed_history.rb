require 'rss/atom'
require "rss/atom/feed_history/version"

module RSS
  module Atom
    module FeedHistory
      PREFIX = 'fh'
      URI = 'http://purl.org/syndication/history/1.0'
      ELEMENTS = [
        'complete',
        'archive'
      ]

      class << self
        def included(klass)
          ELEMENTS.each do |name|
            full_name = "#{PREFIX}_#{name}"
            klass.install_have_child_element(name, URI, '?', full_name)
          end
        end
      end

      def complete?
        !!fh_complete
      end
      
      def archived?
        !!fh_archive
      end

      ELEMENTS.each do |name|
        module_eval(<<-EOC, *Utils.get_file_and_line_from_caller(0))
          class #{Utils.to_class_name(name)} < Element
            install_must_call_validator(FeedHistory::PREFIX, FeedHistory::URI)

            class << self
              def required_prefix
                PREFIX
              end

              def required_uri
                URI
              end
            end

            @tag_name = #{name.dump}

            def full_name
              tag_name_with_prefix(PREFIX)
            end

            def to_s(need_conevert=true, indent='')
              # want to use Element#tag method
              make_start_tag(indent, indent + INDENT, {}) + '/>'
            end
          end
        EOC

        BaseListener.install_class_name(URI, name, Utils.to_class_name(name))
      end
    end

    class Feed
      include FeedHistory
    end
  end
end
