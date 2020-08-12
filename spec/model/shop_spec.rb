require 'rails_helper'

describe Shop, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:shop)).to be_present
    end
  end

  describe 'Validations' do
    subject { build(:shop) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:prefecture_name) }
    it { is_expected.to validate_presence_of(:city_name) }
    it { is_expected.to validate_presence_of(:other_address) }
    it { is_expected.to validate_presence_of(:access) }
    it { is_expected.to validate_presence_of(:lat) }
    it { is_expected.to validate_presence_of(:lng) }
    it { is_expected.to validate_presence_of(:is_open) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:main_shop).class_name('MainShop') }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:congrestion_infos).through(:shop_congrestion_infos) }
  end
end
