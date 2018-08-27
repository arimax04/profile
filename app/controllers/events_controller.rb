class EventsController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @events = Eventmaster.all
  end
  def new
    @event = Eventmaster.new
  end

  def show
    @participants = Participant.where("event_id = #{params[:id]}").pluck(:event_id)
    @profiles = Profile.find(@participants)
  end


  def create
    @event = Eventmaster.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_path(@event), notice: '新しく登録されました。' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /profiles/1/edit
  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_path(@event), notice: '正常に更新されました。' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: '消去されました。' }
      format.json { head :no_content }
    end
  end

  def addnewtoevent
    unless params[:ajax_handler].blank?
      search_action_with_ajax

    else
      @profiles = Profile.all

    end
    @participants = Participant.where("event_id = #{params[:id]}").pluck(:newcomer_id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def addnewtoeventprocess
    participant = Participant.new({newcomer_id: params[:profileid],event_id: params[:id]})
    respond_to do |format|
      if participant.save
        format.html { redirect_to "/profiles/events/#{params[:id]}/addnewtoevent", notice: '新しく登録されました。' }
        format.json { render :show, status: :created, location: participant }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def deletenewfromeventprocess
    participant = Participant.find_by(newcomer_id: params[:profileid])
    respond_to do |format|
      if participant.delete
        format.html { redirect_to "/profiles/events/#{params[:id]}/addnewtoevent", notice: '登録解除しました。' }
        format.json { render :show, status: :created, location: participant }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_profile
      @event = Eventmaster.find(params[:id])
    end

    def event_params
      params.require(:eventmaster).permit(:kindofevent, :dateofevent, :place, :participants, :supplement)
    end

    def search_action_with_ajax
      if params[:ajax_handler] == 'search'
        query = []
        if params["name"].present?
          query.push("name like '%#{params[:name]}%'")
        end
        if params["phone"].present?
          query.push("phone like '%#{params[:phone]}%'")
        end
        if params["univ"].present?
          query.push("univ like '#{params[:univ]}'")
        end
        if params["highscool"].present?
          query.push("highschool like '%#{params[:highschool]}%'")
        end
        if !query.empty?
          print(query)
          @profiles = Profile.where(query.join(" or "))
        else
          @profiles = Profile.all
        end
      end
    end
end
