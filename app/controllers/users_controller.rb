class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :authorize_user, except: [:new, :create]

  def new
  end

  def create
    @u = User.new(user_params)
    @u.save
    if !@u.save
      flash[:errors] = @u.errors.full_messages
      redirect_to "/"
    else
      session[:user_id] = @u.id
      redirect_to "/products"
    end
  end

  def show
    @u = User.find(params[:id])
  end

  def edit
    @u = User.find(params[:id])
  end

  def update
    @u = User.find(params[:id])
    if @u.update(user_params)
      redirect_to "/users/#{@u.id}"
    else
      flash[:errors] = @u.errors.full_messages
      redirect_to "/users/#{@u.id}/edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :zip)
    end

    def authorize_user
      redirect_to "/users/#{session[:user_id]}" unless current_user == User.find(params[:id])
    end
end
