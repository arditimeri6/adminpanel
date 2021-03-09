@extends('frontend.layouts.app')

@section('content')
	<div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h4><strong>{{ $project->title }}</strong></h4></div>

                <div class="panel-body">
                    <div role="tabpanel">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane mt-30 active" id="profile">
                                <table class="table table-striped table-hover">
   									
   									{!! $project->description !!} 
								    <tr>
								        <th>{{ trans('labels.frontend.project.profile.title') }}</th>
								        <td>{{ $project->title }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.project.profile.timeframe') }}</th>
								        <td>{{ $project->timeframe }} days</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.project.profile.company') }}</th>
								        <td>{{ $project->companyOwner->title }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.project.profile.status') }}</th>
								        <td>{{ (($project->status) == 1) ? "Active" : "Inactive" }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.project.profile.createdby') }}</th>
								        <td>{{ $project->owner->first_name }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.project.profile.createdat') }}</th>
								        <td>{{ $project->created_at }} ({{ $project->created_at->diffForHumans() }})</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.project.profile.updatedat') }}</th>
								        <td>{{ $project->updated_at }} ({{ $project->updated_at->diffForHumans() }})</td>
								    </tr>

								</table>
                            </div><!--tab panel profile-->
                        </div><!--tab content-->
                    </div><!--tab panel-->
                </div><!--panel body-->
            </div><!-- panel -->

            <div class="panel panel-default">
            	<div class="panel-heading"><h4><i class="fa fa-tasks"></i> {{ trans('labels.frontend.project.profile.tasks') }}</h4></div>

            	<div class="panel-body">
			        @foreach($project->tasks as $task)
			          	<div class="col-md-4">
			            	<h4>{{ $task->title }}</h4>
			           		<p>Timeframe: {{ $task->timeframe }} days</p>
			            	<p><a class="btn btn-primary" href="{{ route('frontend.tasks.show', $task->task_slug) }}" role="button">View Task</a></p>
			         	</div>
			        @endforeach
			    </div>
      		</div>

      		<div class="panel panel-default">
            	<div class="panel-heading">
            		<h4>
            			<i class="fa fa-comments"></i> {{ trans('labels.frontend.project.profile.comments') }}
            			<span class="pull-right">{{ $project->comments->count() }} comment(s)</span> 
            		</h4>
            	</div>

            	<div class="panel-body">
            		<ul class="media-list">
				        @foreach($project->comments as $comment)
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
            		<h4><i class="fa fa-plus-square"></i> {{ trans('labels.frontend.project.profile.comment') }}</h4>
            	</div>

            	<div class="panel-body">
			        {{ Form::open(['route' => ['admin.comments.store', $project->id], 'method' => 'POST']) }}
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