

class Tasks

  def initialize(db)
    @tasks = db[:tasks]
  end

  def create(attributes)
    @tasks.insert(attributes)
  end

  def index
    @tasks.to_a
  end


end