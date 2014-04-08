# T&#257;whirim&#257;tea tools

See also: https://github.com/cuspaceflight/tawhiri

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
