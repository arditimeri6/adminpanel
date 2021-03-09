<?php

namespace App\Http\Controllers\Backend\Projects;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Projects\CreateProjectRequest;
use App\Http\Requests\Backend\Projects\DeleteProjectRequest;
use App\Http\Requests\Backend\Projects\EditProjectRequest;
use App\Http\Requests\Backend\Projects\ManageProjectRequest;
use App\Http\Requests\Backend\Projects\StoreProjectRequest;
use App\Http\Requests\Backend\Projects\UpdateProjectRequest;
use App\Repositories\Backend\Projects\ProjectsRepository;
use App\Repositories\Backend\Companies\CompaniesRepository;
use App\Http\Responses\Backend\Project\EditResponse;
use App\Http\Responses\Backend\Project\CreateResponse;
use App\Http\Responses\RedirectResponse;
use App\Http\Responses\ViewResponse;
use App\Models\Project\Project;

/**
 * Class ProjectsController.
 */
class ProjectsController extends Controller
{
    protected $projects;
    protected $company;

    /**
     * @param \App\Repositories\Backend\Projects\ProjectsRepository $projects
     */
    public function __construct(ProjectsRepository $projects, CompaniesRepository $company)
    {
        $this->projects = $projects;
        $this->company = $company;
    }

    /**
     * @param \App\Http\Requests\Backend\Projects\ManageProjectRequest $request
     *
     * @return \App\Http\Responses\ViewResponse
     */
    public function index(ManageProjectRequest $request)
    {
        return new ViewResponse('backend.projects.index');
    }

    /**
     * @param \App\Http\Requests\Backend\Projects\CreateProjectRequest $request
     *
     * @return \App\Http\Responses\ViewResponse
     */
    public function create(CreateProjectRequest $request)
    {
        $company = $this->company->getAll()->pluck('title', 'id')->toArray();

        return new CreateResponse($company);
    }

    /**
     * @param \App\Http\Requests\Backend\Projects\StoreProjectRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function store(StoreProjectRequest $request)
    {
        $this->projects->create($request->except(['_token']));

        return new RedirectResponse(route('admin.projects.index'), ['flash_success' => trans('alerts.backend.projects.created')]);
    }

    /**
     * @param \App\Models\Project\Project                            $project
     * @param \App\Http\Requests\Backend\Projects\EditProjectRequest $request
     *
     * @return \App\Http\Responses\Backend\Project\EditResponse
     */
    public function edit(Project $project, EditProjectRequest $request)
    {
        return new EditResponse($project);
    }

    /**
     * @param \App\Models\Project\Project                              $project
     * @param \App\Http\Requests\Backend\Projects\UpdateProjectRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function update(Project $project, UpdateProjectRequest $request)
    {
        $this->projects->update($project, $request->except(['_method', '_token']));

        return new RedirectResponse(route('admin.projects.index'), ['flash_success' => trans('alerts.backend.projects.updated')]);
    }

    /**
     * @param \App\Models\Project\Project                              $project
     * @param \App\Http\Requests\Backend\Projects\DeleteProjectRequest $request
     *
     * @return \App\Http\Responses\RedirectResponse
     */
    public function destroy(Project $project, DeleteProjectRequest $request)
    {
        $this->projects->delete($project);

        return new RedirectResponse(route('admin.projects.index'), ['flash_success' => trans('alerts.backend.projects.deleted')]);
    }
}
