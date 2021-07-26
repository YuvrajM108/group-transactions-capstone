class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :authentication_keys => [:name]
  validates :name, presence: true, uniqueness: true

  before_validation do
    self.password = 'password'
    self.password_confirmation = 'password'
  end
end
