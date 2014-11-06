class ExercisesController < ApplicationController
  def index
  end

  def show
    @answer = Answer.new
  end

  def new
    @exercise = Exercise.new
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end
end

 def create
     @exercuse = Exercise.new(params.require(:post).permit(:title, :body))
     if @exercise.save
       flash[:notice] = "Se ha guardado tu ejercicio."
       redirect_to @exercise
     else
       flash[:error] = "Hubo un error al guardar el ejercicio. Inténtalo de nuevo."
       render :new
     end
   end

  def update
     @exercise = Exercise.find(params[:id])
     if @exercise.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Tu entrada fue actualizada."
       redirect_to @exercise
     else
       flash[:error] = "Hubo un error al guardar tu entrada. Inténtalo nuevamente."
       render :edit
     end
   end