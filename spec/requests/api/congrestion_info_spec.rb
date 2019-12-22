require 'rails_helper'

describe 'Api::CongrestionInfosController', type: :request do
  describe "post message" do
    it "should not increment the Message count" do
      expect do
        post api_shop_congrestion_infos_path,
          params: { shop_id: 1,
                    congrestion_info_id: 1
                  }
      end.to change(ShopCongrestionInfos, :count).by(1)
    end
    it "should not increment the Message count" do
      post api_shop_congrestion_infos_path,
        params: { shop_id: 1,
                  congrestion_info_id: 1
                }
      expect(json[:status]).to eq('ok')
    end
  end
end
