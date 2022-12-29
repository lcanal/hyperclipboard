class ClipController < ApplicationController
  def create
    @clip = Clip.new(clip_params)
    @clip.expires = Time.new + 7.days

    unless @clip.url.nil?
      og = OpenGraph.new(@clip.url)
      @clip.og_title = og.title
      @clip.og_images = og.images
    end

    respond_to do |format|
      if @clip.save
        format.html { redirect_to root_path(@clip), notice: 'Clip was successfully created.' }
        format.json { render :show, status: :created, location: @clip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_clip
    @clip = Clip.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def clip_params
    params.permit(:name, :description, :filename, :url, :type, :preview)
  end
end
