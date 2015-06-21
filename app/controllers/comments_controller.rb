class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to customer_url(@comment.customer_id)
        else
            redirect_to customer_url(@comment.customer_id)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        redirect_url = customer_url(@comment.customer_id)
        @comment.destroy
        redirect_to redirect_url
    end

    private

    def comment_params
        params.require(:comment).permit(
            :body,
            :customer_id,
        )
    end
end
