class ProjectsController < ApplicationController

  before_action :enforce_login

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params.require(:project).permit(:name, :goal, :deadline)
    Project.transaction do
      @project.save!
    end

    redirect_to :projects

  rescue ActiveRecord::RecordInvalid
    render action: :new

  end

  def show
    @project = Project.find params[:id]
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    Project.transaction do
      @project = Project.find params[:id]
      @project.attributes = params.require(:project).permit(:name, :goal, :deadline)
      @project.save!
    end

    redirect_to project_url(@project)

  rescue ActiveRecord::RecordInvalid
    render action: :edit

  end
end
