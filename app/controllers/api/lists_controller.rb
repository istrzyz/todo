class Api::ListsController < ApiController
  before_action :authenticated?

  def create
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages} , status: :unprocessable_entity
    end
end
