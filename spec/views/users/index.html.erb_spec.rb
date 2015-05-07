require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(new_user),
      User.create!(new_user)
    ])
  end

  it "renders a list of users" do
    render
  end
end
