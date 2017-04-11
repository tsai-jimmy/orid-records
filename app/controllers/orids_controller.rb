class OridsController < ApplicationController
  before_action :authenticate_user!

  def index
    @orids = current_user.orids
  end

  def new
    @orid = Orid.new
  end

  def create
    @orid = Orid.new(orid_params)
    @orid.user = current_user

    @orid.save

    redirect_to orids_path
  end

  def update
    @orid = Orid.find(params[:id])

    if @orid.update(orid_params)
      redirect_to orid_path(@orid), notice: "修改成功"
    else
      render :edit
    end
  end

  def edit
    @orid = Orid.find(params[:id])
  end

  def show
    @orid = Orid.find(params[:id])
  end

  def destroy
    @orid = Orid.find(params[:id])
    @orid.destroy

    redirect_to orids_path
  end

  private

  def orid_params
    params.require(:orid).permit(:objective, :reflective, :interpretive, :decisional)
  end
end
