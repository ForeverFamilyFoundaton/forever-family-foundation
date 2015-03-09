class ExportsController < ApplicationController
  before_action :set_export, only: [:show, :edit, :update, :destroy]

  # GET /exports
  def index
    @exports = Export.all
  end

  # GET /exports/1
  def show
    if @export.has_file?
      send_file @export.file.path
    else
      render :show
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
      params.require(:export).permit()
    end
end
