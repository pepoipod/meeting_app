class MeetingsTopicsController < ApplicationController
  before_action :set_meetings_topic, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required

  # GET /meetings_topics
  # GET /meetings_topics.json
  def index
    @meetings_topics = MeetingsTopic.all
  end

  # GET /meetings_topics/1
  # GET /meetings_topics/1.json
  def show
  end

  # GET /meetings_topics/new
  def new
    @meetings_topic = MeetingsTopic.new
  end

  # GET /meetings_topics/1/edit
  def edit
  end

  # POST /meetings_topics
  # POST /meetings_topics.json
  def create
    @meetings_topic = MeetingsTopic.new(meetings_topic_params)

    respond_to do |format|
      if @meetings_topic.save
        format.html { redirect_to @meetings_topic, notice: 'Meetings topic was successfully created.' }
        format.json { render :show, status: :created, location: @meetings_topic }
      else
        format.html { render :new }
        format.json { render json: @meetings_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings_topics/1
  # PATCH/PUT /meetings_topics/1.json
  def update
    respond_to do |format|
      if @meetings_topic.update(meetings_topic_params)
        format.html { redirect_to @meetings_topic, notice: 'Meetings topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetings_topic }
      else
        format.html { render :edit }
        format.json { render json: @meetings_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings_topics/1
  # DELETE /meetings_topics/1.json
  def destroy
    @meetings_topic.destroy
    respond_to do |format|
      format.html { redirect_to meetings_topics_url, notice: 'Meetings topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetings_topic
      @meetings_topic = MeetingsTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meetings_topic_params
      params.require(:meetings_topic).permit(:meeting_id_id, :topic_id_id)
    end

    def sign_in_required
      redirect_to new_user_session_path unless user_signed_in?
    end
end
