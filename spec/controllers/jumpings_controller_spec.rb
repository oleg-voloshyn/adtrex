require 'rails_helper'

RSpec.describe JumpingsController, type: :controller do
  let(:jumping) { FactoryGirl.build(:jumping) }
  let(:valid_params) { FactoryGirl.attributes_for(:jumping) }
  let(:invalid_params) { FactoryGirl.attributes_for(:jumping, name: '') }


  describe '#new' do
    before { get :new, jumping: jumping }

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  describe '#create' do

    context 'whith valid params' do
      before { post :create, jumping: valid_params }

      it { should respond_with(:success) }
      it { should render_template(:show) }
    end

    context 'whith invalid params' do
      before { post :create, jumping: invalid_params }

      it { should respond_with(:success) }
      it { should render_template(:new) }
    end
  end
end
