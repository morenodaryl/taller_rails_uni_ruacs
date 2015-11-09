class TodolistController < ApplicationController

	# Ver todas las cosas por hacer
	def index
		@lista = Todolist.all.order(estado: :ASC, updated_at: :DESC)
	end

	# Ver vista de crear un nuevo recurso
	def new

	end

	def edit
		@tarea = Todolist.find(params[:id])
	end

	def update_all
		lista = Todolist.find(params[:id])

		lista.titulo = params[:titulo]
		lista.descripcion = params[:descripcion]
		
		if lista.save
			flash[:notice] = "Tarea Actualizada con éxito"
			redirect_to action: :index
		else
			flash[:alert] = lista.errors.full_messages
			redirect_to action: :edit
		end
	end

	# POST para crear un nuevo recurso
	def create
		lista = Todolist.new

		lista.titulo = params[:titulo]
		lista.descripcion = params[:descripcion]
		lista.estado = false
		
		if lista.save
			flash[:notice] = "Tarea creada con éxito"
			redirect_to action: :index
		else
			flash[:alert] = lista.errors.full_messages
			redirect_to action: :new
		end
		
	end

	# Actualizar estado de la tarea
	def update
		lista = Todolist.find(params[:id])

		lista.estado = !lista.estado
		lista.save

		if lista.estado
			flash[:notice] = "'#{lista.titulo}' - Completado"
		else
			flash[:alert] = "'#{lista.titulo}' - No Completada"
		end
		redirect_to action: :index
	end

	def destroy
		lista = Todolist.find(params[:id])

		lista.destroy

		flash[:notice] = "Tarea eliminada"
		redirect_to action: :index
	end



end