<?php

namespace App\Events\Backend\Projects;

use Illuminate\Queue\SerializesModels;

/**
 * Class ProjectCreated.
 */
class ProjectCreated
{
    use SerializesModels;

    /**
     * @var
     */
    public $project;

    /**
     * @param $project
     */
    public function __construct($project)
    {
        $this->project = $project;
    }
}
