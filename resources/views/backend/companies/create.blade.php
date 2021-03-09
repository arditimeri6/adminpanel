@extends ('backend.layouts.app')

@section ('title', trans('labels.backend.companies.management') . ' | ' . trans('labels.backend.companies.create'))

@section('page-header')
    <h1>
        {{ trans('labels.backend.companies.management') }}
        <small>{{ trans('labels.backend.companies.create') }}</small>
    </h1>
@endsection

@section('content')
    {{ Form::open(['route' => 'admin.companies.store', 'class' => 'form-horizontal', 'role' => 'form', 'method' => 'post', 'id' => 'create-permission']) }}

        <div class="box box-info">
            <div class="box-header with-border">
                <h3 class="box-title">{{ trans('labels.backend.companies.create') }}</h3>

                <div class="box-tools pull-right">
                    @include('backend.companies.partials.companies-header-buttons')
                </div><!--box-tools pull-right-->
            </div><!-- /.box-header -->

            <div class="box-body">
                <div class="form-group">
                    {{ Form::label('title', trans('validation.attributes.backend.companies.title'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::text('title', null, ['class' => 'form-control box-size', 'placeholder' => trans('validation.attributes.backend.companies.title'), 'required' => 'required']) }}
                    </div><!--col-lg-10-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('website', trans('validation.attributes.backend.companies.website'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::text('website', null, ['class' => 'form-control box-size', 'placeholder' => trans('validation.attributes.backend.companies.website'), 'required' => 'required']) }}
                    </div><!--col-lg-10-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('address', trans('validation.attributes.backend.companies.address'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::text('address', null, ['class' => 'form-control box-size', 'placeholder' => trans('validation.attributes.backend.companies.address'), 'required' => 'required']) }}
                    </div><!--col-lg-10-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('phone_number', trans('validation.attributes.backend.companies.phone_number'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::text('phone_number', null, ['class' => 'form-control box-size', 'placeholder' => trans('validation.attributes.backend.companies.phone_number' ), 'required' => 'required']) }}
                    </div><!--col-lg-10-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('description', trans('validation.attributes.backend.companies.description'), ['class' => 'col-lg-2 control-label required']) }}

                    <div class="col-lg-10">
                        {{ Form::textarea('description', null,['class' => 'form-control', 'placeholder' => trans('validation.attributes.backend.companies.description')]) }}
                    </div><!--col-lg-3-->
                </div><!--form control-->

                <div class="form-group">
                    {{ Form::label('status', trans('validation.attributes.backend.companies.is_active'), ['class' => 'col-lg-2 control-label']) }}

                    <div class="col-lg-10">
                        <div class="control-group">
                            <label class="control control--checkbox">
                                {{ Form::checkbox('status', 1, true) }}
                                <div class="control__indicator"></div>
                            </label>
                        </div>
                    </div><!--col-lg-3-->
                </div><!--form control-->
                <div class="edit-form-btn">
                    {{ link_to_route('admin.companies.index', trans('buttons.general.cancel'), [], ['class' => 'btn btn-danger btn-md']) }}
                    {{ Form::submit(trans('buttons.general.crud.create'), ['class' => 'btn btn-primary btn-md']) }}
                    <div class="clearfix"></div>
                </div>
            </div><!-- /.box-body -->
        </div><!--box-->
    {{ Form::close() }}
@endsection
@section("after-scripts")
    <script type="text/javascript">
        Backend.Companies.init();
    </script>
@endsection
