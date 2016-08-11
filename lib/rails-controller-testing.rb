require 'active_support/lazy_load_hooks'
require 'rails/controller/testing/test_process'
require 'rails/controller/testing/integration'
require 'rails/controller/testing/template_assertions'
require 'rails/controller/testing/version'

class Rails::Controller::Testing::Railtie < Rails::Railtie
  initializer "rails_controller_testing" do
    ActiveSupport.on_load(:action_controller) do
      ActionController::TestCase.include Rails::Controller::Testing::TestProcess
      ActionController::TestCase.include Rails::Controller::Testing::TemplateAssertions

      ActionDispatch::IntegrationTest.include Rails::Controller::Testing::TemplateAssertions
      ActionDispatch::IntegrationTest.include Rails::Controller::Testing::Integration
      ActionDispatch::IntegrationTest.include Rails::Controller::Testing::TestProcess
    end

    ActiveSupport.on_load(:action_view) do
      ActionView::TestCase.include Rails::Controller::Testing::TemplateAssertions
    end
  end
end
