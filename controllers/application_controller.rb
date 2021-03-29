class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  # set public folder for static files
  set :public_folder, File.expand_path('../../public', __FILE__)

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions

  get '/' do
    erb :index
  end

  get '/throw/:gamer_choices' do
    choices = ['rock', 'paper', 'scissors']
    computer_choices = rand(choices.length)
    session['gamer_choices'] = params[:gamer_choices]
    session['computer_choices'] = choices[computer_choices]

    if params[:gamer_choices] == 'rock' && choices[computer_choices] == 'paper'
      erb :lose
    elsif params[:gamer_choices] == 'paper' && choices[computer_choices] == 'scissors'
      erb :lose
    elsif params[:gamer_choices] == 'scissors' && choices[computer_choices] == 'rock'
      erb :lose
    elsif params[:gamer_choices] == 'scissors' && choices[computer_choices] == 'paper'
      erb :win
    elsif params[:gamer_choices] == 'rock' && choices[computer_choices] == 'scissors'
      erb :win
    elsif params[:gamer_choices] == 'paper' && choices[computer_choices] == 'rock'
      erb :win
    else
      erb :tied
    end
  end
end