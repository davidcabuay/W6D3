class ArtworkSharesController < ApplicationController

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)
        if @artwork_share.save!
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, status: unprocessable_entitiy
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        @artwork_share.destroy   #.destroy is ruby syntax
        # redirect_to artwork_url
        render json: @artwork_share
    end



    private 

	def artwork_share_params
			params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
#only permitting param keys to params hash to come into server, ignore other param keys
	end
end
