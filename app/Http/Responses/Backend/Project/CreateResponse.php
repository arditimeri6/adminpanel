<?php

namespace App\Http\Responses\Backend\Project;

use Illuminate\Contracts\Support\Responsable;

class CreateResponse implements Responsable
{
    /**
     * @var \App\Models\Project\Project
     */
    protected $company;

    /**
     * @param \App\Models\Project\Project $company
     */
    public function __construct($company)
    {
        $this->company = $company;
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
        return view('backend.projects.create')
            ->withCompany($this->company);
    }
}
