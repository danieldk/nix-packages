# danieldk's Nix repository

This Nix package repository primarily offers natural language
processing and machine learning packages. Most of these packages have
a user group that is too narrow to upstream them in
[nixpkgs](https://github.com/nixos/nixpkgs).

## Supported Nix channels

In principle any modern release of Nix is supported. CI builds of
packages are automatically performed on NixOS 19.03. macOS builds are
checked semi-regularly. Failing macOS builds are considered to be
bugs.

## Using the repository

### One-off installs

One-off package installs can be performed without configuration
changes, using e.g. `nix-env`:

~~~shell
$ nix-env \
  -f https://github.com/danieldk/nix-packages/archive/master.tar.gz \
  -iA conllu-utils
~~~

### Adding the repository

If you want to use multiple packages from the repository or get
package updates, it is recommended to add the package set to your
local Nix configuration. You can do this be adding the package set to
your `packageOverrides`. To do so, add the following to
`~/.config/nixpkgs/config.nix`:

~~~nix
{
  packageOverrides = pkgs: {
    danieldk = import (builtins.fetchTarball "https://github.com/danieldk/nix-packages/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
~~~

Then the packages will be available as attributes under `danieldk`,
e.g.  `danieldk.conllu-utils`.

### Pinning a specific revision

Fetching the repository tarball as above will only cache the
repository download for an hour. To avoid this, you should pin the
repository to a specific revision.

~~~nix
{
  packageOverrides = pkgs: {
    danieldk = import (builtins.fetchTarball {
	    # Get the archive for commit baa127b
        url = "https://github.com/danieldk/nix-packages/archive/baa127b34ab70bede808f3baa0a8593f11ab1a78.tar.gz";
		# Get the SHA256 hash using: nix-prefetch-url --unpack <url>
        sha256 = "04l7djqsc6qx9bk2ri3jqwpx7vnqviyh65s7aqxk6d06kf89gc4h";
      })
    {
      inherit pkgs;
    };
  };
}
~~~

## Binary cache

After each commit, CI uploads builds on the latest stable NixOS to
[cachix](https://cachix.org/). If you want to use this binary cache,
follow the steps described at
[danieldk.cachix.org](https://danieldk.cachix.org/).

## Questions, bug reports, and package requests

Feel free to open a GitHub issue for any questions, bug reports, or
request for packages.
