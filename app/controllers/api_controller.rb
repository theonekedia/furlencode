class ApiController < ApplicationController

	def signup
		response = Hash.new
		users = User.where(email: params[:email])
		if users.length == 0
			user = User.new(user_params)
		    if user.save!
		    	response['user'] = User.where(id: user.id).select(:id,:name,:email).to_json
		    	response.merge! ::Api::ApiStatusList::OK
		        render json: response
		    else
		        render json: ::Api::ApiStatusList::UNKNOWN_ERROR, status: 400
		    end
		else
			render json: ::Api::ApiStatusList::USER_ALREADY_EXIST, status: 400
		end
    end

	def login
		response = Hash.new
		if params[:email] && params[:password]
			user = User.authenticate(params[:email], params[:password])
			if user
				response['user'] = User.where(id: user.id).select(:id,:name,:email).as_json
		    	response.merge! ::Api::ApiStatusList::OK
		        render json: response
		    else
		        render json: ::Api::ApiStatusList::USER_NOT_FOUND, status: 400
		    end
		else
			render json: ::Api::ApiStatusList::INVALID_REQUEST, status: 400
		end

	end

	def categories
		response = Hash.new
		categories = Category.all.select(:id,:name).as_json
		response['result'] = categories
		response.merge! ::Api::ApiStatusList::OK
		render json: response
	end

	def new_categories
		response = Hash.new
		categories = Category.where(name: params[:name])
		if categories.length == 0
			category = Category.new(category_params)
		    if category.save!
		    	response.category = Category.where(id: category.id).select(:id, :name)
		    	response.merge! ::Api::ApiStatusList::OK
		        render json: response
		    else
		        render json: ::Api::ApiStatusList::UNKNOWN_ERROR, status: 400
		    end
		else
			render json: ::Api::ApiStatusList::category_ALREADY_EXIST, status: 400
		end
	end

	def stores
		response = Hash.new
		stores = Store.all.select(:id,:name, :latitude, :longitude, :rating).as_json
		response['result'] = stores
		response.merge! ::Api::ApiStatusList::OK
		render json: response
	end

	def new_store
		response = Hash.new
		stores = Store.where(longitude: params[:longitude], latitude: params[:latitude])
		if stores.length == 0
			store = store.new(store_params)
		    if store.save!
		    	response.store = Store.where(id: store.id).select(:id,:name,:latitude,:longitude,:rating).as_json
		    	response.merge! ::Api::ApiStatusList::OK
		        render json: response
		    else
		        render json: ::Api::ApiStatusList::UNKNOWN_ERROR, status: 400
		    end
		else
			render json: ::Api::ApiStatusList::STORE_ALREADY_EXIST, status: 400
		end
	end

	def store
		# response = Hash.new
		# if params[:id]
		# 	store = Store.includes(reviews: [:user]).where(id: params[:id]).map{ |store|
		# 		id: store.id, name: store.name, longitude: store.longitude, latitude: store.latitude,
		# 		reviews: {store.reviews.map{|review| 
		# 			liked: review.liked,
		# 			critic: review.critic,
		# 			user: review.user.name
		# 			}
		# 		}
		# 	}
		# end
		render nothing: true
	end

	private
	def category_params
      params.permit(:name)
    end

	def user_params
      params.permit(:name, :email, :password)
    end

    def store_params
      params.permit(:name, :latitude, :longitude, :user_id, :category_id)
    end
end