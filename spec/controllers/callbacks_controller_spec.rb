require 'rails_helper'

RSpec.describe CallbacksController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Callback. As you add validations to Callback, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CallbacksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all callbacks as @callbacks" do
      callback = Callback.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:callbacks)).to eq([callback])
    end
  end

  describe "GET #show" do
    it "assigns the requested callback as @callback" do
      callback = Callback.create! valid_attributes
      get :show, {:id => callback.to_param}, valid_session
      expect(assigns(:callback)).to eq(callback)
    end
  end

  describe "GET #edit" do
    it "assigns the requested callback as @callback" do
      callback = Callback.create! valid_attributes
      get :edit, {:id => callback.to_param}, valid_session
      expect(assigns(:callback)).to eq(callback)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Callback" do
        expect {
          post :create, {:callback => valid_attributes}, valid_session
        }.to change(Callback, :count).by(1)
      end

      it "assigns a newly created callback as @callback" do
        post :create, {:callback => valid_attributes}, valid_session
        expect(assigns(:callback)).to be_a(Callback)
        expect(assigns(:callback)).to be_persisted
      end

      it "redirects to the created callback" do
        post :create, {:callback => valid_attributes}, valid_session
        expect(response).to redirect_to(Callback.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved callback as @callback" do
        post :create, {:callback => invalid_attributes}, valid_session
        expect(assigns(:callback)).to be_a_new(Callback)
      end

      it "re-renders the 'new' template" do
        post :create, {:callback => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested callback" do
        callback = Callback.create! valid_attributes
        put :update, {:id => callback.to_param, :callback => new_attributes}, valid_session
        callback.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested callback as @callback" do
        callback = Callback.create! valid_attributes
        put :update, {:id => callback.to_param, :callback => valid_attributes}, valid_session
        expect(assigns(:callback)).to eq(callback)
      end

      it "redirects to the callback" do
        callback = Callback.create! valid_attributes
        put :update, {:id => callback.to_param, :callback => valid_attributes}, valid_session
        expect(response).to redirect_to(callback)
      end
    end

    context "with invalid params" do
      it "assigns the callback as @callback" do
        callback = Callback.create! valid_attributes
        put :update, {:id => callback.to_param, :callback => invalid_attributes}, valid_session
        expect(assigns(:callback)).to eq(callback)
      end

      it "re-renders the 'edit' template" do
        callback = Callback.create! valid_attributes
        put :update, {:id => callback.to_param, :callback => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested callback" do
      callback = Callback.create! valid_attributes
      expect {
        delete :destroy, {:id => callback.to_param}, valid_session
      }.to change(Callback, :count).by(-1)
    end

    it "redirects to the callbacks list" do
      callback = Callback.create! valid_attributes
      delete :destroy, {:id => callback.to_param}, valid_session
      expect(response).to redirect_to(callbacks_url)
    end
  end

end
