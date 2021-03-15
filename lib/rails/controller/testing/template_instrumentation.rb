module Rails
  module Controller
    module Testing
      module InstrumentDetermineTemplate
        def determine_template(options)
          super.tap do |found|
            if found
              instrument_payload = { template_identifier: found.identifier, virtual_path: found.virtual_path, options: options }
              ActiveSupport::Notifications.instrument("determine_template.rails_controller_testing", instrument_payload)
            end
          end
        end
      end
    end
  end
end