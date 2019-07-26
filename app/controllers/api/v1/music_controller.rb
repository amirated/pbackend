module Api
	module V1
		class MusicController < ApplicationController
			def index
				music = Song.order('created_at DESC');
				render json: {status: 'SUCCESS', message: 'Loa', data: music}, status: :ok
			end

			def show
				music = Song.find(params[:id]);
				render json: {status: 'SUCCESS', message: 'Loa', data: music}, status: :ok
			end


			def create
				music = Song.new(music_params);
				# render json: {status: 'SUCCESS', message: 'Loa', data: music}, status: :ok
				if music.save
					render json: {status: 'SUCCESS', message: 'Saved new', data: music}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Not saved', data: music.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				music = Song.find(params[:id]);
				music.destroy
				render json: {status: 'SUCCESS', message: 'Deleted music', data: music}, status: :ok
			end

			def update
				music = Song.find(params[:id]);
				if music.update_attributes(music_params)
					render json: {status: 'SUCCESS', message: 'Updated', data: music}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Not updated', data: music.errors}, status: :unprocessable_entity
				end
			end

			private

			def music_params
				params.permit(:title, :body)
			end
		end
	end
end