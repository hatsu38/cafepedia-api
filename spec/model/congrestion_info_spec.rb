require 'rails_helper'

describe CongrestionInfo, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:congrestion_info)).to be_present
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:shops).through(:shop_congrestion_infos) }
  end

  describe 'Validations' do
    subject { build(:congrestion_info) }

    it { is_expected.to validate_presence_of(:name) }
  end
end
