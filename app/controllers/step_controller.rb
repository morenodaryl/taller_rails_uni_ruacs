class StepController < ApplicationController
	def index
		@tarea = Todolist.find(params[:tarea_id])
	end

	def create
		paso = Step.new
		paso.todolist_id = params[:tarea_id]
		paso.nombre = params[:nombre]

		if paso.save
			flash[:notice] = "Paso creado con éxito"
			redirect_to action: :index
		else
			flash[:alert] = paso.errors.full_messages
			redirect_to action: :index
		end
	end

	def destroy
		flash[:notice] = "Paso eliminado correctamente"
		if Step.find(params[:id]).destroy
			redirect_to action: :index
		end
	end
end