<?php

namespace App\Http\Responses\Backend\Task;

use Illuminate\Contracts\Support\Responsable;

class EditResponse implements Responsable
{
    /**
     * @var \App\Models\Task\Task
     */
    protected $task;

    /**
     * @param \App\Models\Task\Task $task
     */
    public function __construct($task)
    {
        $this->task = $task;
    }

    /**
     * toReponse.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function toResponse($request)
    {
        return view('backend.tasks.edit')
            ->withPage($this->task);
    }
}
