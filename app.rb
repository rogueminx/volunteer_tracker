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
  erb(:projectinfo)
end

get("/projects/:id/edit") do
  @current_project = Project.find(params.fetch("id").to_i())
  erb(:editproject)
end

post("/addproject") do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:index)
end

patch("/projects/:id") do
  title = params.fetch("title")
  @current_project = Project.find(params.fetch("id").to_i())
  @current_project.update({:title => title})
  erb(:projectinfo)
end
