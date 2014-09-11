class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	# the method should match the provider you are using
	def facebook
		#.from_omniauth is a method in the model
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
	end
end