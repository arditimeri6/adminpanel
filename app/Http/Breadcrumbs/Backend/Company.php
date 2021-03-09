<?php

Breadcrumbs::register('admin.companies.index', function ($breadcrumbs) {
    $breadcrumbs->parent('admin.dashboard');
    $breadcrumbs->push(trans('menus.backend.companies.management'), route('admin.companies.index'));
});

Breadcrumbs::register('admin.companies.create', function ($breadcrumbs) {
    $breadcrumbs->parent('admin.companies.index');
    $breadcrumbs->push(trans('menus.backend.companies.create'), route('admin.companies.create'));
});

Breadcrumbs::register('admin.companies.edit', function ($breadcrumbs, $id) {
    $breadcrumbs->parent('admin.companies.index');
    $breadcrumbs->push(trans('menus.backend.companies.edit'), route('admin.companies.edit', $id));
});
