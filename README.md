# T&#257;whirim&#257;tea tools

See also: [tawhiri](https://github.com/cuspaceflight/tawhiri) (main project).

## Included programs

### dataset-stats

Analyse a dataset, and proudce mean, min, max & standard deviation for each
(level, variable). This will be used to pick sensible parameters for the
numerical integration.

### dataset-archive

Copy wind data in a box that bounds the UK to and from dataset files. This is
running via cron, and will be used to retrospectively run predictions and
compare them to actual flights.

## License

`dataset-stats` and `dataset-archive` are Copyright 2014
[Daniel Richman](http://www.danielrichman.co.uk/) and are licensed under the
[GNU GPL 3](http://gplv3.fsf.org/); see LICENSE.

## Dependencies

`dataset-stats` and `dataset-archive` require OCaml and Core
(from `opam install core`).

## Building

`dataset-stats` and `dataset-archive` may be built using `corebuild`; you
want to build `main.native` in `dataset-stats/` and `archive.native` &
`unpack.native` in `dataset-archive/`.

## Deploying

OCaml’s `BigArray` doesn’t appear to be able to create read-only maps, and
so in order to map a read-only dataset, we need to create a private map.
Turns out the kernel is a bit unhappy about us asking for 18G of memory we
might end up using. The ~~“solution”~~ hack is to turn overcommit up to
infinity:

`sudo sysctl vm.overcommit_memory=1`

(and create /etc/sysctl.d/90-tawhiri-overcommit.conf).
