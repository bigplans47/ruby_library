require("rspec")
require("pg")
require("patron")
require('spec_helper')

DB = PG.connect({:dbname => "library_test"})

describe(Patron) do

  # describe("#save") do
  #   it("lets you save lists to the database") do
  #     list = List.new({:name => "Epicodus Stuff", :id => nil})
  #     list.save()
  #     expect(List.all()).to(eq([list]))
  #   end
  # end
  #
  # describe(".all") do
  #   it("is empty at first") do
  #     expect(Task.all()).to(eq([]))
  #   end
  # end

  describe(".find") do
    it("find a patron in the patron list") do
      test_patron = Patron.new({:name => "John Snow", :patron_id => 1})
      test_patron.save()
      test_patron2 = Patron.new({:name=> "Jamie Lanister", :patron_id => 2})
      test_patron2.save()
      z= Patron.find(test_patron2.patron_id)
      # x = z.patron_id
      # binding.pry
      expect(Patron.find(test_patron2.patron_id)).to(eq(test_patron2))

    end
  end

# expect(test_patron.patron_id).to(eq(DB.exec("SELECT patron_id FROM checkouts WHERE patron_id == test_patron.patron_id ;").to_i))
# sl
  describe("#checkout_patron") do
    it("will add patron id to the checkouts table") do
      # @the_pat_id = params.fetch("patron_id")
      @test_patron = Patron.new({:name => "John Snow", :patron_id => 1})
      @test_patron.save()
      # checkout_patron_id = 1
      expect(@test_patron.patron_id).to(eq(DB.exec("SELECT patron_id FROM checkouts WHERE patron_id = #{@test_patron.patron_id} ;")))
    end
  end


  # describe("#checkout_patron") do
  #   it("will add patron id to the checkouts table") do
  #     # @the_pat_id = params.fetch("patron_id")
  #     test_patron = Patron.new({:name => "John Snow", :patron_id => 1})
  #     test_patron.save()
  #     # checkout_patron_id = 1
  #     expect(test_patron.patron_id).to(eq(DB.exec("SELECT patron_id FROM checkouts WHERE patron_id == test_patron.patron_id ;").to_i))
  #   end
  # end
  #
  # describe("#save") do
  #   it("adds a task to the array of saved tasks") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     test_task.save()
  #     expect(Task.all()).to(eq([test_task]))
  #   end
  # end
  #
  # describe("#description") do
  #   it("lets you read the description out") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(test_task.description()).to(eq("learn SQL"))
  #   end
  # end
  #
  # describe("#list_id") do
  #   it("lets you read the list ID out") do
  #     test_task = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(test_task.list_id()).to(eq(1))
  #   end
  # end
  #
  # describe("#==") do
  #   it("is the same task if it has the same description and list ID") do
  #     task1 = Task.new({:description => "learn SQL", :list_id => 1})
  #     task2 = Task.new({:description => "learn SQL", :list_id => 1})
  #     expect(task1).to(eq(task2))
  #   end
  # end
  #
  # describe(".sort") do
  #   it("sorts by name") do
  #     task1 = Task.new({:description => "Zebra", :list_id => 1})
  #     task2 = Task.new({:description => "Apple", :list_id => 1})
  #     task1.save()
  #     task2.save()
  #     expect(Task.sort()).to(eq([task2, task1]))
  #   end
  # end
end
