class EventsController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @events = Eventmaster.all
  end
  def new
    @event = Eventmaster.new
  end

  def show

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

  private
    def set_profile
      @event = Eventmaster.find(params[:id])
    end

    def event_params
      params.require(:eventmaster).permit(:kindofevent, :dateofevent, :place, :participants, :supplement)
    end
end
