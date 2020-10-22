class SessionsController < ApplicationController
    def new
     
    end 

    def create 
        #authenticat user aka verify they exist in the db by user name 
        #pw matched what is in the db
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        #if it does "log them in" with session hash 
        # and redirect them 
           log_in(@user)
           redirect_to destinations_path
        #else re render the login form displaying error
        else 
            @error = "Please Try Again."
            render :new 
    end
end 

    def destroy 
        session.clear 
        redirect_to login_path
    end 

    def google
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
          user.username= auth["info"]["first_name"]
          user.password= SecureRandom.hex(8)
        end
        
        if @user && @user.id
          session[:user_id] = @user.id
          redirect_to destinations_path
        else
        
          redirect_to login_path
        end
      end  
      
      private    def auth
        request.env['omniauth.auth']
      end
end 