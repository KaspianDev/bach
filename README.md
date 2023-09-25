# bach - a patch-based forking system

The idea behind bach is to make forking and keeping up-to-date with upstream easier thanks to git's features.

# How to use?

First of all, clone `bach` and put it's folder somewhere in your project. \
Ideally extract (or symlink) scripts so that they are in your project's root directory.

Second step is to add the repo you want to patch as a submodule like this:
```sh
git submodule add URL
```

Next step is to set up `.bach` file responsible for configuration. It should be configure like so:
```properties
REPO_URL="https://github.com/drtshock/Potato.git"
MODULE_DIR="Potato"
PATCH_DIR="patches"
ORIGIN_BRANCH="origin/master"
```

Now, you can start working on the upstream project, commit changes and run `genPatches.sh` (if running for the first time, commit hash should be used as argument) to generate patches (patches are based on commit message). To make sure all patches are correct before creating a new one run `applyPatches.sh` and see if any errors appear. If a particular patch needs editing you can use the `editPatch.sh` script which runs git rebase interactive window.

# Configurable properties

`REPO_URL` - The URL of the repo you are patching. \
`MODULE_DIR` - The directory where the module got cloned into (usually case-sensitive repo name). \
`PATCH_DIR` - The directory where all generated patches will be generated. \
`ORIGIN_BRANCH` - The branch (or tag) you are patching.

