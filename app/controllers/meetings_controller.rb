class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy, :attendance, :absence]
  before_action :sign_in_required

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @users_meetings = UsersMeeting.where(meeting_id_id: @meeting.id)
  end

  def show_archived
    @meetings = Meeting.all
  end

  # GET /meetings/new
  def new
    printf("hoge")
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def attendance
    if users_meeting = UsersMeeting.find_by(user_id_id: current_user.id, meeting_id_id: @meeting.id)
      users_meeting.attendance_flg = true
    else
      users_meeting = UsersMeeting.new(
        user_id_id: current_user.id,
        meeting_id_id: @meeting.id,
        attendance_flg: true
      )
    end

    if users_meeting.save
      redirect_to @meeting
    else
      format.html { render :new }
      format.json { render json: @users_meeting.errors, status: :unprocessable_entity }
    end
  end

  def absence
    if users_meeting = UsersMeeting.find_by(user_id_id: current_user.id, meeting_id_id: @meeting.id)
      users_meeting.attendance_flg = false
    else
      users_meeting = UsersMeeting.new(
        user_id_id: current_user.id,
        meeting_id_id: @meeting.id,
        attendance_flg: false
      )
    end

    if users_meeting.save
      redirect_to @meeting
    else
      format.html { render :new }
      format.json { render json: @users_meeting.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:title, :start_datetime, :summary, :finished_flg)
    end

    def sign_in_required
      redirect_to new_user_session_path unless user_signed_in?
    end
end
