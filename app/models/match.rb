class Match < ApplicationRecord
  #validates :teamA, :teamB, :state, :result ,presence: true # Validar parametro que se entregan
  belongs_to :teamA # Asociacion a equipo A
  belongs_to :teamB # Asociacion a equipo B
end
