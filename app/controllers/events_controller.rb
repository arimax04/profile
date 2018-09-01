class EventsController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_cookies
  def index
    age = (cookies[:age].to_s + "-01-01").in_time_zone.all_year
    @events = Eventmaster.where(created_at: age).order('id desc')
  end
  def new
    @event = Eventmaster.new
  end

  def show
    @participants = Participant.where(event_id: params[:id]).pluck(:newcomer_id)
    @profiles = Profile.where(id: @participants)
  end


  def create
    @event = Eventmaster.new(event_params)
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts @event.dateofevent
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
    event = Eventmaster.where(id:params[:id])
    respond_to do |format|
      if event.present?
        event.delete_all
        format.html { redirect_to events_path, notice: '消去されました。' }
        format.json { head :no_content }
      else
        format.html { redirect_to events_path, notice: '既に削除されています' }
        format.json { head :no_content }
      end
    end
  end

  def addnewtoevent
    unless params[:ajax_handler].blank?
      search_action_with_ajax

    else
      @profiles = Profile.all.order('id desc')

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
        format.html { redirect_to addnewtoevent_event_path(params[:id]), notice: '新しく登録されました。' }
        format.json { render :show, status: :created, location: participant }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def deletenewfromeventprocess
    participants = Participant.where(newcomer_id: params[:profileid],event_id: params[:id])
    respond_to do |format|
      participants.each do |participant|
        if participants
          participants.delete_all
          format.html { redirect_to addnewtoevent_event_path(params[:id]), notice: '登録解除しました。' }
          format.json { render :show, status: :created, location: participant }
        else
          format.html { redirect_to addnewtoevent_event_path(params[:id]), notice: 'この人は登録削除されています' }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
        break
      end
    end
  end

  private

    def set_cookies
      if params[:age]
        cookies[:age] = params[:age].to_i
      elsif cookies[:age] && cookies[:age] != Date.today.year
      else
        cookies[:age] = Date.today.year
      end
    end

    def set_profile
      @event = Eventmaster.find_by(id: params[:id])
      if @event.nil?
        respond_to do |format|
          format.html { redirect_to events_url, notice: 'データが未登録か消去されていて表示できません。'}
          format.json { head :no_content }
        end
      end
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
          age = (cookies[:age].to_s + "-01-01").in_time_zone.all_year
          @profiles = Profile.where(query.join(" and ")).where(created_at:age).order('id desc')
        else
          @profiles = Profile.all.order('id desc')
        end
      end
    end
end
