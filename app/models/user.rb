class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :peegins
  validates_presence_of :name, { :message => "Content cannot be blank" }
  validates :name, :length => { :minimum => 1}
  validates :email, :uniqueness => {:allow_blank => true}


  def make_admin!
    self.update_attribute(:admin, true)
  end

  def self.down
    remove_index :users, :email
  end

  def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.name = data["name"] if user.name.blank?
    end
  end
end

def self.from_omniauth(auth)
    where(name: auth.info.name).first_or_initialize.tap do |user|
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.email = "fb_guest_#{Time.now.to_i}#{rand(100)}@peegin.com"
      user.save
    end
  end
end
