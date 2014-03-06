class ShortsController < ApplicationController
  before_action :set_short, only: [:show ]

  # GET /shorts
  # GET /shorts.json


  # GET /shorts/1
  # GET /shorts/1.json
  def show
    @short = Short.find(params[:id].to_i(36))

  respond_to do |format|
   format.html { redirect_to @short.long }
    end
  end

  # GET /shorts/new
  def new
    @short = Short.new

  respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /shorts/1/edit
  

  # POST /shorts
  # POST /shorts.json
def create
  @short = Short.new(params[:short])

  respond_to do |format|
    if @short.save
      format.html { render action: "show" } 
    else
      format.html { render action: "new" }
    end
  end
end


  # PATCH/PUT /shorts/1
  # PATCH/PUT /shorts/1.json
  

  # DELETE /shorts/1
  # DELETE /shorts/1.json
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short
      @short = Short.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_params
      params.require(:short).permit(:long)
    end
end
