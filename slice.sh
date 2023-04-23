#!/usr/bin/env bash

set -euxo pipefail

_git_subtree_branch_prefix="___"
_git_branch="$(git rev-parse --abbrev-ref HEAD)"
GITHUB_OWNER="${GITHUB_REPOSITORY%%/*}"

for _i in "${@}" ; do

  [ -e "${_i}" ] || continue

  _dir="${_i}"
  _basename="$(basename "${_i}")"

  git subtree split -P "${_dir}" -b "${_git_subtree_branch_prefix}${_basename}" \
  || exit 1

done

readarray -t _git_branches < <(git branch --list "${_git_subtree_branch_prefix}*")

for _i in "${_git_branches}" ; do

  _git_subtree_branch="${_i}"
  _git_remote_repo_name="${_git_subtree_branch#${_git_subtree_branch_prefix}}"
  git push "https://x-access-token:${ACCESS_TOKEN}@github.com/${GITHUB_OWNER}/${_git_remote_repo_name}.git" "${_git_subtree_branch}:${_git_branch}"

done
