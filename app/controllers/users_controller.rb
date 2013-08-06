class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index

    @users = User.order('id DESC').paginate(:page => params[:page], :per_page => 5)
    @q = User.search(params[:q])
  
  end

  def show

    @user =  User.where(:login => params[:user])

    if @user.count == 0
      redirect_to :action => 'startpage', :controller => 'index'

    else
      @profile_login = params[:user]
    end

  end

  def search

    @q = User.search(params[:q])
  
    if !params[:q].blank?
      @result = @q.result(:distinct => true)
    end
    
    respond_to do |format|
      format.html
      format.js
    end

  end

end
