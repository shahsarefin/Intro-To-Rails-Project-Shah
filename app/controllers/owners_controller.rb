class OwnersController < ApplicationController
  def index
    @owners = Owner.all.page(params[:page]).per(10)
  end

  def show
    @owner = Owner.includes(:breeds).find(params[:id])
  end

end
