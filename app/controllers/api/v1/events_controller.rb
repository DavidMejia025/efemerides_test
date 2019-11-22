class Api::V1::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @category = obtener_categoria(nombre_categoria: event_params[:categoria])

    if @category.events.create(
      fecha: event_params[:fecha],
      texto: event_params[:texto],
      url_imagen: event_params[:url_imagen]
    )
      head :ok
    else
      render json: "Hubo un error y el evento no fue creado exitosamente", status: 422
    end
  end

  def event
    if params[:fecha]
      @events = Event.where(fecha: Date.parse(params[:fecha]))
    else
      @events = Event.where(fecha: Date.today)
    end

    render json: @events.map(&:construir_respuesta).to_json, status: 200
  end

  private
    def obtener_categoria(nombre_categoria:)
      Category.find_by(nombre: nombre_categoria) || Category.create(nombre: nombre_categoria)
    end

    def event_params
      params.permit(:id, :fecha, :texto, :url_imagen, :categoria)
    end
end
