require 'sinatra/base'
# require '../config/environment.rb'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :'../views/super_hero'
    end

    post'/teams' do
      @team = Team.new(params[:team])

      params[:team][:members].each do |hero_data|
        Member.new(hero_data)
      end

      erb :'../views/team'
    end


end
