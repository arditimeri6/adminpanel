<?php

namespace App\Repositories\Backend\Tasks;

use App\Events\Backend\Tasks\TaskCreated;
use App\Events\Backend\Tasks\TaskDeleted;
use App\Events\Backend\Tasks\TaskUpdated;
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

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->query()
            ->leftjoin(config('access.users_table'), config('access.users_table').'.id', '=', config('module.tasks.table').'.created_by')
            ->leftjoin(config('module.projects.table'), config('module.projects.table').'.id', '=', config('module.tasks.table').'.project_id')
            ->select([
                config('module.tasks.table').'.id',
                config('module.tasks.table').'.title',
                config('module.tasks.table').'.task_slug',
                config('module.tasks.table').'.timeframe',
                config('module.tasks.table').'.status',
                config('module.tasks.table').'.created_at',
                config('module.tasks.table').'.updated_at',
                config('access.users_table').'.first_name as created_by',
                config('module.projects.table').'.title as project_id',
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
            throw new GeneralException(trans('exceptions.backend.tasks.already_exists'));
        }

        // Making extra fields
        $input['task_slug'] = str_slug($input['title']);
        $input['status'] = isset($input['status']) ? 1 : 0;
        $input['created_by'] = auth()->id();

        if ($task = Task::create($input)) {
            event(new TaskCreated($task));

            return $task;
        }

        throw new GeneralException(trans('exceptions.backend.tasks.create_error'));
    }

    /**
     * @param \App\Models\Task\Task $task
     * @param array                 $input
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function update($task, array $input)
    {
        if ($this->query()->where('title', $input['title'])->where('id', '!=', $task->id)->first()) {
            throw new GeneralException(trans('exceptions.backend.tasks.already_exists'));
        }

        // Making extra fields
        $input['task_slug'] = str_slug($input['title']);
        $input['status'] = isset($input['status']) ? 1 : 0;
        $input['updated_by'] = access()->user()->id;

        if ($task->update($input)) {
            event(new TaskUpdated($task));

            return true;
        }

        throw new GeneralException(trans('exceptions.backend.tasks.update_error'));
    }

    /**
     * @param \App\Models\Task\Task $task
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function delete($task)
    {
        if ($task->delete()) {
            event(new TaskDeleted($task));

            return true;
        }

        throw new GeneralException(trans('exceptions.backend.tasks.delete_error'));
    }
}
