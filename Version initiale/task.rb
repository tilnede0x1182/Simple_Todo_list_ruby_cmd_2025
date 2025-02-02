class Task
  attr_reader :name, :description, :done

  def initialize(name, description, done=false)
    @name = name
    @description = description
    @done = done
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end