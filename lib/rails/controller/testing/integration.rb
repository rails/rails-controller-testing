require 'action_pack'

module Rails
  module Controller
    module Testing
      module Integration
        http_verbs = %w(get post patch put head delete)

        if ActionPack.version < Gem::Version.new('5.1')
          http_verbs.push('xhr', 'xml_http_request', 'get_via_redirect', 'post_via_redirect')
        end

        http_verbs.each do |method|
          if ActionPack.version < Gem::Version.new('5.1')
            define_method(method) do |path, *args|
              reset_template_assertion
              super(path, *args)
            end
          else
            define_method(method) do |path, **args|
              reset_template_assertion
              super(path, **args)
            end
          end
        end
      end
    end
  end
end
