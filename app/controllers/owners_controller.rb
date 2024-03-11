class OwnersController < ApplicationController
  def index
    @owners = Owner.all.page(params[:page]).per(15)
  end

  def show
    @owner = Owner.find(params[:id])
  end
end
