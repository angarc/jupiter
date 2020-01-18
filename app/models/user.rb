class User < ApplicationRecord
  petergate(roles: [:admin], multiple: false)

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects

  has_many :comments, dependent: :destroy

  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
