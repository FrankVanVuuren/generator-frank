gulp       = require 'gulp'
$          = require ('gulp-load-plugins')()
del        = require 'del'
wiredep    = require ('wiredep').stream

paths =
  scripts: ['app/scripts/**/*.coffee', 'app/scripts/**/*.js']
  images:  ['app/images/**/*']

gulp.task 'clean' (cb) -> del ['build'], cb

gulp.task 'scripts', ['clean'], ->
  gulp.src paths.scripts
    .pipe $.sourcemaps.init ()
    .pipe $.coffee ()
    .pipe $.uglify ()
    .pipe $.concat '<%= site_name %>'
    .pipe $.sourcemaps.write ()
    .pipe gulp.dest 'build/js'

gulp.task 'images', ['clean'], ->
  gulp.src paths.images
    .pipe $.imagemin
      optimizationLevel: 3
      progressive:       on
      interlaced:        on
    .pipe gulpe.dest 'build/images'

gulp.task 'bower', ['clean'], ->

gulp.task 'build', ['scripts', 'images']
