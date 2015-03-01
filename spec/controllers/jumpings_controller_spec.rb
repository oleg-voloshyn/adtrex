require 'rails_helper'

RSpec.describe JumpingsController, type: :controller do
  let(:jumping) { FactoryGirl.create(:jumping) }
  let(:valid_params) { FactoryGirl.attributes_for(:jumping) }
  let(:invalid_params) { FactoryGirl.attributes_for(:jumping, name: '') }


  context '#index' do
    before { get :index }
    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  context '#new' do
    before { xhr :get, :new, jumping: jumping }

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  context '#show' do
    before { get :show, id: jumping }

    it { should respond_with(:success) }
    it { should render_template(:show) }
  end

  describe '#create' do

    context 'whith valid params' do
      before { post :create, jumping: valid_params }

      it { should respond_with(:success) }
      it { should render_template(:show) }
    end

    context 'whith invalid params' do
      before { xhr :post, :create, jumping: invalid_params }

      it { should respond_with(:success) }
      it { should render_template(:new) }
    end
  end

  context '#edit' do
    before { xhr :get, :edit, id: jumping }

    it { should respond_with(:success) }
    it { should render_template(:edit) }
  end

  describe '#update' do

    context 'whith valid params' do
      before { put :update, id: jumping, jumping: valid_params }

      it { should respond_with(:success) }
      it { should render_template(:show) }
    end

    context 'whith invalid params' do
      before { xhr :put, :update, id: jumping, jumping: invalid_params }

      it { should respond_with(:success) }
      it { should render_template(:edit) }
    end
  end

  context '#destroy' do
    before {delete :destroy, id: jumping }

    it { should redirect_to(root_path) }
  end

end
