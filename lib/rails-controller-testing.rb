require 'rails/controller/testing/test_process'
require 'rails/controller/testing/integration'
require 'rails/controller/testing/template_assertions'

module ActionController
  class TestCase
    include Rails::Controller::Testing::TestProcess
    include Rails::Controller::Testing::TemplateAssertions
  end
end

module ActionDispatch
  class IntegrationTest
    include Rails::Controller::Testing::TemplateAssertions
    include Rails::Controller::Testing::Integration
  end
end

module ActionView
  class TestCase
    include Rails::Controller::Testing::TemplateAssertions
  end
end
