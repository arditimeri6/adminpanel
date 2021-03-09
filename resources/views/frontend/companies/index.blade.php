@extends('frontend.layouts.app')

@section('content')
	<div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h4><strong>{{ $company->title }}</strong></h4></div>

                <div class="panel-body">
                    <div role="tabpanel">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane mt-30 active" id="profile">
                                <table class="table table-striped table-hover">
   									
   									{!! $company->description !!} 
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.title') }}</th>
								        <td>{{ $company->title }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.website') }}</th>
								        <td>www.{{ $company->website }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.address') }}</th>
								        <td>{{ $company->address }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.phonenumber') }}</th>
								        <td>{{ $company->phone_number }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.status') }}</th>
								        <td>{{ (($company->status) == 1) ? "Active" : "Inactive" }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.createdby') }}</th>
								        <td>{{ $company->owner->first_name }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.createdat') }}</th>
								        <td>{{ $company->created_at }} ({{ $company->created_at->diffForHumans() }})</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.company.profile.updatedat') }}</th>
								        <td>{{ $company->updated_at }} ({{ $company->updated_at->diffForHumans() }})</td>
								    </tr>
								    
								     
								</table>
                            </div><!--tab panel profile-->
                        </div><!--tab content-->
                    </div><!--tab panel-->
                </div><!--panel body-->
            </div><!-- panel -->

            <div class="panel panel-default">
            	<div class="panel-heading">
            		<h4><i class="fa fa-briefcase"></i> {{ trans('labels.frontend.company.profile.projects') }}</h4>
            	</div>

            	<div class="panel-body">
			        @foreach($company->projects as $project)
			          	<div class="col-md-4">
			            	<h4>{{ $project->title }}</h4>
			           		<p>Timeframe: {{ $project->timeframe }} days</p>
			            	<p><a 	class="btn btn-primary" 
			            			href="{{ route('frontend.projects.show', $project->project_slug) }}" 
			            			role="button">View Project
			            	</a></p>
			         	</div>
			        @endforeach
			    </div>
      		</div>

      		<div class="panel panel-default">
            	<div class="panel-heading">
            		<h4>
            			<i class="fa fa-comments"></i> {{ trans('labels.frontend.company.profile.comments') }} 
            			<span class="pull-right">{{ $company->comments->count() }} comment(s)</span> 
            		</h4>
            	</div>

            	<div class="panel-body">
            		<ul class="media-list">
				        @foreach($company->comments as $comment)
				       		<li class="media" style="border-bottom: 1px dotted #ccc;">
					        	<div class="media-left">
					                <img src="http://placehold.it/60x60" class="img-circle">
					            </div>

					            <div class="media-body">
					                <h3 class="media-heading">
					                	<a href="#"> {{ $comment->owner->first_name }} {{ $comment->owner->last_name }} </a>
					                </h3>
					                  	<h5 class="pull-right"> {{ $comment->created_at->diffForHumans() }} </h5>
					                
					                <p>{!! $comment->body !!}</p>
					            </div>
					        </li>
				        @endforeach
				    </ul>
			    </div>
      		</div>

      		<div class="panel panel-default">
            	<div class="panel-heading">
            		<h4><i class="fa fa-plus-square"></i> {{ trans('labels.frontend.company.profile.comment') }}</h4>
            	</div>

            	<div class="panel-body">
			        {{ Form::open(['route' => ['admin.comments.store', $company->id], 'method' => 'POST']) }}
			        	<div class="form-group">
				        	{{ Form::label('body', "Comment:") }}
				        	{{ Form::textarea('body', null, ['class' => 'form-control', 'rows' => '3']) }}
			        	</div>
			        	<div class="form-group pull-right">
			        		{{ Form::submit('Post', ['class' => 'btn btn-primary']) }}
			        	</div>

			        {{ Form::close() }}
			    </div>
      		</div>


        </div><!-- col-xs-12 -->
    </div><!-- row -->
@endsection

@section("after-scripts")
    <script type="text/javascript">
        Backend.tinyMCE.init();
    </script>
@endsection