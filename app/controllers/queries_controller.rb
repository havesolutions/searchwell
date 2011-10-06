class QueriesController < ApplicationController
  def new
    @query = Query.new(params[:query])
  end

  def create
    @query = Query.new(params[:query])
    if @query.save
      flash[:notice] = "Please Check Your Mailbox"#fading_flash_message("Please check your Mailbox", 5)
    else
      @error_prams = params[:query]
      flash[:error] = "Please enter correct details."#fading_flash_message("Please enter details.", 5)
    end
     redirect_to root_path(:query => @error_prams)
  end
end

