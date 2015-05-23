class ViewAssignsController < ActionController::Base
  def test_assigns
    @foo = "foo"
    render nothing: true
  end

  def view_assigns
    { "bar" => "bar" }
  end
end
