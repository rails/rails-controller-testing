require 'action_pack'

module Rails
  module Controller
    module Testing
      module Integration
        http_verbs = %w(get post patch put head delete get_via_redirect post_via_redirect)
        http_verbs.push('xhr', 'xml_http_request') if ActionPack.version < Gem::Version.new('5.1')

        http_verbs.each do |method|
          define_method(method) do |*args|
            reset_template_assertion
            super(*args)
          end
        end
      end
    end
  end
end
