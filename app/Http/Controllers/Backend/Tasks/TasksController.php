<?php

namespace App\Http\Controllers\Backend\Tasks;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Tasks\CreateTaskRequest;
use App\Http\Requests\Backend\Tasks\DeleteTaskRequest;
use App\Http\Requests\Backend\Tasks\EditTaskRequest;
use App\Http\Requests\Backend\Tasks\ManageTaskRequest;
use App\Http\Requests\Backend\Tasks\StoreTaskRequest;
use App\Http\Requests\Backend\Tasks\UpdateTaskRequest;
use App\Repositories\Backend\Tasks\TasksRepository;
use App\Repositories\Backend\Projects\ProjectsRepository;
use App\Http\Responses\Backend\Task\EditResponse;
use App\Http\Responses\Backend\Task\CreateResponse;
use App\Http\Responses\RedirectResponse;
use App\Http\Responses\ViewResponse;
use App\Models\Task\Task;

/**
 * Class TasksController.
 */
class TasksController extends Controller
{
    protected $tasks;
    protected $project;

    /**
     * @param \App\Repositories\Backend\Tasks\TasksRepository $tasks
     */
    public function __construct(TasksRepository $tasks, ProjectsRepository $project)
    {
        $this->tasks = $tasks;
        $this->project = $project;
    }

    /**
     * @param \App\Http\Requests\Backend\Tasks\ManageTaskRequest $request
     *
     * @return \App\Http\Responses\ViewResponse
     */
    public function index(ManageTaskRequest $request)
    {
        return new ViewResponse('backend.tasks.index');
    }

    /**
     * @param \App\Http\Requests\Backend\Tasks\CreateTaskRequest $request
     *
     * @return \App\Http\Responses\ViewResponse
     */
    public function create(CreateTaskRequest $request)
    {
        $project = $this->project->getAll()->pluck('title', 'id')->toArray();

        return new CreateResponse($project);
    }

    /**
     * @param \App\Http\Requests\Backend\Tasks\StoreTaskRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function store(StoreTaskRequest $request)
    {
        $this->tasks->create($request->except(['_token']));

        return new RedirectResponse(route('admin.tasks.index'), ['flash_success' => trans('alerts.backend.tasks.created')]);
    }

    /**
     * @param \App\Models\Task\Task                            $task
     * @param \App\Http\Requests\Backend\Tasks\EditTaskRequest $request
     *
     * @return \App\Http\Responses\Backend\Task\EditResponse
     */
    public function edit(Task $task, EditTaskRequest $request)
    {
        return new EditResponse($task);
    }

    /**
     * @param \App\Models\Task\Task                              $task
     * @param \App\Http\Requests\Backend\Tasks\UpdateTaskRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function update(Task $task, UpdateTaskRequest $request)
    {
        $this->tasks->update($task, $request->except(['_method', '_token']));

        return new RedirectResponse(route('admin.tasks.index'), ['flash_success' => trans('alerts.backend.tasks.updated')]);
    }

    /**
     * @param \App\Models\Task\Task                              $task
     * @param \App\Http\Requests\Backend\Tasks\DeleteTaskRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function destroy(Task $task, DeleteTaskRequest $request)
    {
        $this->tasks->delete($task);

        return new RedirectResponse(route('admin.tasks.index'), ['flash_success' => trans('alerts.backend.tasks.deleted')]);
    }
}
