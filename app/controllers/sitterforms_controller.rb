class SitterformsController < ApplicationController
  before_action :set_sitterform, only: [:show, :edit, :update, :destroy]

  def index
    logger.debug "----- Sitterforms index -----"
    @sitterform = Sitterform.all
  end

  def new
    logger.debug "----- Sitterforms new -----"
    logger.debug "----- "+ current_user.id.to_s + " -----"
    @user = User.find(current_user.id)
    if Sitterform.exists?(user_id: current_user.id)
      logger.debug "---- sitterform exists ----"
      @sitterforms = Sitterform.find_by(user_id: current_user.id)
      n = @sitterforms.known_deads.count
      (5-n).times {@sitterforms.known_deads.build}
      redirect_to action: 'edit', id: @sitterforms.id
    else
      logger.debug "---- sitterform new ----"
      @sitterforms = Sitterform.new()
      5.times {@sitterforms.known_deads.build}
    end
    logger.debug "----- still in Sitterforms new -----"
    @relationships = Relationship.all

    logger.debug "@sitterform -----" + @sitterforms.inspect + " -----"
    logger.debug "@sitterform.known_deads ----- "+ @sitterforms.known_deads.inspect + " -----"
    @sitterforms.user_id = current_user.id
    logger.debug "----- " + current_user.id.to_s + " -----"
  end

  def show
    logger.debug "----- Sitterforms show -----"
    @sitterforms = Sitterform.find(params[:id])
  end

  def edit
    logger.debug "----- Sitterforms edit -----"
    @sitterforms = Sitterform.find(params[:id])
    if (@sitterforms.user_id != current_user.id)
      redirect_to root_path
    end

    @user = User.find(@sitterforms.user_id)
    logger.debug " >>> " + @sitterforms.user_id.to_s + "<<<>>>" + current_user.id.to_s + " <<<"
    n = @sitterforms.known_deads.count
    (5-n).times {@sitterforms.known_deads.build}
    logger.debug "===== " + @sitterforms.inspect + " ====="
  end

  # POST /sitterforms
  # POST /sitterforms.json
  def create
    logger.debug "----- Sitterforms create -----"
    @sitterform = Sitterform.new(sitterform_params)
    @sitterform.user_id = current_user.id
    logger.debug "sitterform >>>>>" + @sitterform.inspect + "<<<<<"
    logger.debug "user >>>>>" + @user.inspect + "<<<<<"

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
    logger.debug "----- Sitterforms UPDATE -----"
    logger.debug "sitterform_params ----- " + sitterform_params.inspect + " -----"
    # logger.debug ">>>>> " + params['known_deads_attributes'].inspect + " <<<<<"

    respond_to do |format|
      if @sitterform.update_attributes(sitterform_params)
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
 
    end

    def sitterform_params
      params.require(:sitterform).permit(:user_id, :phone, :alt_email, :cell, :website, :facebook, :pinterest, \
        :instagram, :twitter, :youtube, :blog, :related_contact_info, :been_to_medium, :belief_type_id, \
        :lost_loved_one, :medium_contacts,\
        [known_deads_attributes: [:id, :user_id, :relationship_id, :sitterform_id, :name, :year_of_death, :_destroy]], :signature)
    end
end

