class PeeginsController < ApplicationController

  before_action :set_peegin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show, :search, :upvote, :downvote, :userpeegins, :phrase, :wod, :random, :recent, :clean, :explore, :glossary]
  impressionist actions: [:show], unique: [:session_hash]
  before_action :agent_smith, only: [:show, :search, :index, :userpeegins, :phrase, :wod, :random, :recent, :clean, :explore, :glossary]
  before_action :lol, only: [:show, :search, :index, :userpeegins, :recent, :wod, :glossary]
  before_action :glossary, only: [:show, :search, :index, :userpeegins, :recent, :wod, :phrase]
  before_action :explore, only: [:show, :search, :index, :userpeegins, :recent, :wod, :glossary, :phrase]


  def search

      if params[:search].present?
        @peegins = Peegin.search params[:search], track: true ,order: { cached_votes_score: :desc},  fields: [:title, :origin, :synonyms],misspellings: {edit_distance: 1, below: 1}, page: params[:page], per_page: 8
      else
      redirect_to peegins_path
      end
  end

  def agent_smith
      @browser = Browser.new(request.headers['User-Agent'])

      @droid = request.user_agent.include?("AndroidApp")

      #Side bar word of the day
      @wod = Peegin.wod.all.limit(1)

  end
  def lol
      @lol = Peegin.random()
  end

  def random
     @peegin = Peegin.random()

    if @droid
      @meta_title =  "Oya make you go check out weytin \'#{@peegin.title}' mean for Peegin Dictionary"
      else
        @meta_title = @peegin.title + " - meaning in pidgin english | Peegin Dictionary"
    end
    @meta_description = @peegin.meaning
    render action: :show
    # redirect_to peegin_path(@peegin.title.parameterize) and return
  end


  def recent
      @peegin = Peegin.home.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
      render action: :index
  end


  def userpeegins
    @user = User.find(params[:id])
    @all_user_peegin = @user.peegins.paginate(:page => params[:page], :per_page => 10)
  end



  def index
      @peegin = Peegin.home.order('random()').paginate(:page => params[:page], :per_page => 10)
  end

  def explore
    @trend = Peegin.most_hit(1.day.ago, 6)
  end

  def glossary
    @glossary = Peegin.order("title ASC").group_by do |peegin|
      p = peegin.title.upcase
      p[0]
    end
  end

  def phrase
    @peegin = Peegin.phrase.paginate(:page => params[:page], :per_page => 10)
    @phrase = Peegin.phrase
    render action: :index
  end

  def wod
    @peegin = Peegin.wod.paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def clean
    @peegin = Peegin.clean.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    render action: :index
  end

  def show
    if @droid
      @meta_title =  "Oya make you go check out weytin \'#{@peegin.title}' mean for Peegin Dictionary"
      else
        @meta_title = @peegin.title + " - meaning in pidgin english | Peegin Dictionary"
    end
    @meta_description = @peegin.meaning

   impressionist(@peegin) # 2nd argument is optional

   @peegin.punch(request)

   set_meta_tags og: {
              title:    @peegin.title,
              description: @peegin.meaning,
              type:     'website',
              url:      peegin_url(@peegin),
              image:    'https://s3-eu-west-2.amazonaws.com/learntocode.com.ng/wp-content/uploads/2018/01/23210822/Facebook.jpg'
            },

            twitter: {
              site_name: @peegin.title,
              site: '@peegin_',
              card: 'summary_large_image',
              description: @peegin.meaning,
              image: 'https://s3-eu-west-2.amazonaws.com/learntocode.com.ng/wp-content/uploads/2018/01/23210233/Twitter.jpg'
            },

            icon: view_context.image_url('favicon.png'), type: 'image/png'
            @phrase = Peegin.phrase
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
    session[:voting_id] = request.remote_ip
    voter = Session.find_or_create_by(ip: session[:voting_id])
    voter.likes @peegin
    redirect_to peegin_path, notice: 'Thanks for voting! Please share with your friends'
  end

  def downvote
    session[:voting_id] = request.remote_ip
    voter = Session.find_or_create_by(ip: session[:voting_id])
    voter.dislikes @peegin
    redirect_to peegin_path, notice: 'Ouch! your vote has been counted. Please share with your friends'
  end

  private



    def set_peegin
        @peegin = Peegin.find_by_permalink(params[:id])
      end

    def peegin_params
      params.require(:peegin).permit(:title, :meaning, :example, :slug, :origin, :synonyms, :word_of_the_day, :basic_phrase)
    end
end
