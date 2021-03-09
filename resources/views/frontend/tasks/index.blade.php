@extends('frontend.layouts.app')

@section('content')
	<div class="row">

        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h4><strong>{{ $task->title }}</strong></h4></div>

                <div class="panel-body">
                    <div role="tabpanel">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane mt-30 active" id="profile">
                                <table class="table table-striped table-hover">
   									
   									{!! $task->description !!} 
								    <tr>
								        <th>{{ trans('labels.frontend.task.profile.title') }}</th>
								        <td>{{ $task->title }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.task.profile.timeframe') }}</th>
								        <td>{{ $task->timeframe }} days</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.task.profile.project') }}</th>
								        <td>{{ $task->projectOwner->title }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.task.profile.status') }}</th>
								        <td>{{ (($task->status) == 1) ? "Active" : "Inactive" }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.task.profile.createdby') }}</th>
								        <td>{{ $task->owner->first_name }}</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.task.profile.createdat') }}</th>
								        <td>{{ $task->created_at }} ({{ $task->created_at->diffForHumans() }})</td>
								    </tr>
								    <tr>
								        <th>{{ trans('labels.frontend.task.profile.updatedat') }}</th>
								        <td>{{ $task->updated_at }} ({{ $task->updated_at->diffForHumans() }})</td>
								    </tr>
								    
								     
								</table>
                            </div><!--tab panel profile-->
                        </div><!--tab content-->
                    </div><!--tab panel-->
                </div><!--panel body-->
            </div><!-- panel -->

            <div class="panel panel-default">
            	<div class="panel-heading">
            		<h4>
            			<i class="fa fa-comments"></i> {{ trans('labels.frontend.task.profile.comments') }}
            			<span class="pull-right">{{ $task->comments->count() }} comment(s)</span> 
            		</h4>
            	</div>

            	<div class="panel-body">
            		<ul class="media-list">
				        @foreach($task->comments as $comment)
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
            		<h4><i class="fa fa-plus-square"></i> {{ trans('labels.frontend.task.profile.comment') }}</h4>
            	</div>

            	<div class="panel-body">
			        {{ Form::open(['route' => ['admin.comments.store', $task->id], 'method' => 'POST']) }}
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