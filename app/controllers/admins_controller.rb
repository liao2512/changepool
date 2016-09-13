class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]
  before_action :set_admin,       only: [:show, :edit, :update, :destroy]
  before_action :correct_admin,   only: [:edit, :update]

  layout "admin"
  
  def dashboard
    
  end
  
  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      log_in_admin @admin
      flash[:success] = "Admin created"
      redirect_to @admin
    else
      render 'new'
    end
  end

  def update
    if @admin.update(admin_params)
      redirect_to admins_dashboard_path, notice: 'Admin Profile successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
      redirect_to admins_url, notice: 'Admin was successfully destroyed.'
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
    
    def correct_admin
      #@admin = Partner.find(params[:id])
      redirect_to(root_url) unless current_admin?(@admin)
    end
end
