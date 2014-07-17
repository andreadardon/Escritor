class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

   def create
     @post = Post.new(params.require(:post).permit(:title, :body))
     if @post.save
       flash[:notice] = "Se ha guardado tu entrada."
       redirect_to @post
     else
       flash[:error] = "Hubo un error al guardar la entrada. Inténtalo de nuevo."
       render :new
     end
   end

  def edit
    @post = Post.find(params[:id])
  end


def update
     @post = Post.find(params[:id])
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Tu entrada se ha actualizado"
       redirect_to @post
     else
       flash[:error] = "Hubo un error al guardar la entrada. Inténtalo de nuevo."
       render :edit
     end
   end
end