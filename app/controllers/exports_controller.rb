class ExportsController < ApplicationController
  before_action :set_export, only: [:show, :edit, :update, :destroy]

  # GET /exports
  def index
    @exports = Export.all
  end

  # GET /exports/1
  def show
    if @export.file.try(:path).nil?
      render :show
    else
      send_file @export.file.path
    end
  end

  # GET /exports/new
  def new
    @export = Export.new
  end

  # GET /exports/1/edit
  def edit
  end

  # POST /exports
  def create
    @export = Export.create

    if @export
      redirect_to @export, notice: 'Export was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exports/1
  def update
    if @export.update(export_params)
      redirect_to @export, notice: 'Export was successfully updated.'
    else
      render :edit
    end 
  end

  # DELETE /exports/1
  def destroy
    @export.destroy
    redirect_to exports_url, notice: 'Export was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_export
      @export = Export.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def export_params
      params[:export]
    end
end
