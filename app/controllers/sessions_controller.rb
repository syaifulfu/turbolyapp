class SessionsController < ApplicationController

    include ApplicationHelper

    def new
        # No need for anything in here, we are just going to render our
        # new.html.erb AKA the login page
        logged_in_check
    end
    
    def create
        # Look up User in db by the email address submitted to the login form and
        # convert to lowercase to match email in db in case they had caps lock on:
        user = User.find_by(email: params[:email].downcase)
        
        # Verify user exists in db and run has_secure_password's .authenticate() 
        # method to see if the password submitted on the login form was correct: 
        if user && user.authenticate(params[:password]) 
            # Save the user.id in that user's session cookie:
            session[:user_id] = user.id.to_s
            flash[:success] = 'Successfuly logged in'
            redirect_to root_path
        else
            # if email or password incorrect, re-render login page:
            flash[:error] = 'Incorrect email or password, try again.'
            redirect_to login_path
            # render :new
        end
    end
    
    def destroy
        # delete the saved user_id key/value from the cookie:
        session.delete(:user_id)
        redirect_to root_path, success: "Logged out!"
    end

end
