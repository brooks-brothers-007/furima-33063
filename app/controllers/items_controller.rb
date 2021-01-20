class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :new
  def new
    @item = Item.new
  end  
end