class Task
  attr_reader :id, :content, :completed, :created_at, :updated_at
  @@current_id = 1

  def initialize content, completed=false
    @content = content
    @completed = completed
    @created_at = Time.now
    @updated_at = nil
    @id = @@current_id
    @@current_id += 1
  end

  def complete?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end

  def update_content! new_content
    @content = new_content
    @updated_at = Time.now
  end
end