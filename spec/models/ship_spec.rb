require 'rails_helper'

RSpec.describe Ship, type: :model do

  it 'has a valid factory' do
    expect(FactoryBot.build(:ship)).to be_valid
  end
  
end
