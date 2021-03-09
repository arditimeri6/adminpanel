<?php

namespace App\Repositories\Frontend\Tasks;

use App\Exceptions\GeneralException;
use App\Models\Task\Task;
use App\Repositories\BaseRepository;

/**
 * Class TasksRepository.
 */
class TasksRepository extends BaseRepository
{
    /**
     * Associated Repository Model.
     */
    const MODEL = Task::class;

    /*
    * Find page by task_slug
    */
    public function findTaskBySlug($task_slug)
    {
        if (!is_null($this->query()->whereTask_slug($task_slug)->firstOrFail())) {
            return $this->query()->whereTask_slug($task_slug)->firstOrFail();
        }

        throw new GeneralException(trans('exceptions.backend.access.tasks.not_found'));
    }
}
