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

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i()
      project_id = volunteer.fetch("project_id").to_i()
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
  volunteers
  end

  def self.find(entered_id)
    found_volunteer = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.id().==(entered_id)
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

end #Volunteer
