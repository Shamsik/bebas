module Guestbook

  class MessagesController < ApplicationController

    def index
      @posts = Guestbook.order('id DESC').paginate(:page => params[:page], :per_page => 10) 
    
      respond_to do |format|
        format.html
        format.js
      end

    end

      def create
        @post = Guestbook.new
        @post.message = params[:guestbook][:message]
        @post.time = Time.now
      
        if user_signed_in?
          @post.author = current_user.login
          @post.email = current_user.email
        else
          @post.author = 'Guest'
          @post.email = 'Guest'
        end
      
        respond_to do |format|
          if @post.save
            format.html { redirect_to guestbook_path }
            format.js { redirect_to guestbook_path }
          else
            format.html { render action: "create" }
            format.js { render action: "create" }
          end
        end

      end

    end
end

