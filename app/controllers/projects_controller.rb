#
# This file is part of IssueTracker.
#
# IssueTracker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# IssueTracker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with IssueTracker.  If not, see <http://www.gnu.org/licenses/>.
#

# noinspection RailsChecklist01
class ProjectsController < ApplicationController

  before_action :enforce_login

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    Project.transaction do
      @project = Project.new params.require(:project).permit(:name, :goal, :deadline)
      Project.transaction do
        @project.save!
      end
    end

    redirect_to project_url(@project)

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
