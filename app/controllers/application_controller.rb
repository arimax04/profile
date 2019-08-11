class ApplicationController < ActionController::Base
    before_action :checkloggedin ,except: [:login,:postlogin]


    def checkloggedin
        print("################check#####################")
        print(session[:loggedin])
        if session[:loggedin]!='loggedin'
            redirect_to login_profiles_path
        else
            print("already logged in")
        end
    end

    def login
        render "login"
    end

    def postlogin
        print( "#####################")
        print(params)
        if params[:user] == Settings.username && params[:password] == Settings.password
            session[:loggedin] = 'loggedin'
            redirect_to profiles_path
        else
            print("error")
            # params[:loginerror] =　"error"
            flash[:notice] = "error"
            redirect_to login_profiles_path
        end

            
    end
    def logout
        session[:loggedin] = ''
        redirect_to profiles_path
    end
end
