class StatsController < ApplicationController

  layout 'admin'

  def index
    @stats = Stat.sorted
  end

  def show
    @stat = Stat.find(params[:id])
  end

  def new
    @stat = Stat.new
  end

  def create
    @stat = Stat.new(stat_params)
    if @stat.save
      flash[:notice] = "stat created successfully."
      redirect_to(stats_path)
    else
      render('new')
    end
  end

  def edit
    @stat = Stat.find(params[:id])
  end

  def update
    @stat = Stat.find(params[:id])
    if @stat.update_attributes(stat_params)
      flash[:notice] = "stat updated successfully."
      redirect_to(stat_path(@stat))
    else
      render('edit')
    end
  end

  def delete
    @stat = Stat.find(params[:id])
  end

  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy
    flash[:notice] = "stat destroyed successfully."
    redirect_to(stats_path)
  end

  private

  def stat_params
    params.require(:stat).permit(:pokemon_id, :name, :stat_id)
  end

end
