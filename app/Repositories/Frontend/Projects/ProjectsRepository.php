<?php

namespace App\Repositories\Frontend\Projects;

use App\Exceptions\GeneralException;
use App\Models\Project\Project;
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

    /*
    * Find page by project_slug
    */
    public function findProjectBySlug($project_slug)
    {
        if (!is_null($this->query()->whereProject_slug($project_slug)->firstOrFail())) {
            return $this->query()->whereProject_slug($project_slug)->firstOrFail();
        }

        throw new GeneralException(trans('exceptions.backend.access.projects.not_found'));
    }
}
