class ArtworksController < ApplicationController
    def index
        @artwork = Artwork.artworks_for_user_id(params[:user_id])
        render json: @artwork
    end
    
    
    
    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save!
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: unprocessable_entitiy
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy.   #.destroy is ruby syntax
        # redirect_to artwork_url
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params) #will work if one of the parameters is updated
                redirect_to artwork_url(@artwork) 
        else
            render json: @artwork.errors.full_messages, status: unprocessable_entitiy
        end   
    end


    private 

	def artwork_params
			params.require(:artworks).permit(:title, :artist_id, :image_url)
#only permitting param keys to params hash to come into server, ignore other param keys
	end
end
