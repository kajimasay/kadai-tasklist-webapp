class JoblistsController < ApplicationController
  before_action :require_user_logged_in

  before_action :set_joblist, only: [:show, :edit, :update, :destroy]

  def index
     @joblists = Joblist.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @joblist = Joblist.new
  end

  def create
     @joblist = Joblist.new(joblist_params)
     
     if @joblist.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @joblist
    else
      @joblists = joblists.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
        if @joblist.update(joblist_params)
          flash[:success] = 'Task が正常に投稿されました'
          redirect_to @joblist
        else
          flash.now[:danger] = 'Task が投稿されませんでした'
          render :new
        end
  
  end

  def destroy
    @joblist.destroy
    
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to joblists_url
  end
  
  
end

private

  def set_joblist
    @joblist = Joblist.find(params[:id])
  end
  
  # Strong Parameter
  def joblist_params
    params.require(:joblist).permit(:content, :status)
  end
