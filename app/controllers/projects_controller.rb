class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end
  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to action: 'index'
  end
  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    if(@project.update(project_params))
      redirect_to @project
    else
      render 'edit'
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end
  private def project_params
    params.require(:project).permit(:name, :creator, :priority)
  end
end
