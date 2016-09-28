# martian_robots

[![Build Status](https://travis-ci.org/haines/martian_robots.svg?branch=master)](https://travis-ci.org/haines/martian_robots)
[![Code Climate](https://codeclimate.com/github/haines/martian_robots/badges/gpa.svg)](https://codeclimate.com/github/haines/martian_robots)
[![Test Coverage](https://codeclimate.com/github/haines/martian_robots/badges/coverage.svg)](https://codeclimate.com/github/haines/martian_robots/coverage)

Martian Robots programming problem

## Running with Ruby

You'll need Ruby 2.1+ to run the application.

### Setup

```console
$ bundle install
```

### Test

```console
$ bundle exec rake
```

### Run

```console
$ bundle exec bin/martian_robots [path to input]
```

The program will read from stdin if an input file is not given.

#### Example

```console
$ bundle exec bin/martian_robots test/sample_input.txt
1 1 E
3 3 N LOST
2 3 S
```

## Running with Docker

### Build

```console
$ docker build -t ahaines/martian_robots .
```

This step is optional; the image exists in the Docker Hub, so it can be pulled down automatically when launching the container.

### Test

```console
$ docker run -it --entrypoint rake ahaines/martian_robots
```

### Run

```console
$ docker run -it ahaines/martian_robots [path to input]
```

Note that any input file other than `test/sample_input.txt` will have to be bind-mounted into the container.

#### Example

```console
$ docker run -it ahaines/martian_robots test/sample_input.txt
1 1 E
3 3 N LOST
2 3 S
```
