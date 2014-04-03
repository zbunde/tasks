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

  def show(id)
    @tasks[:id => id]
  end

  def update(id, updated_name)
    @tasks.where('id = ?', id).update(:name => updated_name)
  end

  def delete(id)
    @tasks.where('id = ?', id).delete
  end
end





