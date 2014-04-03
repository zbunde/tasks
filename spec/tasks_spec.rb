require 'tasks'
require 'sequel'



describe "Tasks" do
  before do

    DB = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks')

    DB.create_table! :tasks do
      primary_key :id
      String :name
    end

  end

  it "inserts a record into the table" do
    tasks = Tasks.new(DB)
    tasks.create(name: "My first task")
    expect(tasks.index).to eq([{ :id => 1, :name => "My first task"}])
  end

  it "can select a task from the databse" do
  tasks = Tasks.new(DB)
  tasks.create(name: "My first task")
  tasks.create(name: "My second task")
  # show the 2nd task from tasks

  expect(tasks.show(2)).to eq({ :id => 2, :name => "My second task"})
  end

  it "can update a task in the databse" do
    tasks = Tasks.new(DB)
    tasks.create(name: "My first task")
    tasks.update(1, "My updated task")
    # update task 1
    expect(tasks.index).to eq([{ :id => 1, :name => "My updated task"}])
  end
  it "can destroy a task in the database" do
    tasks = Tasks.new(DB)
    tasks.create(name: "My first task")
    tasks.create(name: "My second task")
    tasks.delete(1)
    expect(tasks.index).to eq([{ :id => 2, :name => "My second task"}])

  end

end