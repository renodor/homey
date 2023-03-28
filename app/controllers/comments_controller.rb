# frozen_string_literal:true

class CommentsController < ApplicationController
  def create
    # Strong params don't seems necessary has the only non-deterministic param here is the body
    @comment = Comment.new(
      project_id: params[:project_id],
      user_id: current_user.id,
      body: params[:comment][:body]
    )

    # If comment can't be saved (because body is empty), we just don't create it and redirect to project.
    # As this is the only possible use case of comment invalidity, I think this is good enough.
    # (I feel that adding an error message saying "please add text to your comment" is not necessary)
    @comment.save
    redirect_to project_path(params[:project_id])
  end
end
