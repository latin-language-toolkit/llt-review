module LLT
  module Review::Common::Difference
    class Sentence
      include Core::Structures::HashContainable
      include Review::Helpers::ReviewReporter

      def xml_tag
        :sentence
      end

      def diff
        @container
      end

      def diff_id
        @diff_id ||= "#{id}:#{map { |_, v| v.diff_id }.join('::')}"
      end

      def all_differences
        @container.values
      end

      private

      def write_to_report(report, unique)
        report[:sentences].add_wrong(unique)
      end
    end
  end
end

