class BeliefTypesController < ApplicationController
  before_action :set_belief_type, only: [:show, :edit, :update, :destroy]

  # GET /belief_types
  def index
    @belief_types = BeliefType.all
  end

  # GET /belief_types/1
  def show
  end

  # GET /belief_types/new
  def new
    @belief_type = BeliefType.new
  end

  # GET /belief_types/1/edit
  def edit
  end

  # POST /belief_types
  def create
    @belief_type = BeliefType.new(belief_type_params)

    if @belief_type.save
      redirect_to @belief_type, notice: 'Belief type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /belief_types/1
  def update
    if @belief_type.update(belief_type_params)
      redirect_to @belief_type, notice: 'Belief type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /belief_types/1
  def destroy
    @belief_type.destroy
    redirect_to belief_types_url, notice: 'Belief type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_belief_type
      @belief_type = BeliefType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def belief_type_params
      params.require(:belief_type).permit(:name)
    end
end
