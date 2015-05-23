class AssignsController < ActionController::Base
  def test_assigns
    @foo = "foo"
    @foo_hash = { foo: :bar }
    render nothing: true
  end
end
