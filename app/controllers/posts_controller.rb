class PostsController < ApplicationController
  before_action :set_post ,only: %i[ show edit  update destroy]
  def index
    @posts= Post.all
    
  end
  def show
    @commentsCounter=@post.commentsCounter
    @likesCounter=@post.likesCount
  end
  def new
  @post= Post.new
    @author= Author.find(params[:author_id])
  end
  def create
    @author= Author.find(params[:author_id])

    @post= @author.posts.create(params[:post].permit(:Text, :title))
    respond_to do |format|      
    if @post.save
format.html { redirect_to author_posts_path( @author), notice: 'Post was successfully created.'}
format.json { render :show, status: :created, location: @post}
    else
      format.html { render :new ,status: :unprocessable_entity}
      format.json { render json: @post_errors,status: :unprocessable_entity}
    end
  end
end
def destroy
  @post.destroy
  redirect_to author_posts_path
end
def edit
  @post = Post.find(params[:id])
end
def update
  @author= Author.find(params[:author_id])
  respond_to do |format|  
    if @post.update(post_params)    
format.html { redirect_to author_posts_path( @author), notice: 'Post was updated.'}
format.json { render :show, status: :created, location: @post}
  else
    format.html { render :new ,status: :unprocessable_entity}
    format.json { render json: @post_errors,status: :unprocessable_entity}
  end
 
end
end
def like

  @author= Author.all.find(params[:author_id])

  Like.create(post_id: params[:post_id],author_id: params[:author_id])
  redirect_to author_posts_path(@author)

end
def set_post
  @post= Post.find(params[:id])
end
def post_params
  params.require(:post).permit(:author_id, :title, :Text)
end

end
