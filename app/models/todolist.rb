class Todolist < ActiveRecord::Base

	has_many :steps, dependent: :destroy

	validates :titulo, presence: {message: "no puede estar en blanco"},
						length: {minimum: 5, too_short: "el minimo es 5 caracteres"}
	validates :descripcion, presence: {message: "no puede estar en blanco"},
						length: {minimum: 5, too_short: "el minimo es 5 caracteres"}
end
