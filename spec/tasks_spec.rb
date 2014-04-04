require 'tasks'
require 'sequel'

describe "Tasks" do
  before do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks')
    @tasks = Tasks.new(db)

    db.create_table! :tasks do
      primary_key :id
      String :name
    end
    @tasks.create(:name => "My first task")
  end

  it "inserts a record into the table" do
    expect(@tasks.index).to eq([{:id => 1, :name => "My first task"}])
  end

  it "can select a task from the databse" do
    @tasks.create(name: "My second task")
    expect(@tasks.show(2)).to eq({:id => 2, :name => "My second task"})
  end

  it "can update a task in the databse" do
    @tasks.update(1, "My updated task")
    expect(@tasks.index).to eq([{:id => 1, :name => "My updated task"}])
  end

  it "can destroy a task in the database" do
    @tasks.create(name: "My second task")
    @tasks.delete(1)
    expect(@tasks.index).to eq([{:id => 2, :name => "My second task"}])
  end

  it "can show all invidividual tasks names" do
    @tasks.create(name: "My second task")
    expect(@tasks.show_all).to eq [
      {name:  "My first task"},
      {name:  "My second task"}
    ]
  end
end