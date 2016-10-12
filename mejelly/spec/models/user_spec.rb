require 'rails_helper'

RSpec.describe User, type: :model do
  it "validate is_banned" do
    @teera = FactoryGirl.create :banned_member
    assert !@teera.active_for_authentication?
  end
end
