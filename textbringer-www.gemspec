lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "textbringer/www/version"

Gem::Specification.new do |spec|
  spec.name          = "textbringer-www"
  spec.version       = Textbringer::Www::VERSION
  spec.authors       = ["Koichiro Ohba"]
  spec.email         = ["koichiro.ohba@gmail.com"]

  spec.summary       = %q{World Wide Web Browser for Textbringer.}
  spec.description   = %q{World Wide Web Browser for Textbringer.}
  spec.homepage      = "https://github.com/koichiro/textbringer-www"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "oga", "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
