class PeeginsController < ApplicationController

  before_action :set_peegin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @peegin = Peegin.all
  end

  def show
    @meta_title = @peegin.title
    @meta_description = @peegin.meaning
  end

  def new
    @peegin = current_user.peegins.build
  end

  def edit

  end

  def create
    @peegin = current_user.peegins.build(peegin_params)

    if @peegin.save
      redirect_to @peegin, notice: 'Your Peegin has been added'
    else
      render 'new'
    end
  end

  def update


    if @peegin.update(peegin_params)
      redirect_to @peegin
    else
      render 'edit'
    end
  end

  def destroy

    @peegin.destroy

    redirect_to peegins_path
  end

  private

    def set_peegin
        @peegin = Peegin.find_by_permalink(params[:id])
      end

    def peegin_params
      params.require(:peegin).permit(:title, :meaning, :example, :slug)
    end
end
