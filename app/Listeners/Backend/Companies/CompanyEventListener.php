<?php

namespace App\Listeners\Backend\Companies;

/**
 * Class CompanyEventListener.
 */
class CompanyEventListener
{
    /**
     * @var string
     */
    private $history_slug = 'Company';

    /**
     * @param $event
     */
    public function onCreated($event)
    {
        history()->withType($this->history_slug)
            ->withEntity($event->company->id)
            ->withText('trans("history.backend.companies.created") <strong>'.$event->company->title.'</strong>')
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
            ->withEntity($event->company->id)
            ->withText('trans("history.backend.companies.updated") <strong>'.$event->company->title.'</strong>')
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
            ->withEntity($event->company->id)
            ->withText('trans("history.backend.companies.deleted") <strong>'.$event->company->title.'</strong>')
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
            \App\Events\Backend\Companies\CompanyCreated::class,
            'App\Listeners\Backend\Companies\CompanyEventListener@onCreated'
        );

        $events->listen(
            \App\Events\Backend\Companies\CompanyUpdated::class,
            'App\Listeners\Backend\Companies\CompanyEventListener@onUpdated'
        );

        $events->listen(
            \App\Events\Backend\Companies\CompanyDeleted::class,
            'App\Listeners\Backend\Companies\CompanyEventListener@onDeleted'
        );
    }
}
