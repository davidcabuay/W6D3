class CommentsController < ApplicationController

    def index

        if params[:user_id]
            @comment = Comment.comment_for_user_id(params[:user_id])
        elsif params[:artwork_id]
            @comment = Comment.comment_for_artwork_id(params[:artwork_id])
        end
        render json: @comment
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.artwork_id = params[:artwork_id]  
        if @comment.save!
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: unprocessable_entitiy
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy   #.destroy is ruby syntax
        # redirect_to artwork_url
        render json: @comment
    end



    private 

	def comment_params
			params.require(:comments).permit(:author_id, :artwork_id, :body)
#only permitting param keys to params hash to come into server, ignore other param keys
	end

end
