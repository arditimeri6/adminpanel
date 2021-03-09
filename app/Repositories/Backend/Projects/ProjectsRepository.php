<?php

namespace App\Repositories\Backend\Projects;

use App\Events\Backend\Projects\ProjectCreated;
use App\Events\Backend\Projects\ProjectDeleted;
use App\Events\Backend\Projects\ProjectUpdated;
use App\Exceptions\GeneralException;
use App\Models\Project\Project;
use App\Models\Company\Company;
use App\Repositories\BaseRepository;

/**
 * Class ProjectsRepository.
 */
class ProjectsRepository extends BaseRepository
{
    /**
     * Associated Repository Model.
     */
    const MODEL = Project::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->query()
            ->leftjoin(config('access.users_table'), config('access.users_table').'.id', '=', config('module.projects.table').'.created_by')
            ->leftjoin(config('module.companies.table'), config('module.companies.table').'.id', '=', config('module.projects.table').'.company_id')
            ->select([
                config('module.projects.table').'.id',
                config('module.projects.table').'.title',
                config('module.projects.table').'.project_slug',
                config('module.projects.table').'.timeframe',
                config('module.projects.table').'.status',
                config('module.projects.table').'.created_at',
                config('module.projects.table').'.updated_at',
                config('access.users_table').'.first_name as created_by',
                config('module.companies.table').'.title as company_id',
            ]);
    }

    /**
     * @param array $input
     *
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function create(array $input)
    {
        if ($this->query()->where('title', $input['title'])->first()) {
            throw new GeneralException(trans('exceptions.backend.projects.already_exists'));
        }

        // Making extra fields
        $input['project_slug'] = str_slug($input['title']);
        $input['status'] = isset($input['status']) ? 1 : 0;
        $input['created_by'] = auth()->id();

        if ($project = Project::create($input)) {
            event(new ProjectCreated($project));

            return $project;
        }

        throw new GeneralException(trans('exceptions.backend.projects.create_error'));
    }

    /**
     * @param \App\Models\Project\Project $project
     * @param array                 $input
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function update($project, array $input)
    {
        if ($this->query()->where('title', $input['title'])->where('id', '!=', $project->id)->first()) {
            throw new GeneralException(trans('exceptions.backend.projects.already_exists'));
        }

        // Making extra fields
        $input['project_slug'] = str_slug($input['title']);
        $input['status'] = isset($input['status']) ? 1 : 0;
        $input['updated_by'] = access()->user()->id;

        if ($project->update($input)) {
            event(new ProjectUpdated($project));

            return true;
        }

        throw new GeneralException(trans('exceptions.backend.projects.update_error'));
    }

    /**
     * @param \App\Models\Project\Project $project
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function delete($project)
    {
        if ($project->delete()) {
            event(new ProjectDeleted($project));

            return true;
        }

        throw new GeneralException(trans('exceptions.backend.projects.delete_error'));
    }
}
