{{--table of videos for tournament details page--}}
@if(@$all_users)
    @include('tournaments.modals.video-tagging')
@endif
<table class="table table-sm table-striped abr-table" id="{{ $id }}">
    <tbody>
    @for ($i = 0; $i < count($videos); $i++)
        <tr class="{{ $i >= 4 ? 'hide-video hidden-xs-up' : ''}}">
            {{--thumbnail--}}
            <td>
                <a href="#" onClick="watchVideo('{{ $videos[$i]->video_id }}')">
                    <img src="{{ $videos[$i]->thumbnail_url }}"/>
                </a>
            </td>
            {{--video info--}}
            <td>
                <b>
                    <a href="#" onClick="watchVideo('{{ $videos[$i]->video_id }}')">
                        {{ $videos[$i]->video_title }}
                    </a>
                </b>
                <br/>
                {{ $videos[$i]->channel_name }}
                @if (!@$tournament)
                    <br/>
                    <span class="small-text">
                        <a href="{{ $videos[$i]->tournament->seoUrl() }}">{{ $videos[$i]->tournament->title }}</a>
                        ({{ $videos[$i]->tournament->date }})
                    </span>
                @endif
                {{--tagged users--}}
                @if (count($videos[$i]->videoTags))
                    <br/>
                    @foreach($videos[$i]->videoTags as $key => $tag)
                        {{--delete tag button--}}
                        @if($user && ($user->admin || $user->id == $tag->tagged_by_user_id ||
                            $user->id == $tag->video->user_id || $user->id == $tag->video->tournament->creator ||
                            $user->id == $tag->user_id))
                            <a href="/videotags/delete/{{ $tag->id }}" class="text-danger"
                               onclick="return confirm('Are you sure you want to untag user?')"><i class="fa fa-trash" title="untag"></i></a>
                        @endif
                        {{--display IDs--}}
                        @if ($videos[$i]->tournament->registration_number())
                            <?php if (is_null(@$entries)) $entries = $videos[$i]->tournament->entries; ?>
                            @for ($u = 0; $u < count($entries); $u++)
                                @if($entries[$u]->user == $tag->user_id)
                                    @if ($entries[$u]->type == 3)
                                        <a href="{{ $entries[$u]->runner_deck_url() }}" title="{{ $entries[$u]->runner_deck_title }}"><img src="/img/ids/{{ $entries[$u]->runner_deck_identity }}.png"></a>&nbsp;<a href="{{ $entries[$u]->corp_deck_url() }}" title="{{ $entries[$u]->corp_deck_title }}"><img src="/img/ids/{{ $entries[$u]->corp_deck_identity }}.png"></a>
                                    @else
                                        <img src="/img/ids/{{ $entries[$u]->runner_deck_identity }}.png">&nbsp;<img src="/img/ids/{{ $entries[$u]->corp_deck_identity }}.png">
                                    @endif
                                @endif
                            @endfor
                        @endif
                        <a href="/profile/{{ $tag->user->id }}">{{ $tag->user->displayUsername() }}</a>{{ $key != count($videos[$i]->videoTags)-1 ? ', ' : '' }}
                    @endforeach
                @endif
            </td>
            {{--buttons--}}
            <td>
                @if ($user && @$all_users)
                <button href="" class="btn btn-xs btn-info" data-toggle="modal" data-target="#videoTaggingModal"
                        data-video-id="{{ $videos[$i]->id }}" data-video-title="{{ $videos[$i]->video_title }}">
                    <i class="fa fa-user" title="tag user"></i>
                </button>
                @endif
                @if ($user && ($user->admin || $user->id == $videos[$i]->user_id || $user->id == $videos[$i]->tournament->creator))
                    {!! Form::open(['method' => 'DELETE', 'url' => "/videos/{$videos[$i]->id}"]) !!}
                        {!! Form::button('<i class="fa fa-trash" aria-hidden="true"></i>',
                            array('type' => 'submit', 'class' => 'btn btn-danger btn-xs delete-video',
                            'onclick' => "return confirm('Are you sure you want to delete video?')")) !!}
                    {!! Form::close() !!}
                @endif
            </td>
        </tr>
    @endfor
    </tbody>
</table>
@if (count($videos) > 4)
    <div class="text-xs-center">
        <button class="btn btn-primary btn-xs" onclick="showVideoList(true)" id="showVideoList" type="button">
            <i class="fa fa-eye" aria-hidden="true"></i> Show All Videos
        </button>
        <button class="btn btn-primary btn-xs hidden-xs-up" onclick="showVideoList(false)" id="hideVideoList" type="button">
            <i class="fa fa-eye-slash" aria-hidden="true"></i> Hide Videos
        </button>
    </div>
@endif
