describe "Motion::HTML::Doc" do
  before do
    @doc = Motion::HTML.parse('<html>
      <body>
        <div id="find-me">Find me content</div>
        <input type="text" value="foo">
        <ul class="photos">
          <li class="first">Before: <a href="/photo1">Photo 1</a> (after)</li>
          <li><a href="/photo2">Photo 2</a></li>
        </ul>
      </body>
    </html>')
  end

  describe '#find' do
    it 'returns one element or nil' do
      element = @doc.find('#find-me')
      element.should.be.a.kind_of Motion::HTML::Element
      element.text.should == 'Find me content'

      element = @doc.find('#doesnt-exist')
      element.should.be.nil

      element = @doc.find('li')
      element['class'].should == 'first'
    end
  end

  describe '#all' do
    it 'returns an array of elements or an empty array' do
      links = @doc.all('.photos li a')
      links[0].text.should == 'Photo 1'
      links[1].text.should == 'Photo 2'
      links[0]['href'].should == '/photo1'
      links[1]['href'].should == '/photo2'

      elements = @doc.all('p')
      elements.should.be.empty
    end
  end

  describe 'Motion::HTML::Element' do
    describe '#tag' do
      it 'returns the tag name of the element' do
        @doc.find('#find-me').tag.should == 'div'
      end
    end

    describe '#text' do
      it 'returns the text content of the element and child elements' do
        element = @doc.find('#find-me')
        element.text.should == 'Find me content'

        @doc.first('.photos li').text.should == 'Before: Photo 1 (after)'
      end
    end

    describe '#attributes' do
      it 'returns a hash of attributes' do
        @doc.first('input').attributes.should == { 'type' => 'text', 'value' => 'foo' }
      end
    end

    describe '#[]' do
      it 'provides short-hand, hash-like access to attribute values' do
        @doc.first('input')['value'].should == 'foo'
      end
    end

    describe '#to_html/#inspect' do
      it 'returns a string of HTML' do
        element = @doc.find('#find-me')
        element.to_html.should == '<div id="find-me">Find me content</div>'
        element.inspect.should == '<div id="find-me">Find me content</div>'
      end
    end

    describe '#parent' do
      it 'returns a single parent element' do
        element = @doc.find('#find-me').parent
        element.tag.should == 'body'

        element = @doc.find('html').parent
        element.should.be.nil
      end
    end

    describe '#children' do
      it 'returns an array of child elements' do
        ul = @doc.find('ul.photos')
        lis = ul.children
        lis[0].tag.should == 'li'
        lis[1].tag.should == 'li'
        lis[0]['class'].should == 'first'
        lis[1]['class'].should.be.nil
      end
    end

    describe '#next_sibling' do
      it 'returns a single element or nil' do
        li = @doc.find('li.first')
        next_li = li.next_sibling
        next_li.text.should == 'Photo 2'

        next_li.next_sibling.should.be.nil
      end
    end
  end
end
