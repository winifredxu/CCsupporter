class RequestsController < ApplicationController
	before_action:find_request, only: [:show, :edit, :update, :destroy] 

	def index
		@entire_requests = Request.all.order('name ASC')		
	end

	def new
		@request = Request.new
	end

	def create
		@request = Request.new params_request_sanitized
		if @request.save
			redirect_to requests_path
		else
			render :new
		end
	end

	def edit
		#uses find_request to pass the @request to edit.html.erb view file
	end

	def update
		if @request.update params_request_sanitized
			redirect_to request_path
		else
			render :edit
		end		
	end

	def show
		#uses find_request to pass the @request to show.html.erb view file
	end

	def destroy
		@request.destroy
		redirect_to requests_path
	end


	private

	def find_request
		@request = Request.find(params[:id])
	end

	# request params sanitization
	def params_request_sanitized
		# use strong params to ensure only the fields explicitly stated are allowed
		params.require(:request).permit([:name, :email, :dept, :body])
	end

end
