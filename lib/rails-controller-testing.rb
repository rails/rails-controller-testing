require 'active_support/concern'

module Rails
  module Controller
    module Testing
      autoload :TemplateAssertions, 'rails/controller/testing/template_assertions'
      autoload :Integration, 'rails/controller/testing/integration'
      autoload :TestProcess, 'rails/controller/testing/test_process'

      extend ActiveSupport::Concern

      include TemplateAssertions
      include Integration
      include TestProcess
    end
  end
end
