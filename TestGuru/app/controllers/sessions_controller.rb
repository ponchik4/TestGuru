class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to request.path
    else
      flash[:alert, :notice] = 'Are you a Guru? Verify your Email please'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
