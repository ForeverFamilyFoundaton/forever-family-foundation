class SitterformsController < ApplicationController
  before_action :set_sitterform, only: [:show, :edit, :update, :destroy]

  def index
    logger.debug "----- Sitterforms index -----"
    @sitterform = Sitterform.all
  end

  def new
    logger.debug "----- Sitterforms new -----"
    logger.debug "----- "+ current_user.id.to_s + " -----"
    # user = Sitterform.find(:user_id current_user.id)
    @sitterform = Sitterform.find_by(user_id: current_user.id) || Sitterform.new()
    @relationships = Relationship.all
    @sitterform.known_deads.build 
    logger.debug "@sitterform.known_deads ----- "+ @sitterform.known_deads.inspect + " -----"
    @sitterform.user_id = current_user.id
    logger.debug "----- " + current_user.id.to_s + " -----"
  end

  def show
    logger.debug "----- Sitterforms show -----"
    # @sitterform = Sitterform.find(params[:id])
  end

  def edit
    logger.debug "----- Sitterforms edit -----"
    @sitterform = Sitterform.find(params[:id])
    logger.debug "===== " + @sitterform.inspect + " ====="
  end

  # POST /sitterforms
  # POST /sitterforms.json
  def create
    logger.debug "----- Sitterforms create -----"
    @sitterform = Sitterform.new(sitterform_params)

    respond_to do |format|
      if @sitterform.save
        format.html { redirect_to @sitterform, notice: 'Sitterform was successfully created.' }
        format.json { render :show, status: :created, location: @sitterform }
      else
        format.html { render :new }
        format.json { render json: @sitterform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sitterforms/1
  # PATCH/PUT /sitterforms/1.json
  def update
    @sitterform = Sitterform.find(params[:id])
    logger.debug "----- Sitterforms update -----"
    logger.debug "sitterform.inspect -----" + @sitterform.inspect + " -----"
    respond_to do |format|
      if @sitterform.update(sitterform_params)
        format.html { redirect_to @sitterform, notice: 'Sitterform was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitterform }
      else
        format.html { render :edit }
        format.json { render json: @sitterform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user2s/1
  # DELETE /user2s/1.json
  def destroy
    @sitterform = Sitterform.find(params[:id])
    logger.debug "----- Sitterforms update -----"
    @sitterform.destroy
    respond_to do |format|
      format.html { redirect_to @sitterform, notice: 'Sitterform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_sitterform
      @sitterform = Sitterform.find(params[:id])
      logger.debug "----- set_sitterform -----"
      logger.debug @sitterform.inspect
    end

    def sitterform_params
      params.require(:sitterform).permit(:user_id, :phone, :alt_email, :cell, :website, :facebook, :pinterest, \
        :instagram, :twitter, :youtube, :blog, :related_contact_info, :been_to_medium, :consider_yourself, \
        :lost_loved_one, :signature, \
        known_deads_attributes:[:id, :user_id, :relationship_id, :sitterform_id, :name, :_destroy])
    end
end

