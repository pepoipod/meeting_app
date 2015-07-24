class TopicsLabelsController < ApplicationController
  before_action :set_topics_label, only: [:show, :edit, :update, :destroy]

  # GET /topics_labels
  # GET /topics_labels.json
  def index
    @topics_labels = TopicsLabel.all
  end

  # GET /topics_labels/1
  # GET /topics_labels/1.json
  def show
  end

  # GET /topics_labels/new
  def new
    @topics_label = TopicsLabel.new
  end

  # GET /topics_labels/1/edit
  def edit
  end

  # POST /topics_labels
  # POST /topics_labels.json
  def create
    @topics_label = TopicsLabel.new(topics_label_params)

    respond_to do |format|
      if @topics_label.save
        format.html { redirect_to @topics_label, notice: 'Topics label was successfully created.' }
        format.json { render :show, status: :created, location: @topics_label }
      else
        format.html { render :new }
        format.json { render json: @topics_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics_labels/1
  # PATCH/PUT /topics_labels/1.json
  def update
    respond_to do |format|
      if @topics_label.update(topics_label_params)
        format.html { redirect_to @topics_label, notice: 'Topics label was successfully updated.' }
        format.json { render :show, status: :ok, location: @topics_label }
      else
        format.html { render :edit }
        format.json { render json: @topics_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics_labels/1
  # DELETE /topics_labels/1.json
  def destroy
    @topics_label.destroy
    respond_to do |format|
      format.html { redirect_to topics_labels_url, notice: 'Topics label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topics_label
      @topics_label = TopicsLabel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topics_label_params
      params.require(:topics_label).permit(:topic_id, :label_id)
    end
end
