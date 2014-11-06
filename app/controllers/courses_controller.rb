class CoursesController < ApplicationController
def index
    @courses = Course.all
  end

  def create
     @curso = Curso.new(params.require(:post).permit(:title, :body))
     if @curso.save
       flash[:notice] = "Se ha guardado tu curso."
       redirect_to @curso
     else
       flash[:error] = "Hubo un error al guardar el curso. Inténtalo de nuevo."
       render :new
     end
   end

  def show
    @course = Course.find(params[:id])
    @exercise = @course.exercises.first
  end

end

def new
    @course = Course.new
  end