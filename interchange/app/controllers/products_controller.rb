class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_product, except: [:index,:new,:create]
  #GET  /products
	def index
		# Obtiene todos los registros SELECT * FROM products
		@products = Product.all
	end
	#GET /products/:id
	def show
		@product.update_visits_count
	end

	#GET /products/new
	def new		
		@product = Product.new
	end

	#POST /products
	def create
		#INSERT INTO
		@product = current_user.products.new(product_params)
		if @product.save
			redirect_to @product
		else
			render :new
		end
	end

	def edit

	end

	#PUT /products/:id
	def update
		
		if @product.update(product_params)
			redirect_to @product
		else
			render :edit
		end
	end

	#DELETE /products/:id
	def destroy
		#DELETE FROM products

		@product.destroy #Destroy : elimina el objeto de la BD
		redirect_to products_path
	end

	private

	#def validate_user
	#	redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
	#end

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name,:description,:state)
	end

end
