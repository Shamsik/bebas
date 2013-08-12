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
    @result = @q.result(distinct: true)
    
      respond_to do |format|
        unless params[:q].blank?
          format.html
          format.js
        else
          format.html { render nothing: true }
          format.js { render nothing: true }
        end
      end
    
  end

end
