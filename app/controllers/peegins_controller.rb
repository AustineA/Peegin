class PeeginsController < ApplicationController

  before_action :set_peegin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show, :search, :upvote, :downvote]



  def search

    if params[:search].present?
      @peegins = Peegin.search params[:search], order: [ {title: :asc},{meaning: :asc},{example: :asc}, { cached_votes_total: :desc} ], page: params[:page], per_page: 10
    else
    redirect_to peegins_path
  end

end

  def index
    @peegin = Peegin.all.order( cached_votes_score: :desc, created_at: :desc).paginate(:page => params[:page], :per_page => 8)
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
    respond_to do |format|
      format.html { redirect_to peegins_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
   end

  end

  def upvote
    if user_signed_in?
      @peegin.upvote_from current_user
      redirect_to peegin_path, notice: 'Thanks for voting! Please share with your friends'
    else
      redirect_to peegin_path, alert: "Sorry You need to sign in to vote"
    end
  end

  def downvote
    if user_signed_in?
      @peegin.downvote_from current_user
      redirect_to peegin_path, notice: 'Ouch! your vote has been counted. Please share with your friends'
    else
      redirect_to peegin_path, alert: 'Sorry you need to sign in to vote'
    end
  end

  private


    def set_peegin
        @peegin = Peegin.find_by_permalink(params[:id])
      end

    def peegin_params
      params.require(:peegin).permit(:title, :meaning, :example, :slug, :origin)
    end
end
