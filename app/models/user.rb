class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  extend FriendlyId
  friendly_id :fbname, use: :slugged

  has_one :profile
  has_and_belongs_to_many :roles
  delegate :can?, :cannot?, :to => :ability

  has_many :creates

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def make_admin
    self.roles << Role.admin
  end

  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    data = auth['info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create!(fbname: data['name'], uid: auth['uid'], provider: auth['provider'], :email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

end
