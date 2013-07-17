class StandupsController < ApplicationController
  before_action :set_standup, only: [:show, :edit, :update, :destroy]

  # GET /standups
  # GET /standups.json
  def index
    @standups = Standup.all
  end

  # GET /standups/1
  # GET /standups/1.json
  def show
  end

  # GET /standups/new
  def new
    @standup = Standup.new
  end

  # GET /standups/1/edit
  def edit
  end

  # POST /standups
  # POST /standups.json
  def create
    @standup = Standup.new(standup_params)

    respond_to do |format|
      if @standup.save
        format.html { redirect_to @standup, notice: 'Standup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @standup }
      else
        format.html { render action: 'new' }
        format.json { render json: @standup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /standups/1
  # PATCH/PUT /standups/1.json
  def update
    respond_to do |format|
      if @standup.update(standup_params)
        format.html { redirect_to @standup, notice: 'Standup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @standup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standups/1
  # DELETE /standups/1.json
  def destroy
    @standup.destroy
    respond_to do |format|
      format.html { redirect_to standups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standup
      @standup = Standup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standup_params
      params.require(:standup).permit(:team_id)
    end
end
