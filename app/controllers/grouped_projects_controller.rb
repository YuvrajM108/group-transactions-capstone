class GroupedProjectsController < ApplicationController
  before_action :set_grouped_project, only: %i[show edit update destroy]

  # GET /grouped_projects or /grouped_projects.json
  def index
    @grouped_projects = GroupedProject.all
  end

  # GET /grouped_projects/1 or /grouped_projects/1.json
  def show; end

  # GET /grouped_projects/new
  def new
    @groups = Group.all
    @projects = Project.all
    @grouped_project = GroupedProject.new
  end

  # GET /grouped_projects/1/edit
  def edit; end

  # POST /grouped_projects or /grouped_projects.json
  def create
    @grouped_project = GroupedProject.new(grouped_project_params)

    respond_to do |format|
      if @grouped_project.save
        format.html { redirect_to @grouped_project, notice: 'Grouped project was successfully created.' }
        format.json { render :show, status: :created, location: @grouped_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grouped_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grouped_projects/1 or /grouped_projects/1.json
  def update
    respond_to do |format|
      if @grouped_project.update(grouped_project_params)
        format.html { redirect_to @grouped_project, notice: 'Grouped project was successfully updated.' }
        format.json { render :show, status: :ok, location: @grouped_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grouped_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grouped_projects/1 or /grouped_projects/1.json
  def destroy
    @grouped_project.destroy
    respond_to do |format|
      format.html { redirect_to grouped_projects_url, notice: 'Grouped project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grouped_project
    @grouped_project = GroupedProject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grouped_project_params
    params.fetch(:grouped_project, {})
  end
end
