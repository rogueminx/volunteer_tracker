class Project

  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end #initialize

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def == (another_project)
    self.title().==(another_project.title()).&(self.id().==(another_project.id()))
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:title => title, :id => id}))
    end
  projects
  end

  def self.find(entered_id)
    result = DB.exec("SELECT * FROM projects WHERE id = #{entered_id};")
    title = result.first().fetch("title")
    id = result.first().fetch("id").to_i()
    Project.new({:title => title, :id => id})
  end

  def volunteers
    project_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
    volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i()
      id = volunteer.fetch("id").to_i()
      project_volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
  project_volunteers
  end

  def update (attributes)
    @title = attributes.fetch(:title)
    @id = self.id()
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

end #Project
