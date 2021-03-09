<?php

namespace App\Models\Project\Traits;

use App\Models\Access\User\User;
use App\Models\Company\Company;

trait ProjectRelationship
{
    public function owner()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function companyOwner()
    {
    	return $this->belongsTo(Company::class, 'company_id');
    }

    public function tasks()
    {
        return $this->hasMany('App\Models\Task\Task');
    }

    public function comments()
    {
        return $this->morphMany('App\Models\Comment\Comment', 'commentable');
    }
}
