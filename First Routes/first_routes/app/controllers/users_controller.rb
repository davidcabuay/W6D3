class UsersController < ApplicationController

    def index
        @user = User.all
        render json: @user
    end
    
    
    
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(params.require(:users).permit(:name, :email))
        @user.save!
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy.   #.destroy is ruby syntax
        redirect_to user_url
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params) #will work if one of the parameters is updated
                redirect_to user_url(@user) 
        else
            render json: @user.errors.full_messages, status: unprocessable_entitiy
        end   
    end


    private 

	def user_params
			params.require(:users).permit(:name, :email)
#only permitting param keys to params hash to come into server, ignore other param keys
	end
end