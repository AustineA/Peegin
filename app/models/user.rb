class User < ActiveRecord::Base
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :peegins
  validates_presence_of :name, { :message => "Content cannot be blank" }

  def make_admin!
    self.update_attribute(:admin, true)
  end

end
