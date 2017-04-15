#!/usr/bin/env bash
set -e

emacs -batch \
      -l test/test-helper.el \
      -l ert \
      -l test/utils/test-package-utils.el \
      -f ert-run-tests-batch-and-exit
