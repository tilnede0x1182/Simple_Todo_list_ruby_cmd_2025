require_relative 'task'
require_relative 'tasks_view'

class TasksController
  def initialize(repository)
    @repository = repository
    @view = TasksView.new
  end

  def list
    display_tasks
  end

  def add
    # 1. Get description from view
    name, description = @view.ask_for_task
    # 2. Create new task
    task = Task.new(name, description)
    # 3. Add to repo
    @repository.create(task)
  end

  def mark_as_done
    phrase = "Veuillez entrer la tâche à marquer comme faite : "
    index = @view.ask_for_index(@repository, phrase)
    @repository.mark_as_done(index)
  end

  def remove
    phrase = "Veuillez entrer la tâche à supprimer : "
    index = @view.ask_for_index(@repository, phrase)
    @repository.destroy(index)
  end

  private

  def display_tasks
    # 1. Fetch tasks from repo
    tasks = @repository.all
    # 2. Send them to view for display
    @view.display_list(tasks)
  end
end