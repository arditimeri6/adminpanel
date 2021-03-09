<?php

namespace App\Listeners\Backend\Projects;

/**
 * Class ProjectEventListener.
 */
class ProjectEventListener
{
    /**
     * @var string
     */
    private $history_slug = 'Project';

    /**
     * @param $event
     */
    public function onCreated($event)
    {
        history()->withType($this->history_slug)
            ->withEntity($event->project->id)
            ->withText('trans("history.backend.projects.created") <strong>'.$event->project->title.'</strong>')
            ->withIcon('plus')
            ->withClass('bg-green')
            ->log();
    }

    /**
     * @param $event
     */
    public function onUpdated($event)
    {
        history()->withType($this->history_slug)
            ->withEntity($event->project->id)
            ->withText('trans("history.backend.projects.updated") <strong>'.$event->project->title.'</strong>')
            ->withIcon('save')
            ->withClass('bg-aqua')
            ->log();
    }

    /**
     * @param $event
     */
    public function onDeleted($event)
    {
        history()->withType($this->history_slug)
            ->withEntity($event->project->id)
            ->withText('trans("history.backend.projects.deleted") <strong>'.$event->project->title.'</strong>')
            ->withIcon('trash')
            ->withClass('bg-maroon')
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
            \App\Events\Backend\Projects\ProjectCreated::class,
            'App\Listeners\Backend\Projects\ProjectEventListener@onCreated'
        );

        $events->listen(
            \App\Events\Backend\Projects\ProjectUpdated::class,
            'App\Listeners\Backend\Projects\ProjectEventListener@onUpdated'
        );

        $events->listen(
            \App\Events\Backend\Projects\ProjectDeleted::class,
            'App\Listeners\Backend\Projects\ProjectEventListener@onDeleted'
        );
    }
}
