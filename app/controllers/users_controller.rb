class UsersController < ApplicationController
before_action :set_user, only: [:name,:email,:phone]
    def index
        @users = User.all
    end
    
    def create
      user_params = params.permit(:name,:email,:phone)
        @user = User.new(user_params)
        if @user.save!
            redirect_to "/users"
        else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end     
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
          format.json { head :no_content }
    end

    def set_user
        @user = user.find(params[:id])
    end

    def product_params
        params.permit(:name, :email, :phone)
      end
    
    def new
        @user = User.new
    end
end