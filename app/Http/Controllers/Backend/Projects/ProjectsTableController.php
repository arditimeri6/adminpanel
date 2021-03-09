<?php

namespace App\Http\Controllers\Backend\Projects;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Projects\ManageProjectRequest;
use App\Repositories\Backend\Projects\ProjectsRepository;
use Yajra\DataTables\Facades\DataTables;

/**
 * Class ProjectsTableController.
 */
class ProjectsTableController extends Controller
{
    protected $projects;

    /**
     * @param ProjectsRepository $projects
     */
    public function __construct(ProjectsRepository $projects)
    {
        $this->projects = $projects;
    }

    /**
     * @param ManageProjectRequest $request
     *
     * @return mixed
     */ 
    public function __invoke(ManageProjectRequest $request)
    {
        return Datatables::of($this->projects->getForDataTable())
            ->escapeColumns(['title'])
            ->addColumn('status', function ($project) {
                return $project->status_label;
            })
            ->addColumn('created_at', function ($project) {
                return $project->created_at->toDateString();
            })
            ->addColumn('created_by', function ($project) {
                return $project->created_by;
            })
            ->addColumn('actions', function ($project) {
                return $project->action_buttons;
            })
            ->make(true);
    }
}
