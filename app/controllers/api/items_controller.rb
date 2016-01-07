class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def authenticated?
    authenticate_or_request_with_http_basic {|username, password| User.where( username: username, password: password).present?}
  end
end
