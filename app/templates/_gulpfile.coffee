'use strict'

requireDir = require 'require-dir'
gulp       = require('gulp')
requireDir './gulp'

gulp.task 'default', ['clean'], ->
  gulp.start 'build'
