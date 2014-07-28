class AnswersController < ApplicationController
  def create
    # Answer belongs to exercise and it lets you go to the next exercise. 
     @answer = Answer.new(params.require(:answer).permit(:body))
     if @answer.save
       flash[:notice] = "Se ha guardado tu respuesta."
       redirect_to Exercise.first
     else
       flash[:error] = "Hubo un error al guardar tu respuesta. Inténtalo de nuevo."
       render :new
     end
   end
end