# frozen_string_literal:true

class Project < ApplicationRecord
  has_many :comments
  has_many :project_status_histories

  validates :name, :status, presence: true

  enum status: {
    to_do: 0,
    in_progress: 1,
    to_approve: 2,
    done: 3
  }
end
