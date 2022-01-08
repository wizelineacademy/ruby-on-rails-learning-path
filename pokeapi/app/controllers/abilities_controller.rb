class AbilitiesController < ApplicationController
  
  layout 'admin'

  def index
    @abilities = Ability.sorted
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def new
    @ability = Ability.new
  end

  def create
    @ability = Ability.new(Ability_params)
    if @ability.save
      flash[:notice] = "Ability created successfully."
      redirect_to(abilities_path)
    else
      render('new')
    end
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update_attributes(Ability_params)
      flash[:notice] = "Ability updated successfully."
      redirect_to(ability_path(@ability))
    else
      render('edit')
    end
  end

  def delete
    @ability = Ability.find(params[:id])
  end

  def destroy
    @ability = Ability.find(params[:id])
    @ability.destroy
    flash[:notice] = "Ability destroyed successfully."
    redirect_to(abilities_path)
  end

  private

  def Ability_params
    params.require(:ability).permit(:pokemon_id, :name, :ability_id)
  end
end
