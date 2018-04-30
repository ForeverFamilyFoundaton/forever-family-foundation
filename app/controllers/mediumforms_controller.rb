class MediumformsController < ApplicationController
  before_action :set_mediumform, only: [:show, :edit, :update, :destroy]

  def index
    logger.debug "----- Mediumforms index -----"
    @mediumform = Mediumform.all
  end

  def new
    logger.debug "----- Mediumforms new entry -----"
    logger.debug "----- "+ current_user.id.to_s + " -----"
    @user = User.find(current_user.id)
    if Mediumform.exists?(user_id: current_user.id)
      logger.debug "---- mediumform exists ----"
      @mediumform = Mediumform.find_by(user_id: current_user.id)
    else
        logger.debug "---- mediumform new ----"
         @mediumform = Mediumform.new()
    end
    logger.debug "----- still in Mediumforms new -----"

    logger.debug "@mediumform -----" + @mediumform.inspect + " -----"
    @mediumform.user_id = current_user.id
    logger.debug "----- " + current_user.id.to_s + " -----"
  end

  def show
    logger.debug "----- Mediumforms show -----"
    @mediumform = Mediumform.find(params[:id])
  end

  def edit
    logger.debug "----- Mediumforms edit -----"
    @mediumform = Mediumform.find(params[:id])
    if (@mediumform.user_id != current_user.id)
      redirect_to root_path
    end

    @user = User.find(@mediumform.user_id)
    logger.debug " >>> " + @mediumform.user_id.to_s + "<<<>>>" + current_user.id.to_s + " <<<"
  #   n = @mediumform.known_deads.count
  #   (5-n).times {@mediumform.known_deads.build}
  #   logger.debug "===== " + @mediumform.inspect + " ====="
  end

  # POST /mediumforms
  # POST /mediumforms.json
  def create
    logger.debug "----- Mediumforms create -----"
    @mediumform = Mediumform.new(mediumform_params)
    @mediumform.user_id = current_user.id
    logger.debug "mediumform >>>>>" + @mediumform.inspect + "<<<<<"
    logger.debug "user >>>>>" + @user.inspect + "<<<<<"

    respond_to do |format|
      if @mediumform.save
        if @mediumform.signature_checkbox
          @user = current_user
          @user.medium_registration = false
          @user.save
        end
        format.html { redirect_to @mediumform, notice: 'Mediumform was successfully created.' }
        format.json { render :show, status: :created, location: @mediumform }
      else
        format.html { render :new }
        format.json { render json: @mediumform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mediumforms/1
  # PATCH/PUT /mediumforms/1.json
  def update
    logger.debug "----- Mediumforms UPDATE -----"
    logger.debug "error count>>>>> " + @mediumform.errors.count.to_s
    logger.debug "@mediumform ----- " + @mediumform.inspect + " -----"
    logger.debug "mediumform_params ----- " + mediumform_params.inspect + " -----"

    respond_to do |format|
      if @mediumform.update(mediumform_params)
        if @mediumform.signature_checkbox
          @user = current_user
          @user.medium_registration = false
          @user.save
        end
        format.html { redirect_to @mediumform, notice: 'Mediumform was successfully updated.' }
        format.json { render :show, status: :ok, location: @mediumform }
      else
        logger.debug "@mediumform2 ----- " + @mediumform.inspect + " -----"
        logger.debug "@mediumform.errors >>>>> " + @mediumform.errors.to_s + "<<<<<"
        format.html { render :edit }
      end
    end
  end

  # DELETE /user2s/1
  # DELETE /user2s/1.json
  def destroy
    @mediumform = Mediumform.find(params[:id])
    logger.debug "----- Mediumforms delete -----"
    @Mediumform.destroy
    respond_to do |format|
      format.html { redirect_to @mediumform, notice: 'Mediumform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_mediumform
      @mediumform = Mediumform.find(params[:id])
 
    end

    def mediumform_params
      params.require(:mediumform).permit(:user_id, \
        :use_professional, :professional_name, :professional_address_line1, :professional_address_line2, \
        :professional_phone_number, :professional_email, \
        :use_personal, :personal_name, :personal_address_line, :personal_address_line2, \
        :personal_phone_number, :personal_email, \
        :other_businesses, :health_healing, \
        :other_primary_owner, :other_related, :other_not_related,
        :website, :blog, :facebook, :pinterest, :instagram, :twitter, :youtube, :other, \
        :sitter1, :sitter2, :sitter3, :sitter4, :sitter5, \
        :signature_checkbox, :signature, \
        :ethics1, :ethics2, :ethics3, :ethics4, \
        :became_aware, :immediate_family, :life_event, :specific_goal, :medium_priority, \
        :different_info, :hear_about_fff, :medium_history, :mediumship_training, \
        :other_classify, :self_classify)
    end
end

