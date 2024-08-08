class SessionsController < ApplicationController
def new
    
end

def create
    user = User.find_by(email: params[:user][:email])
    if user.present? && user.authenticate(params[:user][:password])
      session[:user_id]=user.id
      redirect_to root_path, notice: "Logged in successfuly "
      else
        flash[:alert] = "Invalid email or password"
        redirect_to signin_path
    end
end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out successfully."
    end
end