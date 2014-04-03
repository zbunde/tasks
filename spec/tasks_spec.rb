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
end