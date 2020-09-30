class Airline < ApplicationRecord
    has_many :reviews
    before_create :slugify

    #Lo que hace este metodo es tomar el nombre de la aerolinea y parametizarla (Este metodo seapara la cade en "-" Ej: Air Chile a air-chile)
    def slugify
        self.slug = name.parameterize 
    end
    # .round = el valor sera redondeado a 2 numeros Ej: 16.873 a 16.87 | to_f = vuelve flotante ej: 5 a 5.0
    def avg_score
        reviews.average(:score).round(2).to_f
    end
end
