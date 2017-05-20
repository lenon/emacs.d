#!/usr/bin/env bash
set -e

emacs -batch \
      -l test/test-helper.el \
      -f buttercup-run-discover
