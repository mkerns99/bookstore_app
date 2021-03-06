class AuthorsController < ApplicationController
  def index
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = 'Author has been created.'
      redirect_to @author
    else
      flash[:danger] = 'Author has not been created.'
      render :new
    end
  end

private

  def author_params
    params.permit(:first_name, :middle_name, :last_name, :email)
  end
end