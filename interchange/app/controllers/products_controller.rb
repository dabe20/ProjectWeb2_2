class ProductsController < ApplicationController
  
  #GET  /products
	def index
		@products = Product.all
	end
	#GET /products/:id
	def show
		@products = Product.find(params[:id])
	end
end
