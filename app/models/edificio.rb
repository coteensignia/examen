class Edificio < ApplicationRecord
    has_many :oficinas
    has_one_attached :foto_portada
end
