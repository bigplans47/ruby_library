class Book
  attr_reader(:title, :author, :book_id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @book_id = attributes.fetch(:book_id)
  end
# dd
  def self.all
    total_books = DB.exec("SELECT * FROM books;")
    books = []
    total_books.each() do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      book_id = book.fetch("book_id").to_i()
      books.push(Book.new({:title => title, :author => author, :book_id => book_id}))
    end
    books
  end
# dd
  def save
    result = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING book_id;")
    @book_id = result.first().fetch("book_id").to_i()
  end

end  
#
#   def ==(another_list)
#     self.name().==(another_list.name()).&(self.id().==(another_list.id()))
#   end
#
#   def self.find(id)
#     found_list = nil
#     List.all().each() do |list|
#       if list.id().==(id)
#         found_list = list
#       end
#     end
#     found_list
#   end
#
#   def tasks
#     list_tasks = []
#     tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id()};")
#     tasks.each() do |task|
#       description = task.fetch("description")
#       list_id = task.fetch("list_id").to_i()
#       list_tasks.push(Task.new({:description => description, :list_id => list_id}))
#     end
#     list_tasks
#   end
#
#   def update(attributes)
#     @name = attributes.fetch(:name)
#     @id = self.id()
#     DB.exec("UPDATE book SET name = '#{@name}' WHERE id = #{@id};")
#   end
#
#  def delete
#   DB.exec("DELETE FROM book WHERE id = #{self.id()};")
#   DB.exec("DELETE FROM tasks WHERE list_id = #{self.id()};")
# end
