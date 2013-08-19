$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "authensive_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "authensive_client"
  s.version     = AuthensiveClient::VERSION
  s.authors     = ["Jeff Casimir"]
  s.email       = ["jeff@jumpstartlab.com"]
  s.homepage    = "http://github.com/jumpstartlab/authensive_client"
  s.summary     = "A client for Jumpstart Lab's authentication service"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.14"
  s.add_dependency "faraday"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest"
end
