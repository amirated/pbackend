module Api
	module V1
		class ScienceController < ApplicationController
			def index
				project = Project.order('created_at DESC');
				render json: {status: 'SUCCESS', message: 'Loa', data: project}, status: :ok
			end

			def show
				project = Project.find(params[:id]);
				render json: {status: 'SUCCESS', message: 'Loa', data: project}, status: :ok
			end


			def create
				music = Project.new(project_params);
				# render json: {status: 'SUCCESS', message: 'Loa', data: project}, status: :ok
				if project.save
					render json: {status: 'SUCCESS', message: 'Saved new', data: project}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Not saved', data: project.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				project = Project.find(params[:id]);
				project.destroy
				render json: {status: 'SUCCESS', message: 'Deleted project', data: project}, status: :ok
			end

			def update
				project = Project.find(params[:id]);
				if project.update_attributes(project_params)
					render json: {status: 'SUCCESS', message: 'Updated', data: project}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Not updated', data: project.errors}, status: :unprocessable_entity
				end
			end

			private

			def project_params
				params.permit(:title, :body)
			end
		end
	end
end