module Guestbook

  class MessagesController < ApplicationController

    def index
      @post = Guestbook.new
      @posts = Guestbook.order('id DESC').paginate(:page => params[:page], :per_page => 4) 
    end

    def say
      @post = Guestbook.new
      @post.time = Time.now

      if user_signed_in?
        @post.author = current_user.login
        @post.email = current_user.email

      else
        @post.author = 'Guest'
        @post.email = 'Guest'
      end
      
      @post.message = params[:message]

      if @post.save
        redirect_to :action => 'index'
      end

    end

  end

end
