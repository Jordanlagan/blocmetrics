class RegisteredApplicationsController < ApplicationController
  def index
    @apps = RegisteredApplication.where(user_id: current_user.id)
  end

  def new
    @app = RegisteredApplication.new
  end

  def create
    @user = current_user
    @app = @user.registered_applications.build(app_params)

    if @app.save
      flash[:notice] = "BlocMetrics has been added to #{@app.name}"
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error adding BlocMetrics."
      render :new
    end
  end

  def show
    @user = current_user
    @app = @user.registered_applications.find(params[:id])
    @events = @app.events

    @visits = @events.where(name: "visit")
    @bounces = @events.where(name: "leave")
    @link_clicks = @events.where(name: "click-link")
  end

  def edit
    @user = current_user
    @app = @user.registered_applications.find(params[:id])
  end

  def update
    @user = current_user
    @app = @user.registered_applications.find(params[:id])
    @app.assign_attributes(app_params)

    if @app.save
      flash[:notice] = "BlocMetrics configuration has been updated."
      redirect_to @app
    else
      flash.now[:alert] = "There was an error editing configuration."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @app = @user.registered_applications.find(params[:id])

    if @app.destroy
      flash[:notice] = "#{@app.name} has been removed from your account."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error removing this application or website from your account."
      render :show
    end
  end

  private
  def app_params
    params.require(:registered_application).permit(:url, :name)
  end
end
