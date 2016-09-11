class BirdsController < ApplicationController
  skip_before_filter :verify_authenticity_token, if: :json_request?
  before_action :set_bird, only: [:show, :edit, :update, :destroy]

  # GET /birds format html or json
  def index
    @birds = Bird.where({visible: true})
  end

  # GET /birds/1.<html|json> format html or json
  def show
    respond_to do |format|
      if @bird.blank?
        format.html { render :new, error: 'Bird with given id not found.', status: :not_found }
        format.json { head :not_found }
      else
        format.html { render :show, status: :ok }
        format.json { render :show, status: :ok}
      end
    end
  end

  # GET /birds/new format html 
  def new
    @bird = Bird.new
  end

  # POST /birds.<html|json> format html or json
  def create
    @bird = Bird.new(bird_params)
    respond_to do |format|
      if @bird.save
        format.html { redirect_to @bird, notice: 'Bird was successfully created.' }
        format.json { render :show, status: :created, location: @bird }
      else
        format.html { render :new }
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /birds/1.<html|json> format html or json
  def destroy
    @bird.destroy if @bird.present?
    respond_to do |format|
      if @bird.blank?
        format.html { render :new, error: 'Bird with given id not found.', status: :not_found }
        format.json { head :not_found }
      else
        format.html { redirect_to birds_url, notice: 'Bird was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # callbacks to share common constraints between actions.
    def set_bird
      begin
        @bird = Bird.find(params[:id])
      rescue
        logger.debug(" Bird with id #{params[:id]} not found}")
        @bird = nil
      end
      @bird
    end

    # For allowing only the white list through. 
    def bird_params
      params.require(:bird).permit(:name, :family, :added, :visible, continents_attributes: [:name])
    end
end
