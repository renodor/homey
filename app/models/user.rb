# frozen_string_literal:true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  has_many :comments, dependent: :destroy
  has_many :project_status_changes, dependent: :destroy # TODO > maybe not

  validates :username, :email, presence: true
end
