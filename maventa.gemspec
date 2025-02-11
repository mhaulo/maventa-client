require_relative "lib/maventa/version"

Gem::Specification.new do |s|
  s.name        = "maventa"
  s.version     = Maventa::VERSION
  s.summary     = "Maventa API gem"
  s.description = s.summary
  s.authors     = ["Mika Haulo"]
  s.email       = "mika@hey.com"
  s.files       = Dir["CHANGELOG.md", "LICENSE", "README.md", "Rakefile", "lib/**/*.rb"]
  s.homepage    = "https://github.com/mhaulo/maventa"
  s.license     = "MIT"
  
  s.require_path = "lib"
  s.required_ruby_version = ">= 2.7"
  
  s.add_runtime_dependency "faraday", "~> 2"
  s.add_runtime_dependency "faraday-multipart", "~> 1.1"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "nokogiri"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "byebug"
  s.add_development_dependency "vcr"
  s.add_development_dependency "dotenv"
  
  s.metadata["rubygems_mfa_required"] = "true"
end
