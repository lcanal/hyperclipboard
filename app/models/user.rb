class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :database_authenticatable, :registerable,
  #  :recoverable, :rememberable, :validatable,
  devise :omniauthable, omniauth_providers: %i[twitter2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      # user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
      # user.location = auth.info.location
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      print "Session data #{session}`"
      # if data = session["devise.github"] && session["devise.github_data"]["extra"]["raw_info"]
      #   user.email = data["email"] if user.email.blank?
      # end
      # if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
      #   user.email = data["email"] if user.email.blank?
      # end
    end
  end
end
