# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.name          = "motion-html"
  spec.version       = "2.0.1"
  spec.authors       = ["Andrew Havens"]
  spec.email         = ["email@andrewhavens.com"]
  spec.description   = %q{Parse and traverse HTML in your RubyMotion app. It's like Nokogiri for RubyMotion!}
  spec.summary       = %q{Parse and traverse HTML in your RubyMotion app. It's like Nokogiri for RubyMotion!}
  spec.homepage      = "https://github.com/andrewhavens/motion-html"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "motion-cocoapods"
  spec.add_development_dependency "rake"
end
