class MailingListsController < ApplicationController
  def index
    @mailing_lists = MailingList.all.sorted
  end

  def show
    @mailing_list = MailingList.find params[:id]
  end

  def destroy
    @mailing_list = MailingList.find params[:id]
    @mailing_list.destroy
    redirect_to mailing_lists_path, notice: "#{@mailing_list.name} mailing list has been deleted"
  end
end
