class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  validates_presence_of :last_name, :first_name

  def full_name
    last_name.capitalize + ', ' + first_name.capitalize
  end
end


