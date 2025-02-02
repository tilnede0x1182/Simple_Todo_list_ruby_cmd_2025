class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    while @running
      print_actions
      action = gets.chomp.to_i
      print `clear`
      dispatch(action)
    end
  end

  private

  def print_actions
    puts "\n---"
    puts 'What do you want to do?'
    puts '1 - Display tasks'
    puts '2 - Add a new task'
    puts '3 - Mark a task as done'
    puts '4 - Remove a task'
    puts '5 - Exit the programm'
    puts '---'
    print "? = "
  end

  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.mark_as_done
    when 4 then @controller.remove
    when 5 then stop     
    else
      puts "Please type 1, 2, 3 or 4 :)"
    end
  end

  def stop
    @running = false
  end
end