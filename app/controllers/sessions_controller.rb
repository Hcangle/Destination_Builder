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

end 