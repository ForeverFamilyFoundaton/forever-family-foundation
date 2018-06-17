class SitterformsController < ApplicationController
  before_action :set_sitterform, only: [:show, :edit, :update, :destroy]

  def index
    logger.debug "----- Sitterforms index -----"
    @sitterform = Sitterform.all
  end

  def new
    logger.debug "----- Sitterforms new entry -----"
    logger.debug "----- "+ current_user.id.to_s + " -----"
    @user = User.find(current_user.id)
    if Sitterform.exists?(user_id: current_user.id)
      logger.debug "---- sitterform exists ----"
      @sitterform = Sitterform.find_by(user_id: current_user.id)
      build_known_deads
      redirect_to action: 'edit', id: @sitterform.id
    else
      logger.debug "---- sitterform new ----"
      @sitterform = Sitterform.new()
      build_known_deads
    end
    logger.debug "----- still in Sitterforms new -----"
    @relationships = Relationship.all

    logger.debug "@sitterform -----" + @sitterform.inspect + " -----"
    logger.debug "@sitterform.known_deads ----- "+ @sitterform.known_deads.inspect + " -----"
    @sitterform.user_id = current_user.id
    logger.debug "----- " + current_user.id.to_s + " -----"
  end

  def show
    logger.debug "----- Sitterforms show -----"
    @sitterform = Sitterform.find(params[:id])
  end

  def edit
    logger.debug "----- Sitterforms edit -----"
    @sitterform = Sitterform.find(params[:id])
    if (@sitterform.user_id != current_user.id)
      redirect_to root_path
    end

    @user = User.find(@sitterform.user_id)
    logger.debug " >>> " + @sitterform.user_id.to_s + "<<<>>>" + current_user.id.to_s + " <<<"
    n = @sitterform.known_deads.count
    (5-n).times {@sitterform.known_deads.build}
    logger.debug "===== " + @sitterform.inspect + " ====="
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
        if @sitterform.signature_checkbox
          @user = current_user
          @user.sitter_registration = false
          @user.save
        end
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
    logger.debug "error count>>>>> " + @sitterform.errors.count.to_s
    logger.debug "@sitterform ----- " + @sitterform.inspect + " -----"
    logger.debug "sitterform_params ----- " + sitterform_params.inspect + " -----"
    # logger.debug ">>>>> " + params['known_deads_attributes'].inspect + " <<<<<"

    respond_to do |format|
      if @sitterform.update(sitterform_params)
        if @sitterform.signature_checkbox
          @user = current_user
          @user.sitter_registration = false
          @user.save
        end
        format.html { redirect_to @sitterform, notice: 'Sitterform was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitterform }
      else
        logger.debug "@sitterform2 ----- " + @sitterform.inspect + " -----"
        logger.debug "@sitterform.errors >>>>> " + @sitterform.errors.to_s + "<<<<<"
        build_known_deads
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

    def build_known_deads
      if @sitterform.known_deads.nil?
        5.times {@sitterform.known_deads.build}
      else
        n = @sitterform.known_deads.count
        (5-n).times {@sitterform.known_deads.build}
      end
    end

    def set_sitterform
      @sitterform = Sitterform.find(params[:id])
 
    end

    def sitterform_params
      params.require(:sitterform).permit(:user_id, :phone, :alt_email, :cell, :website, :facebook, :pinterest, \
        :instagram, :twitter, :youtube, :blog, :related_contact_info, :been_to_medium, :belief_type_id, \
        :lost_loved_one, :medium_contacts,\
        [known_deads_attributes: [:id, :user_id, :relationship_id, :sitterform_id, :name, :year_of_death, :_destroy]], :signature, :signature_checkbox)
    end
end

