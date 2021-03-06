class Api::V1::GifsController < ApplicationController
  before_action :find_gif, only: [:show, :update, :destroy]

  def index
    @gifs = Gif.all
    # render json: @gifs.to_json(include: [:reviews]), status: :ok
    render json: @gifs.gif_json, status: :ok
  end

  def show
    # render json: @gif.to_json(include: [:reviews]), status: :ok
    render json: @gif.gif_json, status: :ok
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      render json: @gif, status: :accepted
    else
      render json: { errors: @gif.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @gif.update(gif_params)
      render json: @gif, status: :accepted
    else
      render json: { errors: @gif.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    if @gif.destroy
      render json: {}, status: :no_content
    else
      render json: { errors: @gif.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def gif_params
    params.permit(:title, :url)
  end

  def find_gif
    @gif = Gif.find(params[:id])
  end
end
