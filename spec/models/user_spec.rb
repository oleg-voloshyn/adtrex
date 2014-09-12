require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) { FactoryGirl.create(:user) }

  describe '#name' do
    it 'should combine first_name & last_name' do
      expect(user.name).to eql("#{user.first_name} #{user.last_name}")
    end
  end
end
