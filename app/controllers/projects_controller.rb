# frozen_string_literal:true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    @comment = @project.comments.new
  end
end
