class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
   @author = Author.new(allowed_params)
   if @author.valid?
     @author.save
     redirect_to authors_path
   else
     render :new
   end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(allowed_params).valid?
    @author.update!
    redirect_to authors_path
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end


  private

  def allowed_params
    params.require(:author).permit(:name, :phone_number)
  end

end
