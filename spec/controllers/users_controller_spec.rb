require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  context '#index' do
    before { get :index, locale: :ua }

    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  context '#new' do
    before { xhr :get, :new, user: user, locale: :ua }

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  context '#show' do
    before { get :show, id: user, locale: :ua }

    it { should respond_with(:success) }
    it { should render_template(:show) }
  end

  describe '#edit' do
    before { get :edit, id: user, locale: :ua }

    context 'with current user' do
      before { controller.stub(:current_user).and_return(user) }

      it { should respond_with(:success) }
      it { should render_template(:edit) }
    end
  end

end
