require 'bundler' #requires the gem called bundler
Bundler.require #this requires all the gems in our gemfile

# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__) #APP ROOT is a constant and should not change

# require the controller(s)
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }
#Dir.glob makes anything that has a file extension of .rb and puts it into and array.  If there were multiple controllers, there would be multiple paths in the array.  that is why we call the each method and require the file from the array

# require the model(s)
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }

# configure TaskManagerApp settings
class SkillsInventoryApp < Sinatra::Base
  set :method_override, true #this allows put and delete to be used
  set :root, APP_ROOT #setting the root of the app to the constant defined on ln 5
  set :views, File.join(APP_ROOT, "app", "views") #we are setting where the views live
  set :public_folder, File.join(APP_ROOT, "app", "public")
end

#now that these sets are done, we can remove settings from the controller
