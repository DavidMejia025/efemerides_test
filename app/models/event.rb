class Event < ApplicationRecord
  belongs_to :category

  validates :fecha, :texto, presence: true

  def construir_respuesta
    {
      fecha:     fecha,
      texto:     texto,
      url_image: url_imagen,
      category:  self.category&.nombre
    }
  end

  def self.buscar_por_palabra(palabra:)
    events = Event.all

    events.select { |event| event.texto =~ Regexp.new(palabra) }
  end
end
