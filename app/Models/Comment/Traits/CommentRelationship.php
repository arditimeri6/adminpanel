<?php

namespace App\Models\Comment\Traits;

use App\Models\Access\User\User;

trait CommentRelationship
{
    public function owner()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function commentable()
    {
        return $this->morphTo();
    }
}
