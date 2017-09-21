class Patron
  lists = []
  attr_reader(:name, :patron_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @patron_id = attributes.fetch(:patron_id)
  end

# dd
  def self.all
    total_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    total_patrons.each() do |patron|
      name = patron.fetch("name")
      patron_id = patron.fetch("patron_id").to_i()
      patrons.push(Patron.new({:name => name, :patron_id => patron_id}))
    end
    patrons
  end
# dd
  def save
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING patron_id;")
    @patron_id = result.first().fetch("patron_id").to_i()
  end

end

#   def self.all
#     returned_tasks = DB.exec("SELECT * FROM tasks;")
#     tasks = []
#     returned_tasks.each() do |task|
#       description = task.fetch("description")
#       list_id = task.fetch("list_id").to_i()
#       tasks.push(Task.new({:description => description, :list_id => list_id}))
#     end
#     tasks
#   end
#
#   def save
#     DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id});")
#   end
#
#   def ==(another_task)
#     self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
#   end
#
#   def self.sort()
#     returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY description;")
#     tasks = []
#     returned_tasks.each() do |task|
#       description = task.fetch("description")
#       list_id = task.fetch("list_id").to_i()
#       tasks.push(Task.new({:description => description, :list_id => list_id}))
#     end
#     tasks
#   end
# end
