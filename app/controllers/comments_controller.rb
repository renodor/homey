# frozen_string_literal:true

class CommentsController < ApplicationController
  def create
    # TODO: add comment on why we don't use strong params or validations here
    @comment = Comment.new(
      project_id: params[:project_id],
      user_id: current_user.id,
      body: params[:comment][:body]
    )

    @comment.save
    redirect_to project_path(params[:project_id])
  end
end
