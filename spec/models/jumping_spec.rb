require 'rails_helper'

RSpec.describe Jumping, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:free_height) }

end
