# martian_robots

[![Build Status](https://travis-ci.org/haines/martian_robots.svg?branch=master)](https://travis-ci.org/haines/martian_robots)
[![Code Climate](https://codeclimate.com/github/haines/martian_robots/badges/gpa.svg)](https://codeclimate.com/github/haines/martian_robots)
[![Test Coverage](https://codeclimate.com/github/haines/martian_robots/badges/coverage.svg)](https://codeclimate.com/github/haines/martian_robots/coverage)

Martian Robots programming problem

## Setup

```console
$ bundle install
```

## Test

```console
$ bundle exec rake
```

## Run

```console
$ bundle exec bin/martian_robots [path to input]
```

The program will read from stdin if an input file is not given.

### Example

```console
$ bundle exec bin/martian_robots test/sample_input.txt
1 1 E
3 3 N LOST
2 3 S
```
