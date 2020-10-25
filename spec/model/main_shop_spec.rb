require 'rails_helper'

describe MainShop, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(main_shops(:test_main_shop)).to be_present
    end
  end

  describe 'Validations' do
    subject { build(:main_shop) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:eng_name) }
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:shops) }
  end
end
