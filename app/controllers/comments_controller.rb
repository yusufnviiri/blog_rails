class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit destroy update]
 
def index
  @post= Post.find(params[:post_id])
  @comments = @post.comments
end
def edit
end
def update
  @author= Author.find(params[:author_id])
  @post = Post.find(params[:post_id])



  respond_to do |format|  
    if @comment.update(comment_params)    
      format.html { redirect_to author_post_path( @author,@post), notice: 'Post was successfully created.'}
      format.json { render :show, status: :created, location: @comment}
  else
    format.html { render :new ,status: :unprocessable_entity}
    format.json { render json: @comment_errors,status: :unprocessable_entity}
  end
 
end
end  


  def show
  end
  def new
    @comment= Comment.new
    end
    def create
      @author= Author.find(params[:author_id])
      @post = Post.find(params[:post_id])
    
  
      @comment= @post.comments.create(params[:comment].permit(:text,:author_id,:post_id))
      respond_to do |format|      
      if @comment.save
  format.html { redirect_to author_post_path( @author,@post), notice: 'Post was successfully created.'}
  format.json { render :show, status: :created, location: @comment}
      else
        format.html { render :new ,status: :unprocessable_entity}
        format.json { render json: @comment_errors,status: :unprocessable_entity}
      end
    end
  end
  def destroy
    @comment.destroy

    @author= Author.find(params[:author_id])

    redirect_to author_posts_path( @author)
  end
  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
  
  def set_comment
    @comment= Comment.find(params[:id])
  end
end
