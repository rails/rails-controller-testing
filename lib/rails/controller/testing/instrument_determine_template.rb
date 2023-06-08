module Rails
  module Controller
    module Testing
      module InstrumentDetermineTemplate
        def determine_template(options)
          super.tap do |template|
            if template.is_a?(ActionView::Template::RawFile)
              ActiveSupport::Notifications.instrument(
                "!render_template.action_view",
                { virtual_path: nil, identifier: template.identifier }
              )
            end
          end
        end
      end
    end
  end
end
