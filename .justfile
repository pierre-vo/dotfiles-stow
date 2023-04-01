set shell := ["bash", "-uc"]

default:
  @just --list

# GIT copy branches and tags from one remote to another
git_transfert REMOTE ORIGIN='origin':
  #!/usr/bin/env bash
  git push {{REMOTE}} 'refs/remotes/{{ORIGIN}}/*:refs/heads/*'
  git push {{REMOTE}} 'refs/tags/*:refs/tags/*'

