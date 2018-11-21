class SubsController < ApplicationController
  before_action :ensure_moderator, only: [:edit, :update]

  def new
    render :new
  end

  def create
    sub = Sub.new(sub_params)
    sub.user_id = current_user.id
    if sub.save
      redirect_to sub_url(sub)
    else
      flash.now[:errors] = sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def index
    @subs = Sub.all
    render :index
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

private
  def ensure_moderator
    @sub = Sub.find_by(id: params[:id])
    unless @sub.user_id == current_user.id
      flash[:errors] = ["You are not a moderator!"]
      redirect_to subs_url
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
