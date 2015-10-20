require_relative '../models/skill_inventory'

class SkillsInventoryApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, :true

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

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])

    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  post '/skills/:id/delete' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end


end
