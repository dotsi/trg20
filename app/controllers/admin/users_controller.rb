class Admin::UsersController < ApplicationController
  #require_role "admin"
  
  # GET admin/users
  # GET admin/users.xml
  def index
    @users = User.all
  end
  
  # GET /products/1
  # GET /products/1.xml
  def show
    @user = User.find(params[:id])
    @roles = @user.roles

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def roles

  end
  
end
