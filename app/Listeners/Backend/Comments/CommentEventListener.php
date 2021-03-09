<?php

namespace App\Listeners\Backend\Comments;

/**
 * Class CommentEventListener.
 */
class CommentEventListener
{
    /**
     * @var string
     */
    private $history_slug = 'Comment';

    /**
     * @param $event
     */
    public function onCreated($event)
    {
        history()->withType($this->history_slug)
            ->withEntity($event->comment->id)
            ->withText('trans("history.backend.comments.created")')
            ->withIcon('plus')
            ->withClass('bg-green')
            ->log();
    }

    /**
     * Register the listeners for the subscriber.
     *
     * @param \Illuminate\Events\Dispatcher $events
     */
    public function subscribe($events)
    {
        $events->listen(
            \App\Events\Backend\Comments\CommentCreated::class,
            'App\Listeners\Backend\Comments\CommentEventListener@onCreated'
        );
    }
}
