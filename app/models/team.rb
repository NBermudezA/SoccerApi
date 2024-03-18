class Team < ApplicationRecord
    validates :name, :stadium, :capacity, :city ,presence: true # Validar parametro que se entregan
    has_many :matches # Asociacion a partidos
end
