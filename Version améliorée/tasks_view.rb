class TasksView
  def display_list(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? "X" : " "
      puts "#{index + 1}. [#{done}] #{task.name} : #{task.description}"
    end
  end

  def ask_for_task
    print "Entrer le nom de la tâche : "
    name = gets.chomp
    print "Entrer la description de la tâche : "
    description = gets.chomp

    return [name, description]
  end

  def ask_for_index(repository, phrase)
    return (display_tasks_with_phrase(repository, phrase))
  end

  private

  # Diplay tasks

  def display_tasks_with_phrase(repository, phrase)
    tasks = repository.all
    unless tasks.empty?
      puts phrase
      tasks.each_with_index do |task, index|
        puts "#{index + 1} : Nom de la tâche : #{task.name}\n"
      end
      res = enter_an_integer(1, tasks.length)
      return (res - 1)
    end
  end

  # Manage Integers

  def integer?(str)
    !Integer(str, exception: false).nil?
  end

  def enter_an_integer(min, max)
    res = nil
    while !integer?(res) || (res.to_i < min || res.to_i > max)
      puts("Veuillez entrer un entier entre #{min} et #{max} ")
      print("? = ")
      res = gets.chomp
    end
    return res.to_i
  end
end
