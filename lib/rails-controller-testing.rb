require 'active_support/lazy_load_hooks'
require 'rails/controller/testing/test_process'
require 'rails/controller/testing/integration'
require 'rails/controller/testing/template_assertions'

ActiveSupport.on_load(:action_controller) do
  ActionController::TestCase.send(:include, Rails::Controller::Testing::TestProcess)
  ActionController::TestCase.send(:include, Rails::Controller::Testing::TemplateAssertions)

  ActionDispatch::IntegrationTest.send(:include, Rails::Controller::Testing::TemplateAssertions)
  ActionDispatch::IntegrationTest.send(:include, Rails::Controller::Testing::Integration)
  ActionDispatch::IntegrationTest.send(:include, Rails::Controller::Testing::TestProcess)
end

ActiveSupport.on_load(:action_view) do
  ActionView::TestCase.send(:include, Rails::Controller::Testing::TemplateAssertions)
end
