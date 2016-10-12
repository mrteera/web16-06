require 'rails_helper'

RSpec.describe UserStatController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      sign_in FactoryGirl.create(:admin)
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns access denied" do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      sign_in FactoryGirl.create(:member)
      get :index
      expect(response).to redirect_to(root_path)
      expect(flash[:error]).to be_present
    end
  end
end
