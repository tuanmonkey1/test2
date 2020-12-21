class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: [:facebook, :google_oauth2]



  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    user = User.where(provider: auth.provider, uid: auth.uid).first
    email = auth.info.email
    email ||= auth.uid + "@" + auth.provider + ".com"
    user ||= User.create!(provider: auth.provider, uid: auth.uid, name: auth.info.name, email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
  end
  def destroy
    User.find(session[:user_id]).destroy      
    session[:user_id] = nil         
    redirect_to '/users/sign_in' 
  end
end
