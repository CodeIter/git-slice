# Git repository slicer

The `git-slice` script provides a convenient way to push changes from specific files or directories in a Git repository to corresponding remote repositories using Git subtrees.

## Requirements

- `bash`       : GNU Project implementation of the standard Unix shell *version 4 and later*.
- `git`        : Git distributed version control system.

### optional

> Required only if you want to create a remote repositories for each `git subtree`.

- `gh`         : GitHub CLI.
- `curl`       : Command-line tool for transferring data using various network protocols.
- `awk`        : Data-driven programming language.

## Usage

```sh
./gitslice.sh {paths...}
```

## Options

- `{paths}` : Specify one or more files or directories to exort them as **git branch** or **git repositories** at [github.com](github.com).

## Environment variables

- `ACCESS_TOKEN`        : Access token with `repo` permissions **required** if `ENABLE_SUBTREE_PUSH` enabled.
- `ENABLE_SUBTREE_PUSH` : A non-empty value to enable export `git subtree` as **git repository** at [github.com](github.com).

## Notes

- If a file or directory is not found, a warning is displayed and the script will continue without pushing changes for that item.
- Git subtrees use branch names with a prefix of `___`, so if you have branches with names starting with that prefix, the script may not function as expected.
- If there are conflicts when pushing changes to a remote repository, the script will create a pull request on GitHub.
- The script will exit with an error if any command fails (`set -euo pipefail`).

## Author

This script was written by Mohammed Amin Boubaker.

## License

This script is released under the MIT License. See the LICENSE file for details.
