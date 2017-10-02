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
      flash[:success] = 'Tasklist が正常に投稿されました'
      redirect_to @joblist
    else
      flash.now[:danger] = 'Tasklist が投稿されませんでした'
      render :new
    end
  end

  def edit
    @joblist = Joblist.find(params[:id])
  end

  def update
    @joblist = Joblist.find(params[:id])
    
        if @joblist.update(joblist_params)
          flash[:success] = 'Tasklist が正常に投稿されました'
          redirect_to @joblist
        else
          flash.now[:danger] = 'Tasklist が投稿されませんでした'
          render :new
        end
  
  end

  def destroy
  end
  
  
end

private

  # Strong Parameter
  def joblist_params
    params.require(:joblist).permit(:content, :status)
  end
