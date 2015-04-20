class ProductsController < ApplicationController
  
  #GET  /products
	def index
		# Obtiene todos los registros SELECT * FROM products
		@products = Product.all
	end
	#GET /products/:id
	def show
		# Encontrar un registro por id
		@product = Product.find(params[:id])
		#Where
		#Product.where(" id = ?", params[:id])
	end

	#GET /products/new
	def new		
		@product = Product.new
	end

	#POST /products
	def create
		#INSERT INTO
		@product = Product.new(product_params)
		if @product.save
			redirect_to @product
		else
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	#PUT /products/:id
	def update
		#UPDATE
		# @product.update_attributes({name: 'Nuevo nombre'})
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to @product
		else
			render :edit
		end
	end

	#DELETE /products/:id
	def destroy
		#DELETE FROM products
		@product = Product.find(params[:id])
		@product.destroy #Destroy : elimina el objeto de la BD
		redirect_to products_path
	end

	private

	def product_params
		params.require(:product).permit(:name,:description,:state)
	end

end
