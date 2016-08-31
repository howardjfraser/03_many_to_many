class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all.sorted
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new person_params
    if @person.save
      redirect_to @person, notice: "#{@person.name} has been created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update person_params
      redirect_to @person, notice: "#{@person.name} has been updated"
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path, notice: "#{@person.name} has been deleted"
  end

  private

  def person_params
    params.require(:person).permit(:name, :job_title, :bio, mailing_list_ids: [])
  end

  def set_person
    @person = Person.find params[:id]
  end
end
