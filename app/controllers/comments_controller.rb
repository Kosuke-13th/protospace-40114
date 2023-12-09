class CommentsController < ApplicationController

 def create
   comment = Comment.create(comment_params)
   if comment.save
     redirect_to "/prototypes/#{comment.prototype.id}" 
   else
    @prototype =  Comment.find(params[:id])
    render "/prototypes/show"
   end
 end

 private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end

end
