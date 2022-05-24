class SearchesController < ApplicationController
before_action :authenticate_user!



  def search_result
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      @word = params[:word]
    else
      @books = Book.looks(params[:search], params[:word])
      @word = params[:word]
    end
  end
end
