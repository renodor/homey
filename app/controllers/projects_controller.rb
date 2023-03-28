# frozen_string_literal:true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    @comment = Comment.new
  end

  def update
    @project = Project.find(params[:id])
    @project.update!(status: params[:status])
    redirect_to project_path(@project)
  end
end
