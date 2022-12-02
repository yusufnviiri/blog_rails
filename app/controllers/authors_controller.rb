class AuthorsController < ApplicationController

before_action :set_author, only: %i[show destroy update edit]

  def index
    @author=Author.all
    @salute="hello users controller"
  end
  def new 
    @author=Author.new
  end

def destroy
  @author.destroy

  
  respond_to do |format|
    format.html { redirect_to authors_url, notice: "successfully destroyed." }
    format.json { head :no_content }
end
end
def edit
end
def update
  respond_to do |format|
  if @author.update(author_params)
 
    format.html{redirect_to author_path(@author), notice: " successfully updated!"}
    format.json { render :show, status: :ok,location: @author}
  else
    format.html { render :edit, status: :unprocessable_entity}
    format.json { render json: @author.errors, status: :unprocessable_entity}
  end
end
end
def show
  @postCounter=@author.postsC
  @posts=@author.posts.count
end

def create

  @author=Author.new(author_params)
  respond_to do |format|
  if @author.save


  format.html {redirect_to author_path(@author), notice: " successfully created."}
  format.json {  render  :show, status: :created,location: @author}

  else
    format.html {render :new, status: :unprocessable_entity}
    format.json {  render  json: @author_errors, status: :unprocessable_entity}
  end
end
end


private
def author_params
  params.require(:author).permit(:name,:image,:bio)
end
 def set_author

@author=Author.find(params[:id])

 end

end
