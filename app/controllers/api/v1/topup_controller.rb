class Api::V1::TopupController < ApplicationController
  before_action :authenticate_user!
  def new
    topup = Topup.new
  end

  def create
    
  end
end
