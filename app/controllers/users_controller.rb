class UsersController < ApplicationController
  before_action :require_login, only: %i[profile show edit update destroy]           
  before_action :set_user, only: %i[show edit update destroy ] 
  before_action :authorize_user!, only: %i[show edit update destroy]
  
  

  
  def index
    redirect_to root_path, alert: "Access denied."
  end

  def profile
    @user = current_user  
    redirect_to @user
  end

  
  def show
   
  end

  
  def new
    @user = User.new
  end

 
  def edit
  end

  
  def create
    @user = User.new(user_params)
     

    respond_to do |format|
      if @user.save
        
        UserMailer.welcome_email(@user).deliver_later
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end

  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @user.destroy!
    
    session[:user_id] = nil   
    respond_to do |format|
      format.html { redirect_to new_session_path, notice: "User was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

   
    def set_user
      @user = User.find(params[:id])
    end

    
    def authorize_user!
      unless @user == current_user
        redirect_to root_path, notice: "Access denied."
      end
    end

    
    # def require_login
    #   unless current_user
    #     redirect_to new_session_path, notice: "Please log in to access this page."
    #   end
    # end

  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :location, :role, :photo)
    end
end
