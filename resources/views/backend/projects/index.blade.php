@extends ('backend.layouts.app')

@section ('title', trans('labels.backend.projects.management'))

@section('page-header')
    <h1>{{ trans('labels.backend.projects.management') }}</h1>
@endsection

@section('content')
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans('labels.backend.projects.management') }}</h3>

            <div class="box-tools pull-right">
                @include('backend.projects.partials.projects-header-buttons')
            </div>
        </div><!-- /.box-header -->

        <div class="box-body">
            <div class="table-responsive data-table-wrapper">
                <table id="projects-table" class="table table-condensed table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>{{ trans('labels.backend.projects.table.title') }}</th>
                            <th>{{ trans('labels.backend.projects.table.timeframe') }}</th>
                            <th>{{ trans('labels.backend.projects.table.company') }}</th>
                            <th>{{ trans('labels.backend.projects.table.status') }}</th>
                            <th>{{ trans('labels.backend.projects.table.createdat') }}</th>
                            <th>{{ trans('labels.backend.projects.table.createdby') }}</th>
                            <th>{{ trans('labels.general.actions') }}</th>
                        </tr>
                    </thead>
                    <thead class="transparent-bg">
                        <tr>
                            <th>
                                {!! Form::text('title', null, ["class" => "search-input-text form-control", "data-column" => 0, "placeholder" => trans('labels.backend.projects.table.title')]) !!}
                                    <a class="reset-data" href="javascript:void(0)"><i class="fa fa-times"></i></a>
                            </th>
                            <th>
                                {!! Form::text('timeframe', null, ["class" => "search-input-text form-control", "data-column" => 1, "placeholder" => trans('labels.backend.projects.table.timeframe')]) !!}
                                    <a class="reset-data" href="javascript:void(0)"><i class="fa fa-times"></i></a>
                            </th>
                            <th>
                                {!! Form::text('company', null, ["class" => "search-input-text form-control", "data-column" => 2, "placeholder" => trans('labels.backend.projects.table.company')]) !!}
                                    <a class="reset-data" href="javascript:void(0)"><i class="fa fa-times"></i></a>
                            </th>
                            <th>
                                {!! Form::select('status', [0 => "InActive", 1 => "Active"], null, ["class" => "search-input-select form-control", "data-column" => 3, "placeholder" => trans('labels.backend.projects.table.all')]) !!}
                            </th>
                            <th></th>
                            <th>
                                {!! Form::text('createdby', null, ["class" => "search-input-text form-control", "data-column" => 5, "placeholder" => trans('labels.backend.projects.table.createdby')]) !!}
                                    <a class="reset-data" href="javascript:void(0)"><i class="fa fa-times"></i></a>
                            </th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
            </div><!--table-responsive-->
        </div><!-- /.box-body -->
    </div><!--box-->


@endsection

@section('after-scripts')
    {{-- For DataTables --}}
    {{ Html::script(mix('js/dataTable.js')) }}

    <script>
        $(function() {
            var dataTable = $('#projects-table').dataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: '{{ route("admin.projects.get") }}',
                    type: 'post'
                },
                columns: [
                    {data: 'title',         name: '{{config('module.projects.table')}}.title'},
                    {data: 'timeframe',     name: '{{config('module.projects.table')}}.timeframe'},
                    {data: 'company_id',    name: '{{config('module.companies.table')}}.title'},
                    {data: 'status',        name: '{{config('module.projects.table')}}.status'},
                    {data: 'created_at',    name: '{{config('module.projects.table')}}.created_at'},
                    {data: 'created_by',    name: '{{config('access.users_table')}}.first_name'},
                    {data: 'actions',       name: 'actions', searchable: false, sortable: false}
                ],
                order: [[0, "asc"]],
                searchDelay: 500,
                dom: 'lBfrtip',
                buttons: {
                    buttons: [
                        { extend: 'copy',   className: 'copyButton',    exportOptions: {columns: [ 0, 1, 2, 3, 4, 5, ]  }},
                        { extend: 'csv',    className: 'csvButton',     exportOptions: {columns: [ 0, 1, 2, 3, 4, 5, ]  }},
                        { extend: 'excel',  className: 'excelButton',   exportOptions: {columns: [ 0, 1, 2, 3, 4, 5, ]  }},
                        { extend: 'pdf',    className: 'pdfButton',     exportOptions: {columns: [ 0, 1, 2, 3, 4, 5, ]}, orientation: 'landscape'},
                        { extend: 'print',  className: 'printButton',   exportOptions: {columns: [ 0, 1, 2, 3, 4, 5, ]}, orientation: 'landscape'}
                    ]
                }
            });

            Backend.DataTableSearch.init(dataTable);
        });
    </script>
@endsection