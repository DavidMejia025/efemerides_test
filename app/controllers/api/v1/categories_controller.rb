class Api::V1::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @category = Category.new

    if @category.save(nombre: params[:nombre])
      head :ok
    else
      render json: "Hubo un error creando la categoria", status: 422
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(nombre: params[:nombre])
      head :ok
    else
      render json: "Hubo un error y la categoria no fue editada exitosamente", status: 422
    end
  end
end
