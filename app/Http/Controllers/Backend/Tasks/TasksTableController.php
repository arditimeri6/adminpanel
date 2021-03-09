<?php

namespace App\Http\Controllers\Backend\Tasks;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Tasks\ManageTaskRequest;
use App\Repositories\Backend\Tasks\TasksRepository;
use Yajra\DataTables\Facades\DataTables;

/**
 * Class TasksTableController.
 */
class TasksTableController extends Controller
{
    protected $tasks;

    /**
     * @param TasksRepository $tasks
     */
    public function __construct(TasksRepository $tasks)
    {
        $this->tasks = $tasks;
    }

    /**
     * @param ManageTaskRequest $request
     *
     * @return mixed
     */ 
    public function __invoke(ManageTaskRequest $request)
    {
        return Datatables::of($this->tasks->getForDataTable())
            ->escapeColumns(['title'])
            ->addColumn('status', function ($task) {
                return $task->status_label;
            })
            ->addColumn('created_at', function ($task) {
                return $task->created_at->toDateString();
            })
            ->addColumn('created_by', function ($task) {
                return $task->created_by;
            })
            ->addColumn('actions', function ($task) {
                return $task->action_buttons;
            })
            ->make(true);
    }
}
