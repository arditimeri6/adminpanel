@extends ('backend.layouts.app')

@section ('title', trans('labels.backend.tasks.management') . ' | ' . trans('labels.backend.tasks.edit'))

@section('page-header')
    <h1>
        {{ trans('labels.backend.tasks.management') }}
        <small>{{ trans('labels.backend.tasks.edit') }}</small>
    </h1>
@endsection

@section('content')
    {{ Form::model($page, ['route' => ['admin.tasks.update', $page], 'class' => 'form-horizontal', 'role' => 'form', 'method' => 'PATCH', 'id' => 'edit-role']) }}

        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">{{ trans('labels.backend.tasks.edit') }}</h3>

                <div class="box-tools pull-right">
                    @include('backend.tasks.partials.tasks-header-buttons')
                </div><!--box-tools pull-right-->
            </div><!-- /.box-header -->

            <div class="box-body">
                <div class="form-group">
                    {{ Form::label('title', trans('validation.attributes.backend.tasks.title'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::text('title', null, ['class' => 'form-control box-size', 'placeholder' => trans('validation.attributes.backend.tasks.title'), 'required' => 'required']) }}
                    </div><!--col-lg-10-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('timeframe', trans('validation.attributes.backend.tasks.timeframe'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::number('timeframe', null, ['class' => 'form-control box-size', 'placeholder' => trans('validation.attributes.backend.tasks.timeframe'), 'required' => 'required']) }}
                    </div><!--col-lg-10-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('description', trans('validation.attributes.backend.tasks.description'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::textarea('description', null,['class' => 'form-control', 'placeholder' => trans('validation.attributes.backend.tasks.description')]) }}
                    </div><!--col-lg-3-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('status', trans('validation.attributes.backend.tasks.is_active'), ['class' => 'col-lg-2 control-label']) }}

                    <div class="col-lg-10">
                        <div class="control-group">
                            <label class="control control--checkbox">
                                {{ Form::checkbox('status', 1, ($page->status == 1) ? true : false ) }}
                                <div class="control__indicator"></div>
                            </label>
                        </div>
                    </div><!--col-lg-3-->
                </div><!--form control-->
                <div class="edit-form-btn">
                    {{ link_to_route('admin.tasks.index', trans('buttons.general.cancel'), [], ['class' => 'btn btn-danger btn-md']) }}
                    {{ Form::submit(trans('buttons.general.crud.update'), ['class' => 'btn btn-primary btn-md']) }}
                    <div class="clearfix"></div>
                </div>
            </div><!-- /.box-body -->
        </div><!--box-->
    {{ Form::close() }}
@endsection
@section("after-scripts")
    <script type="text/javascript">
        Backend.Tasks.init();
    </script>
@endsection