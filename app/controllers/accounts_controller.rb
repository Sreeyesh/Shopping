class AccountsController < ApplicationController
  def login

  	if request.post?
  		@local_user = User.find_by_email(params[:email])

  		if password_correct?
        cookies[:current_user] = @local_user.email
  			redirect_to products_url()
      else
        flash.now[:danger] = "Check your Credentials"
  		end
  	end

  end

  def signup
  	if request.post?
  		user = User.new(user_params)
      if user.valid?
        user.save!
        cookies[:current_user] = user.email
        redirect_to products_url()
      else
        flash.now[:danger] = "User Exists"
      end
  	end
  	
  end

  def logout
    cookies.delete(:current_user)
    redirect_to login_url()
  end


  private

  def user_params

  	params.require(:user).permit(:email, :password, :name)
  end

  def password_correct?
	@local_user.password == Digest::SHA2.hexdigest(@local_user.salt + params[:password]) unless @local_user.nil?
  end
end
