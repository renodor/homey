# frozen_string_literal:true

class ProjectsController < ApplicationController
  def index
    @projects = Project.order(:created_at)
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new

    @project_changes = @project.comments.includes(:user) + @project.project_status_changes.includes(:user)
    # Maybe we can directly return merged associations and leverage ActiveRecord #order instead of Enumerable#sort_by
    @project_changes.sort_by!(&:created_at)
  end

  def update
    @project = Project.find(params[:id])
    old_status = @project.status
    @project.update!(status: params[:status])

    # Maybe instead of creating ProjectStatusChange here,
    # we could have some kind of after_commit or after_update callback on Project model
    # that automatically creates a ProjectStatusChange whenever status has changed...
    # But we would have to find a way to retrieve current_user
    # (and probably deal with the situation where there is no current_user at all if project is updated from the console for example)
    @project.project_status_changes.create!(
      from: old_status,
      to: @project.status,
      user: current_user
    )

    redirect_to project_path(@project)
  end
end
