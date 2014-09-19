"use strict"
util   = require "util"
path   = require "path"
yeoman = require "yeoman-generator"
yosay  = require "yosay"

class FrankGenerator extends yeoman.generators.Base
  initializing: ->
    @pkg = require "../package.json"

  prompting: ->
    done = @async()

    this.log yosay "Enjoy your gulp from this stylus angular coffee"

    prompts = [
      {
        type    : "confirm"
        name    : "someOption"
        message : "Would you like to enable this option?"
        default : true
      }
      {
        type    : "confirm"
        name    : "anotherOption"
        message : "Would you like to enable another?"
        default : false
      }
    ]

    @prompt prompts, (props) =>
      @someOption = props.someOption

      done()

  writing:
      app: ->
        @dest.mkdir "app"
        @dest.mkdir "app/templates"

        @src.copy '_package.json', 'package.json'
        @src.copy '_bower.json', 'bower.json'

      projectFiles: ->
        @src.copy 'editorconfig', '.editorconfig'

  end: -> @installDependencies()

module.exports = FrankGenerator
