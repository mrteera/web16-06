class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :default_value

  def default_value
    self.is_admin ||= false
    self.is_banned ||= false
  end

  def active_for_authentication?
    super && !self.is_banned?
  end
end
