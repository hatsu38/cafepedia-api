require 'rails_helper'

# タグと研修の中間テーブルのテスト
describe ShopCongrestionInfo, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:shop_congrestion_info)).to be_present
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:shop).class_name('Shop') }
    it { is_expected.to belong_to(:congrestion_info).class_name('CongrestionInfo') }
  end
end
