module Motion
  module HTML
    def self.parse(html)
      Doc.new(html)
    end

    class Doc
      def initialize(html)
        @doc = HTMLDocument.documentWithString(html)
      end

      def all(q)
        nodes = @doc.querySelectorAll(q)
        nodes.map {|node| Element.new(node) }
      end

      def first(q)
        all(q).first
      end

      alias_method :find, :first
    end

    class Element
      def initialize(element)
        @element = element
      end

      def tag
        @element.tagName
      end

      def text
        @element.textContent
      end

      def attributes
        @element.attributes
      end

      def [](key)
        attributes[key]
      end

      def parent
        el = @element.parentNode
        Element.new(el) if el.is_a? HTMLElement
      end

      def children
        elements = []
        @element.childNodes.each do |node|
          elements << Element.new(node) if node.is_a? HTMLElement
        end
        elements
      end

      def next_sibling
        el = @element.nextSibling
        el = el.nextSibling if el.is_a? HTMLText
        Element.new(el) if el.is_a? HTMLElement
      end

      def inspect
        to_html
      end

      def to_html
        @element.outerHTML
      end
    end
  end
end

HTML = Motion::HTML
