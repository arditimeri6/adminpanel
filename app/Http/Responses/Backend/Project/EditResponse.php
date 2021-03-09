<?php

namespace App\Http\Responses\Backend\Project;

use Illuminate\Contracts\Support\Responsable;

class EditResponse implements Responsable
{
    /**
     * @var \App\Models\Project\Project
     */
    protected $project;

    /**
     * @param \App\Models\Project\Project $project
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
        return view('backend.projects.edit')
            ->withPage($this->project);
    }
}
