require_relative "router"
require_relative "tasks_controller"
require_relative "task_repository"

router = Router.new(TasksController.new(TaskRepository.new))
router.run