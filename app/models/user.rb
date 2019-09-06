class User < ApplicationRecord
  petergate(roles: [:admin], multiple: false)

  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects

  def full_name
    "#{first_name} #{last_name}"
  end
end
