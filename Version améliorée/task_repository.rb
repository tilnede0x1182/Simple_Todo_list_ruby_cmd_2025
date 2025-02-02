require_relative "task"
require 'csv'

class TaskRepository
  def initialize
    @tasks = []
    @csv_file_path = "tasks.csv"
    load_csv
  end

  def create(task)
    @tasks << task
    save_csv_without_overwriting(task)
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  def mark_as_done(index)
    task = @tasks[index]
    task.mark_as_done!
    save_csv
  end

  def destroy(index)
    @tasks.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, encoding: 'UTF-8') do |row|
      @tasks << Task.new(row[0], row[1], to_b(row[2]))
    end
  end

  def task_to_array(task)
    return [task.name, task.description, task.done.to_s]
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @tasks.each do |task|
        csv << task_to_array(task)
      end
    end
  end

  def save_csv_without_overwriting(task)
    CSV.open(@csv_file_path, "ab") do |csv|
      csv << task_to_array(task)
    end
  end
  
  def to_b(boolean_potentiel)
    return boolean_potentiel.strip.downcase == "true"
  end
end