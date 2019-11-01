# motion-html

Parse and traverse HTML in your RubyMotion app. It's like Nokogiri for RubyMotion!

`motion-html` uses [HTMLKit](https://github.com/iabudiab/HTMLKit) under the hood.

Currently, only iOS and OS X are supported.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-html', '~> 2.0'

And then execute:

    $ bundle && rake pod:install

## Usage

Initialize a new document:
```ruby
doc = Motion::HTML::Doc.new(html)
# or simply:
doc = HTML.parse(html)
```

Then query using CSS3 selectors to find one or an array of elements:
```ruby
array_of_links = doc.all('.photos li a')
first_li = doc.first('.photos li')
element = doc.find('#one-and-only')
```

Each item returned from a query will be an `Element` object. You can then access attributes or text content:
```ruby
links = doc.all('.photos li a')
links.each do |el|
  puts "Link tag: " + el.tag
  puts "Link text: " + el.text
  puts "Link URL: " + el['href']
  puts "Link attributes: " + el.attributes.inspect
end
```

With an `Element`, you can traverse to its parent, children, or next sibling:
```ruby
first_list_item = doc.first('.photos li')
unordered_list = first_list_item.parent
links = first_list_item.children
second_list_item = first_list_item.next_sibling
```

See the [`main_spec.rb`](https://github.com/andrewhavens/motion-html/blob/master/spec/main_spec.rb) file for more examples.

Feel like something is missing? Submit a GitHub issue if you need anything other features.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
MIT
