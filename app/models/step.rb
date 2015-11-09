class Step < ActiveRecord::Base
  belongs_to :todolist

  validates :nombre, presence: {message: "Tiene que estar presente"}
end
