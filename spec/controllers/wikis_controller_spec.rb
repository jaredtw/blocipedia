require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:user) { User.create!(email: "user@example.com", password: "password", confirmed_at: Date.today) }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: user) }

  before do
      sign_in(user)
    end

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: wiki.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
        get :show, id: wiki.id
        expect(response).to render_template :show
      end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
        get :new, id: wiki.id
        expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new, id: wiki.id
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Wiki by 1" do
      expect{ wiki }.to change(Wiki, :count).by(1)
    end

    it "assigns the new wiki to @wiki" do
      post :create, id: wiki.id, wiki: {title: "New Wiki Title", body: "New Wiki Body"}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new post" do
      post :create, id: wiki.id, wiki: {title: "New Wiki Title", body: "New Wiki Body"}
      expect(response).to redirect_to [Wiki.last]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: wiki.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
        get :edit, id: wiki.id
        expect(response).to render_template :edit
    end

    it "assigns wiki to be updated to @wiki" do
      get :edit, id: wiki.id
      post_instance = assigns(:wiki)

      expect(post_instance.id).to eq wiki.id
      expect(post_instance.title).to eq wiki.title
      expect(post_instance.body).to eq wiki.body
    end
  end

  describe "PUT update" do
    it "updates wiki with expected attributes" do
      new_title = "New Wiki Title"
      new_body = "New Wiki Body"

      put :update, id: wiki.id, wiki: {title: new_title, body: new_body}

      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end

    it "redirects to the updated wiki" do
      new_title = "New Wiki Title"
      new_body = "New Wiki Body"

      put :update, id: wiki.id, wiki: {title: new_title, body: new_body}

      expect(response).to redirect_to [wiki]
    end
  end

  describe "DELETE destroy" do
    it "deletes teh wiki" do
      delete :destroy, id: wiki.id
      count = Wiki.where({id: wiki.id}).size
      expect(count).to eq 0
    end

    it "redirects to wiki index" do
      delete :destroy, id: wiki.id
      expect(response).to redirect_to(wiki)
    end
  end

end
