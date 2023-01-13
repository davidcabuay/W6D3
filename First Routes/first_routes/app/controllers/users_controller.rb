class UsersController < ApplicationController

    def index
        if params[:query]
            @users=User.where(username:params[:query])
        else
            @users = User.all
        end
        render json: @users
    end
    
    
    
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save!
            render json: @user
        else
            render json: @user.errors.full_messages, status: unprocessable_entitiy
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy   #.destroy is ruby syntax
        # redirect_to user_url
        render json: @user
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
			params.require(:users).permit(:username)
#only permitting param keys to params hash to come into server, ignore other param keys
	end
end