module Motion
  module HTML
    def self.parse(html)
      Doc.new(html)
    end

    class Doc
      def initialize(html)
        @doc = HTMLDocument.documentWithString(html)
      end

      def query(q)
        nodes = @doc.querySelectorAll(q)
      end
    end
  end
end
