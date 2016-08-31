# eachbar

A small library wrapping [`ruby-progressbar`](https://github.com/jfelchner/ruby-progressbar), adding an `each_with_progress` method to all enumerable objects that renders a progress bar.

I've found this to be useful primarily when writing one-off scripts.

## Installation

    git clone https://github.com/davidh-raybeam/eachbar.git
    cd eachbar
    rake build
    gem install pkg/eachbar-1.0.0.gem

## Usage

    $ irb -reachbar
    > [*1..100].each_with_progress { sleep 1 }

Enumerables that know their own lengths (like `Array`s) will display a percentage and an ETA. Enumerables that do not know their lengths (like `Range`s) will display only elapsed time and the number of items completed.

Any options passed to `each_with_progress` will be used to initialize the `ProgressBar`. See [the `ProgressBar` docs](https://github.com/jfelchner/ruby-progressbar/wiki/Options) for more info.
