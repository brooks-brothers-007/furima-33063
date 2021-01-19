class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :new
  def new
  end  
  def create  
  end
end