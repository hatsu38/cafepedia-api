# frozen_string_literal: true

module Api
  class PopularMainShopsController < ApplicationController
    def index
      @main_shops = MainShop.popular.eager_load(:shops)
    end
  end
end
