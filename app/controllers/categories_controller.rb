class CategoriesController < ApplicationController
  before_filter :initialize_cart
  
  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.find(:all, :order => 'position')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.children
    @products = @category.products
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

end
