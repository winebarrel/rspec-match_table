lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rspec-match_table"
  spec.version       = '0.1.1'
  spec.authors       = ['winebarrel']
  spec.email         = ['sugawara@winebarrel.jp']

  spec.summary       = %q{Array of hashes matcher.}
  spec.description   = %q{Array of hashes matcher.}
  spec.homepage      = 'https://github.com/winebarrel/rspec-match_table'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec', '~> 3'
  spec.add_dependency 'pp_sort_hash'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
end
