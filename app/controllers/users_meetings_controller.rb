class UsersMeetingsController < ApplicationController
  before_action :set_users_meeting, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required

  # GET /users_meetings
  # GET /users_meetings.json
  def index
    @users_meetings = UsersMeeting.all
  end

  # GET /users_meetings/1
  # GET /users_meetings/1.json
  def show
  end

  # GET /users_meetings/new
  def new
    @users_meeting = UsersMeeting.new
  end

  # GET /users_meetings/1/edit
  def edit
  end

  # POST /users_meetings
  # POST /users_meetings.json
  def create
    @users_meeting = UsersMeeting.new(users_meeting_params)

    respond_to do |format|
      if @users_meeting.save
        format.html { redirect_to @users_meeting, notice: 'Users meeting was successfully created.' }
        format.json { render :show, status: :created, location: @users_meeting }
      else
        format.html { render :new }
        format.json { render json: @users_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_meetings/1
  # PATCH/PUT /users_meetings/1.json
  def update
    respond_to do |format|
      if @users_meeting.update(users_meeting_params)
        format.html { redirect_to @users_meeting, notice: 'Users meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_meeting }
      else
        format.html { render :edit }
        format.json { render json: @users_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_meetings/1
  # DELETE /users_meetings/1.json
  def destroy
    @users_meeting.destroy
    respond_to do |format|
      format.html { redirect_to users_meetings_url, notice: 'Users meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_meeting
      @users_meeting = UsersMeeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_meeting_params
      params.require(:users_meeting).permit(:user_id_id, :meeting_id_id, :attendance_flg)
    end

    def sign_in_required
      redirect_to new_user_session_path unless user_signed_in?
    end
end
