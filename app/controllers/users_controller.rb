class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.order('id DESC').paginate(:page => params[:page], :per_page => 5)
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
    @users = User.search(:login_cont => params[:search][:question]).result(:distinct => true)
  end

end
