class MailingListsController < ApplicationController
  def index
    @mailing_lists = MailingList.all.sorted
  end

  def show
    @mailing_list = MailingList.find params[:id]
  end
end
