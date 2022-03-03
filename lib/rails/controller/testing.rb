require 'active_support/lazy_load_hooks'
require 'rails/controller/testing/test_process'
require 'rails/controller/testing/integration'
require 'rails/controller/testing/template_assertions'
require 'rails/controller/testing/instrument_determine_template'

module Rails
  module Controller
    module Testing
      def self.install
        ActiveSupport.on_load(:action_controller_test_case) do
          include Rails::Controller::Testing::TestProcess
          include Rails::Controller::Testing::TemplateAssertions
        end

        ActiveSupport.on_load(:action_dispatch_integration_test) do
          include Rails::Controller::Testing::TemplateAssertions
          include Rails::Controller::Testing::Integration
          include Rails::Controller::Testing::TestProcess
        end

        if ActiveSupport::VERSION::MAJOR >= 6
          ActiveSupport.on_load(:action_view) do
            ActionView::TemplateRenderer.prepend(InstrumentDetermineTemplate)
          end
        end

        ActiveSupport.on_load(:action_view_test_case) do
          include Rails::Controller::Testing::TemplateAssertions
        end
      end
    end
  end
end
