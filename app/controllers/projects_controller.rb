# frozen_string_literal:true

class ProjectsController < ApplicationController
  def index
    @projects = Project.order(:created_at)
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new

    @project_changes = @project.comments + @project.project_status_changes
    @project_changes.sort_by!(&:created_at) # TODO: Maybe we can directly return merged associations and leverage ActiveRecord #order
  end

  def update
    @project = Project.find(params[:id])
    old_status = @project.status
    @project.update!(status: params[:status])

    @project.project_status_changes.create!(
      from: old_status,
      to: @project.status,
      user: current_user
    )

    redirect_to project_path(@project)
  end
end
