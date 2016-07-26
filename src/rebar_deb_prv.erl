-module('rebar_deb_prv').

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, 'deb').
-define(DEPS, [release]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 rebar_deb"}, % How to use the plugin
            {opts, []},                   % list of options understood by the plugin
            {short_desc, "rebar plugin to package release as a debian package"},
            {desc, "rebar plugin to package release as a debian package"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    lists:foreach(fun display_info/1, rebar_state:project_apps(State)),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).

display_info(App) ->
    rebar_api:info("Application ~s Version ~s ~n", [rebar_app_info:name(App), rebar_app_info:original_vsn(App)]).
