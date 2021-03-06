# GeoWorks::Derivatives

[![Build Status](https://img.shields.io/travis/pulibrary/geo_works-derivatives/master.svg)](https://travis-ci.org/pulibrary/geo_works-derivatives)

Hydra::Derivatives compatible processors for Geospatial derivative generation.

## Dependencies

1. [ImageMagick](http://www.imagemagick.org/)
1. [GDAL](http://www.gdal.org/)
    * You can install it on Mac OSX with `brew install gdal`.
    * On Ubuntu, use `sudo apt-get install gdal-bin`.

## Simple Tiles

GeoWorks requires the image generation library [Simple Tiles](http://propublica.github.io/simple-tiles/).

Mac OS X:

- Install via Homebrew: ```brew install simple-tiles```

Linux:

- Install dependencies:

  ```
  libgdal-dev
  libcairo2-dev
  libpango1.0-dev
  ```

- Compile:

  ```
  $ git clone git@github.com:propublica/simple-tiles.git
  $ cd simple-tiles
  $ ./configure
  $ make && make install
  ```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geo_works-derivatives'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geo_works-derivatives

## Usage

TODO: Write usage instructions here

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pulibrary/geo_works-derivatives.
