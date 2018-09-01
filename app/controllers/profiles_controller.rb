class ProfilesController < ApplicationController
  before_action :set_cookies
  before_action :set_profile, only: [:show, :edit, :update]

  # GET /profiles
  # GET /profiles.json
  def index

    age = (cookies[:age].to_s + "-01-01").in_time_zone.all_year
    @profiles = Profile.where(created_at: age).order('id desc')
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  def search
    search_action_with_ajax unless params[:ajax_handler].blank?
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: '新しく登録されました。' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: '正常に更新されました。' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    participant=Participant.where(newcomer_id:params[:id])
    checkeduser=CheckedUser.where(checkedid:params[:id])
    profile = Profile.where(id:params[:id])
    if participant
      participant.delete_all
    end
    if checkeduser
      checkeduser.delete_all
    end

    respond_to do |format|
      if profile
        profile.delete_all
        format.html { redirect_to profiles_url, notice: '消去されました。' }
        format.json { head :no_content }
      else
        format.html { redirect_to profiles_url, notice: 'すでに削除されています' }
        format.json { head :no_content }
      end
    end
  end

  def importance
    @users=Profile.find_by_sql(["select * from profiles inner join checked_users on profiles.id = checked_users.checkedid where profiles.created_at >= :age and profiles.created_at < :ageplus order by profiles.id desc",{age: cookies[:age].to_s+"-01-01 00:00:00",ageplus: cookies[:age].to_s+"-12-31 23:59:59"}])
  end

  def postimportance
    if params[:checkedid].present?
      userid = CheckedUser.new({checkedid: params[:checkedid]})
      respond_to do |format|
        if userid.save
          format.html { redirect_to profiles_path(@profile), notice: '新しく登録されました。' }
          format.json { render :show, status: :created, location: @profile }
        else
          format.html { render :new }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
      return
    end
  end

  def delete_importance
    user=CheckedUser.where(checkedid: params[:id])
    if user.present?
      user.delete_all
      redirect_to "/profiles/importance", notice:"注目人物から削除されました"
    else
      redirect_to "/profiles/importance", notice:"すでに削除されたかでデータが存在しません"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookies
      if params[:age]
        cookies[:age] = params[:age].to_i
      elsif cookies[:age] && cookies[:age] != Date.today.year
      else
        cookies[:age] = Date.today.year
      end
    end

    def set_profile
      @profile = Profile.find_by(id: params[:id])
      if @profile.nil?
      	respond_to do |format|
      		format.html { redirect_to profiles_url, notice: 'データが未登録か消去されていて表示できません。'}
      		format.json { head :no_content }
      	end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :age, :univ, :station, :phone, :highschool, :supplement, :province)
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

          @members = Profile.where(query.join(" and ")).where(created_at:age).order('id desc')
        end
      end
    end
end
