module Api
	module V1
		class ArtsController < ApplicationController
			def index
				arts = Art.order('created_at DESC');
				render json: {status: 'SUCCESS', message: 'Loa', data: arts}, status: :ok
			end

			def show
				art = Art.find(params[:id]);
				render json: {status: 'SUCCESS', message: 'Loa', data: art}, status: :ok
			end


			def create
				art = Art.new(art_params);
				# render json: {status: 'SUCCESS', message: 'Loa', data: art}, status: :ok
				if art.save
					render json: {status: 'SUCCESS', message: 'Saved new', data: art}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Not saved', data: art.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				art = Art.find(params[:id]);
				art.destroy
				render json: {status: 'SUCCESS', message: 'Deleted art', data: art}, status: :ok
			end

			def update
				art = Art.find(params[:id]);
				if art.update_attributes(art_params)
					render json: {status: 'SUCCESS', message: 'Updated', data: art}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Not updated', data: art.errors}, status: :unprocessable_entity
				end
			end

			private

			def art_params
				params.permit(:title, :body)
			end
		end
	end
end