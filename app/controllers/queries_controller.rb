class QueriesController < ApplicationController
  layout "search"
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
    redirect_to root_path(:query => params[:query])
  end

  def deliver_solution
    query = Query.find(params[:id])
    query.deliver_solution_email
    flash[:notice] = "Solution Email sent Successfully"
    redirect_to admin_questions_path
  end
end

