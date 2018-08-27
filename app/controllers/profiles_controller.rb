class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show

    if params[:checkedid].present?
      userid = CheckedUser.new({checkedid: params[:checkedid]})
      puts("---------------------#{params[:checkedid]}")
      respond_to do |format|
        if userid.save
          format.html { redirect_to @profile, notice: '新しく登録されました。' }
          format.json { render :show, status: :created, location: @profile }
        else
          format.html { render :new }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
      return
    end
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
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: '消去されました。' }
      format.json { head :no_content }
    end
  end

  def importance
    @users=Profile.find_by_sql(['select * from profiles inner join checked_users on profiles.id = checked_users.checkedid'])
  end

  def delete_importance
    user=CheckedUser.find_by(checkedid: params[:id])
    if user.present?
      user.destroy
      redirect_to "/profiles/importance", notice:"注目人物から削除されました"
    else
      redirect_to "/profiles/importance", notice:"すでに削除されたかでデータが存在しません"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :age, :univ, :station, :phone, :highschool, :supplement, :province)
    end

    def search_action_with_ajax
      if params[:ajax_handler] == 'search'
        query = []
        if params["name"].present?
          query.push("name like '#{params[:name]}'")
        end
        if params["phone"].present?
          query.push("phone like '#{params[:phone]}'")
        end
        if params["univ"].present?
          query.push("univ like '#{params[:univ]}'")
        end
        if params["highscool"].present?
          query.push("highschool like '#{params[:highschool]}'")
        end
        if !query.empty?
          print(query)
          @members = Profile.where(query.join(" or "))
        end
      end
    end
end
