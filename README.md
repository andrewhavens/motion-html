# Motion::HTML

Parse and traverse HTML in your RubyMotion app. It's like Nokogiri for RubyMotion!

Motion::HTML uses [HTMLKit](https://github.com/iabudiab/HTMLKit) under the hood.

Currently, only iOS and OS X are supported.

## Installation

Add this line to your application's Gemfile:

    gem 'motion-html'

And then execute:

    $ bundle && rake pod:install

## Usage

Initialize a new document:
```ruby
doc = Motion::HTML::Doc.new(html)
# or simply:
doc = Motion::HTML.parse(html)
```

Then query using css or xpath selectors. It returns an array of nodes:
```ruby
nodes = doc.query('.photos li a')
```

Iterate over the results, and use the attributes or content:
```ruby
nodes.each do |node|
  puts "Link text: " + node.text
  puts "Link URL: " + node['href']
end
```

So far, these are the only features that I have needed. Feel free to submit a GitHub issue if you need anything else.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
MIT
