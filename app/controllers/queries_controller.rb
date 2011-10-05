class QueriesController < ApplicationController
  def new
    @query = Query.new
  end

  def create
    @query = Query.new(params[:query])
    if @query.save
      flash[:notice] = 'Query successfully submitted. Please check your provided email to confirm'
    else
      flash[:error] = 'Please enter details.'
    end
    redirect_to root_path
  end
end

