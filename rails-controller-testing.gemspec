$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails/controller/testing/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-controller-testing"
  s.version     = Rails::Controller::Testing::VERSION
  s.authors     = ["Rails Core Team"]
  s.homepage    = "https://github.com/rails/rails-controller-testing"
  s.summary     = "Extracting `assigns` and `assert_template` from ActionDispatch."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.require_path = ['lib']

  s.required_ruby_version = '>= 2.2.2'

  s.add_dependency "actionpack", ">= 5.0.1", "< 6.1.x"
  s.add_dependency "actionview", ">= 5.0.1", "< 6.1.x"
  s.add_dependency "activesupport", ">= 5.0.1", "< 6.1.x"

  s.add_development_dependency "railties", "> 5.0.1", "< 6.1.x"

  if defined?(JRUBY_VERSION)
    s.add_development_dependency "jdbc-sqlite3"
    s.add_development_dependency "activerecord-jdbc-adapter"
  else
    s.add_development_dependency "sqlite3"
  end
end
