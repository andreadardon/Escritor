class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @exercise = Exercise.find(params[:exercise_id])
  end

  def create
    # Answer belongs to exercise and it lets you go to the next exercise. 
     @answer = Answer.new(params.require(:answer).permit(:body, :exercise_id))


     @exercise = Exercise.find(params[:answer][:exercise_id].to_i + 1)
     if @answer.save
       flash[:notice] = "Se ha guardado tu respuesta." 
       redirect_to course_exercise_path(Course.first, @exercise)
       #After saving an exercise redirect to next exercise. 
     else
       flash[:error] = "Hubo un error al guardar tu respuesta. Inténtalo de nuevo."
       render :new
     end
   end
end