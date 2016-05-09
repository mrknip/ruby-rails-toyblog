class AuthorSessionsController < ApplicationController
  def new
  end

  def create
    puts "Email: #{params[:email]}"
    if login(params[:email], params[:password])
      puts "Got lgoin"
      redirect_back_or_to(articles_path, notice: 'Logged in successfully')
    else
      flash.notice = 'Login failed'
      puts "No params"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(articles_path, notice: 'Logged out')
  end


end
