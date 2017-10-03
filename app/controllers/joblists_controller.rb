class JoblistsController < ApplicationController
  def index
     @joblists = Joblist.all.page(params[:page]).per(10)
  end

  def show
    @joblist = Joblist.find(params[:id])
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
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
    @joblist = Joblist.find(params[:id])
  end

  def update
    @joblist = Joblist.find(params[:id])
    
        if @joblist.update(joblist_params)
          flash[:success] = 'Task が正常に投稿されました'
          redirect_to @joblist
        else
          flash.now[:danger] = 'Task が投稿されませんでした'
          render :new
        end
  
  end

  def destroy
    @joblist = Joblist.find(params[:id])
    @joblist.destroy
    
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to joblists_url
  end
  
  
end

private

  # Strong Parameter
  def joblist_params
    params.require(:joblist).permit(:content, :status)
  end
