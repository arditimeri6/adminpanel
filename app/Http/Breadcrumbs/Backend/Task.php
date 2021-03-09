<?php

Breadcrumbs::register('admin.tasks.index', function ($breadcrumbs) {
    $breadcrumbs->parent('admin.dashboard');
    $breadcrumbs->push(trans('menus.backend.tasks.management'), route('admin.tasks.index'));
});

Breadcrumbs::register('admin.tasks.create', function ($breadcrumbs) {
    $breadcrumbs->parent('admin.tasks.index');
    $breadcrumbs->push(trans('menus.backend.tasks.create'), route('admin.tasks.create'));
});

Breadcrumbs::register('admin.tasks.edit', function ($breadcrumbs, $id) {
    $breadcrumbs->parent('admin.tasks.index');
    $breadcrumbs->push(trans('menus.backend.tasks.edit'), route('admin.tasks.edit', $id));
});
