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
        { rebar_deb, ".*", {git, "https://github.com/venkatxaptum/rebar_deb.git", {branch, "master"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 rebar_deb
    ===> Fetching rebar_deb
    ===> Compiling rebar_deb
    <Plugin Output>
