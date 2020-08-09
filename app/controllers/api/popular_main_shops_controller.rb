# frozen_string_literal: true

module Api
  class PopularMainShopsController < ApplicationController
    def index
      @main_shops = MainShop.popular.preload(:shops)
    end
  end
end
