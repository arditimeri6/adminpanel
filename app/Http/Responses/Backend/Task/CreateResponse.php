<?php

namespace App\Http\Responses\Backend\Task;

use Illuminate\Contracts\Support\Responsable;

class CreateResponse implements Responsable
{
    /**
     * @var \App\Models\Task\Task
     */
    protected $project;

    /**
     * @param \App\Models\Task\Task $project
     */
    public function __construct($project)
    {
        $this->project = $project;
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
        return view('backend.tasks.create')
            ->withProject($this->project);
    }
}
