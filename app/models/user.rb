# frozen_string_literal:true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  # Maybe we want to keep comments and project_status_changes even if user is destroyed
  # In that case we could use dependent: :nullify and set user relation has optional on those models
  # (But it is easier and good enough to have dependent: :destroy for now I think)
  has_many :comments, dependent: :destroy
  has_many :project_status_changes, dependent: :destroy

  validates :username, :email, presence: true
end
