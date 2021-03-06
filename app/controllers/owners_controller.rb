class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:search]
      @owners = Owner.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @owners = Owner.all.page params[:page]
    end
  end

  def show
    @products = @owner.products
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to owners_path, notice: "Owner was successfully created!"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @owner.update(owner_params)
      redirect_to @owner
    else
      render 'edit'
    end
  end

  def destroy
    @owner.destroy
    redirect_to owners_path, notice: "Owner was successfully deleted!"
  end

  private
    def owner_params
      params.require(:owner).permit(:name, :email, :phone)
    end

    def set_owner
      @owner = Owner.find(params[:id])
    end
end
