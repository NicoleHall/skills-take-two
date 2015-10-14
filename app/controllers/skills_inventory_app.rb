require 'models/skill_inventory'

class SkillsInventoryApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/skills'do
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
   erb :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
    #Params: {"skill"=>{"title"=>"petting cats", "description"=>"stroking soft fur with hand", "mastery_level"=>"expert"}}
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end


end
