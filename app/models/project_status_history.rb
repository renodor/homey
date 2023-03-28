# frozen_string_literal:true

class ProjectStatusHistory < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :from, :to, presence: true
  validates :from, :to, inclusion: { in: Project.statuses.keys }
  validates :to, comparison: { other_than: :from }
end
