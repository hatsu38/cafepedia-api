require 'rails_helper'

describe Comment, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:comment)).to be_present
    end
  end

  describe 'Validations' do
    subject { build(:comment) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:shop).class_name('Shop') }
  end
end
