class Event < ApplicationRecord
  belongs_to :category

  validates :fecha, :texto, presence: true

  def construir_respuesta
    {
      fecha:     fecha,
      texto:     texto,
      url_image: url_imagen,
      category:  self.category.nombre
    }
  end
end
