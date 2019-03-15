require 'active_support/lazy_load_hooks'
require 'rails/controller/testing/test_process'
require 'rails/controller/testing/integration'
require 'rails/controller/testing/template_assertions'
require 'rails/controller/testing/template_instrumentation'

module Rails
  module Controller
    module Testing
      def self.install
        ActiveSupport.on_load(:action_controller_test_case) do
          include Rails::Controller::Testing::TestProcess
          include Rails::Controller::Testing::TemplateAssertions
          ActionView::TemplateRenderer.prepend(InstrumentDetermineTemplate)
        end

        ActiveSupport.on_load(:action_dispatch_integration_test) do
          include Rails::Controller::Testing::TemplateAssertions
          include Rails::Controller::Testing::Integration
          include Rails::Controller::Testing::TestProcess
          ActionView::TemplateRenderer.prepend(InstrumentDetermineTemplate)
        end

        ActiveSupport.on_load(:action_view_test_case) do
          include Rails::Controller::Testing::TemplateAssertions
          ActionView::TemplateRenderer.prepend(InstrumentDetermineTemplate)
        end
      end
    end
  end
end
