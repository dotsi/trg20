class Admin::CategoriesController < ApplicationController
    require_role "admin", :for_all_except  => [:index, :show]
    
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

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @category }
      end
    end

    # GET /categories/new
    # GET /categories/new.xml
    def new
      @category = Category.new

      # Get id of current category and store it as parent_id
      @category.parent_id = params[:parent_id]

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @category }
      end
    end

    # GET /categories/1/edit
    def edit
      @category = Category.find(params[:id])
    end

    # POST /categories
    # POST /categories.xml
    def create
      @category = Category.new(params[:category])

      respond_to do |format|
        if @category.save
          flash[:notice] = 'Category was successfully created.'
          format.html { redirect_to([:admin, @category]) }
          format.xml  { render :xml => @category, :status => :created, :location => @category }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /categories/1
    # PUT /categories/1.xml
    def update
      @category = Category.find(params[:id])

      respond_to do |format|
        if @category.update_attributes(params[:category])
          flash[:notice] = 'Category was successfully updated.'
          format.html { redirect_to([:admin, @category]) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /categories/1
    # DELETE /categories/1.xml
    def destroy
      @category = Category.find(params[:id])
      @category.destroy

      respond_to do |format|
        format.html { redirect_to(admin_categories_url) }
        format.xml  { head :ok }
      end
    end

    def update_positions
      Category.update_positions(params)
      render :nothing => true
    end

  end
