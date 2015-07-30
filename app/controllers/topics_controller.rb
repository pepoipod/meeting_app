class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :edit_label, :add_comment, :update, :destroy, :toggle]
  before_action :get_labels, only: [:edit_label]
  before_action :sign_in_required

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.order('created_at desc')
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  def show_archived
    @topics = Topic.order('created_at desc')
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  def edit_label
    @topics_labels = TopicsLabel.where(topic_id: @topic.id)
  end

  def add_label
    @topic = Topic.find(params[:topic_id])
    topics_label = TopicsLabel.new(
      topic_id: params[:topic_id],
      label_id: params[:label_id]
    )

    if topics_label.save
      redirect_to @topic
    else
      format.html { render :new }
      format.json { render json: topics_label.errors, status: :unprocessable_entity }
    end
  end

  def remove_label
    @topics_label = TopicsLabel.find(params[:id])
    @topics_label.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_comment
    @topic_comment = @topic.comments.create body: params[:body], user_id: current_user.id
  end

  # POST /topics
  # POST /topics.json
  def create
    parameters = topic_params
    parameters[:user_id] = current_user.id
    @topic = Topic.new(parameters)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle
    @topic.finished_flg = !@topic.finished_flg
    if @topic.save
      redirect_to @topic
    else
      format.html { render :edit }
      format.json { render json: @topic.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def get_labels
      @labels = Label.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :body, :finished_flg, :page_id)
    end

    def sign_in_required
      redirect_to new_user_session_path unless user_signed_in?
    end
end
