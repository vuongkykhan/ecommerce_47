require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let!(:user) {FactoryGirl.create :user}
  subject {user}

  describe "GET #show" do
    before :each do
      session[:user_id] = user.id
    end

    it "render show template" do
      get :show, params: {id: user.id}
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "rener new" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it do
      user_params = {
        user: {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          phone: Faker::PhoneNumber.phone_number,
          address: Faker::Address.street_address,
          city: Faker::Address.city,
          country: Faker::Address.country,
          password: "123456",
          password_confirmation: "123456"
        }
      }
      post :create, params: user_params
      expect(flash[:success]).to eq I18n.t("users.create.create_success")
      expect(response).to redirect_to user_path id: User.last
    end
  end

  describe "GET #edit" do
    before :each do
      session[:user_id] = user.id
    end

    it "render edit template" do
      get :edit, params: {id: user.id}
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    before :each do
      session[:user_id] = user.id
    end

    context "valid attributes" do
      user_params = {name: Faker::Name.name}
      it "changes user attributes" do
        put :update, params: {id: user.id, user: user_params}
        user.reload
        expect(user.name).to eq user[:name]
      end

      it "redirects to the book tour index" do
        put :update, params: {id: user.id, user: user_params}
        expect(flash[:success]).to eq I18n.t("users.update.update_success")
        expect(response).to redirect_to user_path id: user.id
      end
    end

    context "valid attributes" do
      it "redirects to the book tour index" do
        user_params = {name: ""}
        put :update, params: {id: user.id, user: user_params}
        expect(response).to render_template :edit
      end
    end
  end
end
