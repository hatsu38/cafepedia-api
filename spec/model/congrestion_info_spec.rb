require 'rails_helper'

describe CongrestionInfo, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:congrestion_info)).to be_present
    end
  end
end
