class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :products

  has_many :reviews

  has_many :test_lists

  has_many :test_results

  belongs_to :role

  def admin?
    role_id == 1
  end

  def moder?
    role_id == 2
  end

  def user?
    role_id == 3
  end

end
