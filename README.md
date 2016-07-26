rebar_deb
=====

rebar plugin to package release as a debian package

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        { rebar_deb, ".*", {git, "git@host:user/rebar_deb.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 rebar_deb
    ===> Fetching rebar_deb
    ===> Compiling rebar_deb
    <Plugin Output>
