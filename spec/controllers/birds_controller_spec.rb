require 'rails_helper'
RSpec.describe BirdsController, type: :controller do
  render_views

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all birds as @birds" do
      FactoryGirl.create_list(:bird, 3)
      get :index, { :format => :json }, valid_session
      expect(response.status).to eq 200
      expect(response).to match_response_schema("birds")
    end
  end


  describe "GET #show" do
    it "assigns the requested bird as @bird" do
      bird = FactoryGirl.create(:bird)
      get :show, {:id => bird.id, :format => :json }, valid_session
      expect(assigns(:bird)).to eq(bird)
      expect(response).to match_response_schema("get_bird_id")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Bird" do
        expect {
          bird = FactoryGirl.attributes_for(:bird).merge({:continents_attributes => [FactoryGirl.attributes_for(:continent)]})
          post :create, {:bird => bird, :format => :json }, valid_session
        }.to change(Bird, :count).by(1)
        expect(response).to match_response_schema("post_bird_response")
      end

      it "assigns a newly created bird as @bird" do
        bird = FactoryGirl.attributes_for(:bird).merge({:continents_attributes => [FactoryGirl.attributes_for(:continent)]})
        post :create, {:bird => bird, :format => :json }, valid_session
        expect(assigns(:bird)).to be_a(Bird)
        expect(assigns(:bird)).to be_persisted
      end

      it "Invalid created bird" do
        bird = FactoryGirl.attributes_for(:bird)
        post :create, {:bird => bird, :format => :json }, valid_session
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bird" do
      bird = FactoryGirl.create(:bird)
      expect {
        delete :destroy, {:id => bird.id, :format => :json }, valid_session
      }.to change(Bird, :count).by(-1)
    end

    it "redirects to the birds list" do
      bird = FactoryGirl.create(:bird)
      delete :destroy, {:id => bird.id, :format => :json }, valid_session
      expect(response.status).to eq 204
    end
  end

end
