require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/volunteer")
require("./lib/project")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get("/") do
  @projects = Project.all()
  erb(:index)
end

get("/projects/:id") do
  @current_project = Project.find(params.fetch("id").to_i())
  @volunteers = @current_project.volunteers
  erb(:projectinfo)
end

get("/projects/:id/edit") do
  @current_project = Project.find(params.fetch("id").to_i())
  erb(:editproject)
end

get("/volunteers/:id") do
  @current_volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:editvolunteer)
end

post("/addproject") do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:index)
end

post('/projects/:id') do
  @current_project = Project.find(params['id'].to_i)
  name = params['name']
  project_id = params['project_id'].to_i
  new_volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  new_volunteer.save
  @volunteers = Volunteer.all
  erb(:projectinfo)
end

patch ("/volunteer/:id") do
  name = params.fetch("name")
  project_id = params.fetch("project_id")
  id = params.fetch("id")
  volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer.save()
  erb(:projectinfo)
end

patch("/projects/:id") do
  title = params.fetch("title")
  @current_project = Project.find(params.fetch("id").to_i())
  @current_project.update({:title => title})
  @volunteers = Volunteer.all()
  erb(:projectinfo)
end

patch('/volunteers/:id') do
  name = params.fetch("name")
  @current_volunteer = Volunteer.find(params['id'].to_i)
  @current_volunteer.update({:name => name})
  erb(:editvolunteer)
end

delete("/projects/:id") do
  @current_project = Project.find(params.fetch("id").to_i())
  @current_project.delete()
  @projects = Project.all()
  erb(:index)
end
