class CursosController < ApplicationController
def index
    @cursos = Curso.all
  end

  def show
    @cursos = Curso.find(params[:id])
  end

   def create
     @cursos = Curso.new(params.require(:post).permit(:title, :body))
     if @curso.save
       flash[:notice] = "Se ha guardado tu entrada."
       redirect_to @post
     else
       flash[:error] = "Hubo un error al guardar la entrada. Inténtalo de nuevo."
       render :new
     end
   end

  def new
  end

  def edit
  end
end
