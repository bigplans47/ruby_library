require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'library_test'})

get("/") do
  erb(:index)
end

# get("/lists/new") do
#   erb(:list_form)
# end
#
# get('/lists') do
#   @lists = List.all()
#   erb(:lists)
# end
#
# post("/lists") do
#   name = params.fetch("name")
#   list = List.new({:name => name, :id => nil})
#   list.save()
#   erb(:success)
# end
#
# get("/lists/:id") do
#   @list = List.find(params.fetch("id").to_i())
#   erb(:list)
# end
#
# get("/lists/:id/edit") do
#   @list = List.find(params.fetch("id").to_i())
#   erb(:list_edit)
# end
#
# patch("/lists/:id") do
#   name = params.fetch("name")
#   @list = List.find(params.fetch("id").to_i())
#   @list.update({:name => name})
#   erb(:list)
# end
#
# delete("/lists/:id") do
#   @list = List.find(params.fetch("id").to_i())
#   @list.delete()
#   @lists = List.all()
#   erb(:index)
# end
