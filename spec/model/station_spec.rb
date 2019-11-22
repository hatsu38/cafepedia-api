require 'rails_helper'

describe Station, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:station)).to be_present
    end
  end

  describe 'Validations' do
    subject { build(:station) }

    it { is_expected.to validate_presence_of(:kana_name) }
    it { is_expected.to validate_presence_of(:kanji_name) }
    it { is_expected.to validate_uniqueness_of(:kanji_name) }
  end

  describe 'Methods' do
    describe '#search' do
      subject { described_class.search('谷') }

      let!(:stations) do
        [
          create(:station),
          create(:station, kana_name: 'しぶやえき', kanji_name: '渋谷駅')
        ]
      end
      it { is_expected.to match([stations.last]) }
    end
  end
end
