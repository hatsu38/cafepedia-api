# frozen_string_literal: true

module Api
  class MainShopsController < ApplicationController
    def index
      @main_shops = MainShop.all
    end
  end
end
