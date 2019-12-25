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

  describe 'same_about_time_post' do
    subject { described_class.same_about_time_post }

    let(:shop_congrestion_infos) do
      [
        create(:shop_congrestion_info),
        create(:shop_congrestion_info),
        create(:shop_congrestion_info, created_at: Time.zone.now.ago(2.hours)),
        create(:shop_congrestion_info, created_at: Time.zone.now.since(2.hours))
      ]
    end

    it { is_expected.to match([shop_congrestion_infos.first, shop_congrestion_infos.second]) }
  end

  describe 'same_about_day_of_week_post' do
    subject { described_class.same_about_day_of_week_post }

    let(:shop_congrestion_infos) do
      [
        create(:shop_congrestion_info),
        create(:shop_congrestion_info),
        create(:shop_congrestion_info, created_at: Time.zone.now.ago(2.days))
      ]
    end

    it { is_expected.to match([shop_congrestion_infos.first, shop_congrestion_infos.second]) }
  end
end
