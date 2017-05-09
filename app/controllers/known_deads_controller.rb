class KnownDeadsController < ApplicationController
  before_action :set_known_dead, only: [:show, :edit, :update, :destroy]

  def index
    logger.debug "----- Sitterforms index -----"
    @known_dead = KnownDead.all
  end

  def new
    logger.debug "----- KnownDead index -----"
    @known_dead = KnownDead.new
  end

  # POST /sitterforms
  # POST /sitterforms.json
  def create
    logger.debug "----- KnownDead create -----"
    @known_dead = KnownDead.new(known_dead_params)

    respond_to do |format|
      if @known_dead.save
        format.html { redirect_to @known_dead, notice: 'Sitterform was successfully created.' }
        format.json { render :show, status: :created, location: @known_dead }
      else
        format.html { render :new }
        format.json { render json: @known_dead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    logger.debug "KnownDead Update -----"
    respond_to do |format|
      if @known_dead.update(known_dead_params)
        format.html { redirect_to @known_dead, notice: 'KnownDead was successfully updated.' }
        format.json { render :show, status: :ok, location: @known_dead }
      else
        format.html { render :edit }
        format.json { render json: @known_dead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @known_dead.destroy
    respond_to do |format|
      format.html { redirect_to known_deads_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_known_dead
      @known_dead = KnownDead.find(params[:id])
    end

    def known_dead_params
      params.require(:known_dead).permit(:id, :user_id, :relationship_id, :sitterform_id, :name, :relationship, :year_of_death)
    end
end

