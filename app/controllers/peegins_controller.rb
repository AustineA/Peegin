class PeeginsController < ApplicationController

  before_action :set_peegin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show, :search, :upvote, :downvote, :userpeegins]
  impressionist :actions=>[:show]
  before_action :agent_smith, only: [:show, :search, :index, :userpeegins]
  before_action :lol, only: [:show, :search, :index, :userpeegins]


  def search

      if params[:search].present?
        @peegins = Peegin.search params[:search], track: true ,order: { cached_votes_score: :desc},  fields: [:title, :origin, :synonyms],misspellings: {edit_distance: 1, below: 1}, page: params[:page], per_page: 8
      else
      redirect_to peegins_path
      end
  end

  def agent_smith
      @browser = Browser.new(request.headers['User-Agent'])
  end

  def lol
      @lol = Peegin.random()
  end

  def userpeegins
    @user = User.find(params[:id])
    @all_user_peegin = @user.peegins.paginate(:page => params[:page], :per_page => 10)
  end



  def index
    @peegin = Peegin.all.order('random()').paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @meta_title = @peegin.title + " - meaning in pidgin english | Peegin Dictionary"
    @meta_description = @peegin.meaning

   impressionist(@peegin) # 2nd argument is optional
   set_meta_tags og: {
              title:    @peegin.title,
              description: @peegin.meaning,
              type:     'website',
              url:      peegin_url(@peegin),
              image:    view_context.image_url('facebook-card.jpg')
            },

            twitter: {
              site_name: @peegin.title,
              site: '@peegin_',
              card: 'summary_large_image',
              description: @peegin.meaning,
              image: view_context.image_url('twitter-card.jpg')
            },

            icon: view_context.image_url('favicon.png'), type: 'image/png'
  end

  def new
    if current_user.name?
    @peegin = current_user.peegins.build
  else
    redirect_to root_path, alert: 'Add a Name to your account and continue'

  end
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
      redirect_to peegin_path, alert:'Sorry You need to Sign in to vote'
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
      params.require(:peegin).permit(:title, :meaning, :example, :slug, :origin, :synonyms)
    end
end
