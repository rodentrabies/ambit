# Ambit

A small tool for running an agent in a container with a narrow view of
your project, delimited by a filesystem subtree.

To run, give it the paths of the subtrees you want the agent to see:

    $ ambit path/to/project1 path/to/project2 ...

Next, just follow the agent CLI instructions on how to authenticate
and start working.

If you want to start with an empty working directory, just run

    $ ambit

The tool works via mapped directories. The given subtree
`path/to/<name>` is mapped to `/workspace/<name>` inside the container
and the agent does not see anything outside of the mapped subtrees. In
the example above, the directory `path/to/project1` will be located at
`/workspace/project1` inside the container, and `path/to/project2` -
at `/workspace/project2`.

If you want a directory with certain tools be available to the agent,
just map that directory into the container as another project:

    $ ambit path/to/project1 path/to/tooldir

and use the tools in the container as `/workspace/tooldir/tool1`, etc.

The agent config/state directory (`.claude`) will be automatically
created at the location from which `ambit` is executed.

The container image is built automatically the first time it is
needed. To pick up the most recent packages or a change in the
`Containerfile`, force a rebuild before running:

    $ ambit --rebuild path/to/project1

Arguments starting with `-` or `--` are treated as options, everything
else - as project directories. The order of the arguments does not
matter, so you can add the `-r`/`--rebuild` flag at the last moment
after typing all your projects on the command line:

    $ ambit path/to/project1 ... path/to/projectN -r

Because of that, if the command line contains the `-h`/`--help` flag,
everything else is ignored and the help message is displayed.
