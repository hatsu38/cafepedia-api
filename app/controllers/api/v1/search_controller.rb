module Api
  module V1
    class SearchController < ApplicationController
      PER = 20
      def index
        Shop.search_by_keywrods(params[:keyword])
      end
    end
  end
end
