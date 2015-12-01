$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails/controller/testing/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-controller-testing"
  s.version     = Rails::Controller::Testing::VERSION
  s.authors     = ["Alan Guo Xiang Tan"]
  s.email       = ["tgx_world@hotmail.com"]
  s.homepage    = "https://github.com/tgxworld/rails-controller-testing"
  s.summary     = "Extracting `assigns` and `assert_template` from ActionDispatch."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]
  s.require_path = ['lib']

  s.add_dependency "actionpack", ">= 4.2"
  s.add_dependency "actionview", ">= 4.2"
  s.add_dependency "activesupport", ">= 4.2"

  s.add_development_dependency "railties", "> 4.2"

  if defined?(JRUBY_VERSION)
    s.add_development_dependency "jdbc-sqlite3"
    s.add_development_dependency "activerecord-jdbc-adapter"
  else
    s.add_development_dependency "sqlite3"
  end
end
