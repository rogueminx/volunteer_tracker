class Volunteer

  attr_reader(:name, :project_id, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end #initialize

  def name
    @name
  end

  def project_id
    @project_id
  end

  def == (another_volunteer)
      self.name().==(another_volunteer.name()).&(self.id().==(another_volunteer.id()))
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end


end #Volunteer
