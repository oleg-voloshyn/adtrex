require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  context '#index' do
    before { get :index }

    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  context '#new' do
    before { get :new, user: user }

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  context '#show' do
    before { get :show, id: user }

    it { should respond_with(:success) }
    it { should render_template(:show) }
  end

  describe '#edit' do
    before { get :edit, id: user }

    context 'with current user' do
      before { controller.stub!(:current_user).and_return(user) }

      it { should respond_with(:success) }
      it { should render_template(:edit) }
    end
  end

end
