class BooksController < ApplicationController
	before_action :find_book , only: [:show, :edit ,:update ,:destroy]
	before_action :require_user , only: [:edit, :new]
	def index 
		if params[:category].blank?
			@books = Book.all.order('created_at DESC')
		else
			@category_id = Category.find_by(name: params[:category]).id
			@books = Book.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def new 
		@book = Book.new
		@categories = Category.all.map { |c| [c.name, c.id]}
	end

	def create
		@book = Book.new(book_params)
		@book.category_id = params[:category_id]
		if @book.save
			redirect_to @book, notice: 'Successfully created'
		else 
			render 'new'
		end 
	end

	def edit
		@categories = Category.all.map{|c| [ c.name, c.id ] }
	end

	def show
		if @book.reviews.blank?
			@average_review = 0
		else
			@average_review = @book.reviews.average(:rating).round(2)
		end
	end

	def update
		if @book.update(book_params)
			redirect_to @book, notice: 'Successfully updated'
		else
			render'new'
		end
	end

	def destroy
		@book.destroy
		redirect_to root_path
	end

	private
		def book_params
			params.require(:book).permit(:name,:description,:price,:author,:image,:category_id)
		end

		def find_book
			@book = Book.find(params[:id])
		end

end
