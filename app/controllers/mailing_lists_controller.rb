class MailingListsController < ApplicationController
  def index
    @mailing_lists = MailingList.all.sorted
  end

  def show
    @mailing_list = MailingList.find params[:id]
  end

  def new
    @mailing_list = MailingList.new
  end

  def create
    @mailing_list = MailingList.new mailing_list_params
    if @mailing_list.save
      redirect_to @mailing_list, notice: "#{@mailing_list.name} mailing list has been created"
    else
      render 'new'
    end
  end

  def edit
    @mailing_list = MailingList.find params[:id]
  end

  def update
    @mailing_list = MailingList.find params[:id]
    @mailing_list.update mailing_list_params
    if @mailing_list.save
      redirect_to @mailing_list, notice: "#{@mailing_list.name} mailing list has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @mailing_list = MailingList.find params[:id]
    @mailing_list.destroy
    redirect_to mailing_lists_path, notice: "#{@mailing_list.name} mailing list has been deleted"
  end

  private

  def mailing_list_params
    params.require(:mailing_list).permit(:name, :email)
  end
end
