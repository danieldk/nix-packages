{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.7.3

  crates.aho_corasick."0.7.3" = deps: { features?(features_.aho_corasick."0.7.3" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.3";
    description = "Fast multiple substring searching.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0dn42fbdms4brigqphxrvzbjd1s4knyjlzky30kgvpnrcl4sqqdv";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.3" or {});
  };
  features_.aho_corasick."0.7.3" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.3"."std" =
        (f.aho_corasick."0.7.3"."std" or false) ||
        (f.aho_corasick."0.7.3".default or false) ||
        (aho_corasick."0.7.3"."default" or false); }
      { "0.7.3".default = (f.aho_corasick."0.7.3".default or true); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.3".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.3".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.3"."std" or false) ||
        (f."aho_corasick"."0.7.3"."std" or false); }
      { "${deps.aho_corasick."0.7.3".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.3".memchr}".default or false); }
    ];
  }) [
    (features_.memchr."${deps."aho_corasick"."0.7.3"."memchr"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    description = "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10"."serde" =
        (f.arrayvec."0.4.10"."serde" or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10"."std" =
        (f.arrayvec."0.4.10"."std" or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# autocfg-0.1.4

  crates.autocfg."0.1.4" = deps: { features?(features_.autocfg."0.1.4" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.4";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1xhpq1h2rqhqx95rc20x3wxi5yhv4a62jr269b8dqyhp8r84ss9i";
  };
  features_.autocfg."0.1.4" = deps: f: updateFeatures f (rec {
    autocfg."0.1.4".default = (f.autocfg."0.1.4".default or true);
  }) [];


# end
# backtrace-0.3.26

  crates.backtrace."0.3.26" = deps: { features?(features_.backtrace."0.3.26" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.26";
    description = "A library to acquire a stack trace (backtrace) at runtime in a Rust program.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "0pcx0drg4jfmy2sxczwrwrw61gx6311cfrrnlz9ajzp388lzspm1";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.26"."cfg_if"}" deps)
      (crates."libc"."${deps."backtrace"."0.3.26"."libc"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.26"."rustc_demangle"}" deps)
    ]
      ++ (if features.backtrace."0.3.26".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.26".backtrace_sys}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.26"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.26" or {});
  };
  features_.backtrace."0.3.26" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.26".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.26"."addr2line" =
        (f.backtrace."0.3.26"."addr2line" or false) ||
        (f.backtrace."0.3.26".gimli-symbolize or false) ||
        (backtrace."0.3.26"."gimli-symbolize" or false); }
      { "0.3.26"."backtrace-sys" =
        (f.backtrace."0.3.26"."backtrace-sys" or false) ||
        (f.backtrace."0.3.26".libbacktrace or false) ||
        (backtrace."0.3.26"."libbacktrace" or false); }
      { "0.3.26"."coresymbolication" =
        (f.backtrace."0.3.26"."coresymbolication" or false) ||
        (f.backtrace."0.3.26".default or false) ||
        (backtrace."0.3.26"."default" or false); }
      { "0.3.26"."dbghelp" =
        (f.backtrace."0.3.26"."dbghelp" or false) ||
        (f.backtrace."0.3.26".default or false) ||
        (backtrace."0.3.26"."default" or false); }
      { "0.3.26"."dladdr" =
        (f.backtrace."0.3.26"."dladdr" or false) ||
        (f.backtrace."0.3.26".default or false) ||
        (backtrace."0.3.26"."default" or false); }
      { "0.3.26"."findshlibs" =
        (f.backtrace."0.3.26"."findshlibs" or false) ||
        (f.backtrace."0.3.26".gimli-symbolize or false) ||
        (backtrace."0.3.26"."gimli-symbolize" or false); }
      { "0.3.26"."libbacktrace" =
        (f.backtrace."0.3.26"."libbacktrace" or false) ||
        (f.backtrace."0.3.26".default or false) ||
        (backtrace."0.3.26"."default" or false); }
      { "0.3.26"."libunwind" =
        (f.backtrace."0.3.26"."libunwind" or false) ||
        (f.backtrace."0.3.26".default or false) ||
        (backtrace."0.3.26"."default" or false); }
      { "0.3.26"."memmap" =
        (f.backtrace."0.3.26"."memmap" or false) ||
        (f.backtrace."0.3.26".gimli-symbolize or false) ||
        (backtrace."0.3.26"."gimli-symbolize" or false); }
      { "0.3.26"."rustc-serialize" =
        (f.backtrace."0.3.26"."rustc-serialize" or false) ||
        (f.backtrace."0.3.26".serialize-rustc or false) ||
        (backtrace."0.3.26"."serialize-rustc" or false); }
      { "0.3.26"."serde" =
        (f.backtrace."0.3.26"."serde" or false) ||
        (f.backtrace."0.3.26".serialize-serde or false) ||
        (backtrace."0.3.26"."serialize-serde" or false); }
      { "0.3.26"."serde_derive" =
        (f.backtrace."0.3.26"."serde_derive" or false) ||
        (f.backtrace."0.3.26".serialize-serde or false) ||
        (backtrace."0.3.26"."serialize-serde" or false); }
      { "0.3.26"."std" =
        (f.backtrace."0.3.26"."std" or false) ||
        (f.backtrace."0.3.26".default or false) ||
        (backtrace."0.3.26"."default" or false); }
      { "0.3.26".default = (f.backtrace."0.3.26".default or true); }
    ];
    backtrace_sys."${deps.backtrace."0.3.26".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.26".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.26".libc}".default = (f.libc."${deps.backtrace."0.3.26".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.26".rustc_demangle}".default = true;
  }) [
    (features_.backtrace_sys."${deps."backtrace"."0.3.26"."backtrace_sys"}" deps)
    (features_.cfg_if."${deps."backtrace"."0.3.26"."cfg_if"}" deps)
    (features_.libc."${deps."backtrace"."0.3.26"."libc"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.26"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.26"."autocfg"}" deps)
  ];


# end
# backtrace-sys-0.1.28

  crates.backtrace_sys."0.1.28" = deps: { features?(features_.backtrace_sys."0.1.28" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.28";
    description = "Bindings to the libbacktrace gcc library\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1bbw8chs0wskxwzz7f3yy7mjqhyqj8lslq8pcjw1rbd2g23c34xl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
    ]);
  };
  features_.backtrace_sys."0.1.28" = deps: f: updateFeatures f (rec {
    backtrace_sys."0.1.28".default = (f.backtrace_sys."0.1.28".default or true);
    cc."${deps.backtrace_sys."0.1.28".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.28".libc}".default = (f.libc."${deps.backtrace_sys."0.1.28".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
  ];


# end
# bitflags-1.0.4

  crates.bitflags."1.0.4" = deps: { features?(features_.bitflags."1.0.4" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.4";
    description = "A macro to generate structures which behave like bitflags.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1g1wmz2001qmfrd37dnd5qiss5njrw26aywmg6yhkmkbyrhjxb08";
    features = mkFeatures (features."bitflags"."1.0.4" or {});
  };
  features_.bitflags."1.0.4" = deps: f: updateFeatures f (rec {
    bitflags."1.0.4".default = (f.bitflags."1.0.4".default or true);
  }) [];


# end
# byteorder-1.3.1

  crates.byteorder."1.3.1" = deps: { features?(features_.byteorder."1.3.1" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.1";
    description = "Library for reading/writing numbers in big-endian and little-endian.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1dd46l7fvmxfq90kh6ip1ghsxzzcdybac8f0mh2jivsdv9vy8k4w";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.1" or {});
  };
  features_.byteorder."1.3.1" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.1"."std" =
        (f.byteorder."1.3.1"."std" or false) ||
        (f.byteorder."1.3.1".default or false) ||
        (byteorder."1.3.1"."default" or false); }
      { "1.3.1".default = (f.byteorder."1.3.1".default or true); }
    ];
  }) [];


# end
# cc-1.0.37

  crates.cc."1.0.37" = deps: { features?(features_.cc."1.0.37" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.37";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1m5s357yi2amgd0kd8chxdcbnscyxwxifmf5hgv92x5xj56b3shj";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.37" or {});
  };
  features_.cc."1.0.37" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.37"."rayon" =
        (f.cc."1.0.37"."rayon" or false) ||
        (f.cc."1.0.37".parallel or false) ||
        (cc."1.0.37"."parallel" or false); }
      { "1.0.37".default = (f.cc."1.0.37".default or true); }
    ];
  }) [];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_.cfg_if."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_.cfg_if."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    description = "Low level interface to CloudABI. Contains all syscalls and related types.";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3"."bitflags" =
        (f.cloudabi."0.0.3"."bitflags" or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# crossbeam-deque-0.2.0

  crates.crossbeam_deque."0.2.0" = deps: { features?(features_.crossbeam_deque."0.2.0" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.2.0";
    description = "Concurrent work-stealing deque";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1h3n1p1qy45b6388j3svfy1m72xlcx9j9a5y0mww6jz8fmknipnb";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.2.0"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.2.0"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_deque."0.2.0" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.2.0".default = (f.crossbeam_deque."0.2.0".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.2.0".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.2.0".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_epoch."${deps."crossbeam_deque"."0.2.0"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_deque"."0.2.0"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-epoch-0.3.1

  crates.crossbeam_epoch."0.3.1" = deps: { features?(features_.crossbeam_epoch."0.3.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-epoch";
    version = "0.3.1";
    description = "Epoch-based garbage collection";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1ljrrpvalabi3r2nnpcz7rqkbl2ydmd0mrrr2fv335f7d46xgfxa";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."crossbeam_epoch"."0.3.1"."arrayvec"}" deps)
      (crates."cfg_if"."${deps."crossbeam_epoch"."0.3.1"."cfg_if"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_epoch"."0.3.1"."crossbeam_utils"}" deps)
      (crates."memoffset"."${deps."crossbeam_epoch"."0.3.1"."memoffset"}" deps)
      (crates."nodrop"."${deps."crossbeam_epoch"."0.3.1"."nodrop"}" deps)
      (crates."scopeguard"."${deps."crossbeam_epoch"."0.3.1"."scopeguard"}" deps)
    ]
      ++ (if features.crossbeam_epoch."0.3.1".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_epoch"."0.3.1".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_epoch"."0.3.1" or {});
  };
  features_.crossbeam_epoch."0.3.1" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.3.1".arrayvec}"."use_union" =
        (f.arrayvec."${deps.crossbeam_epoch."0.3.1".arrayvec}"."use_union" or false) ||
        (crossbeam_epoch."0.3.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.3.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.3.1".arrayvec}".default = (f.arrayvec."${deps.crossbeam_epoch."0.3.1".arrayvec}".default or false); }
    ];
    cfg_if."${deps.crossbeam_epoch."0.3.1".cfg_if}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "0.3.1"."lazy_static" =
        (f.crossbeam_epoch."0.3.1"."lazy_static" or false) ||
        (f.crossbeam_epoch."0.3.1".use_std or false) ||
        (crossbeam_epoch."0.3.1"."use_std" or false); }
      { "0.3.1"."use_std" =
        (f.crossbeam_epoch."0.3.1"."use_std" or false) ||
        (f.crossbeam_epoch."0.3.1".default or false) ||
        (crossbeam_epoch."0.3.1"."default" or false); }
      { "0.3.1".default = (f.crossbeam_epoch."0.3.1".default or true); }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.3.1".crossbeam_utils}"."use_std" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.3.1".crossbeam_utils}"."use_std" or false) ||
        (crossbeam_epoch."0.3.1"."use_std" or false) ||
        (f."crossbeam_epoch"."0.3.1"."use_std" or false); }
      { "${deps.crossbeam_epoch."0.3.1".crossbeam_utils}".default = (f.crossbeam_utils."${deps.crossbeam_epoch."0.3.1".crossbeam_utils}".default or false); }
    ];
    lazy_static."${deps.crossbeam_epoch."0.3.1".lazy_static}".default = true;
    memoffset."${deps.crossbeam_epoch."0.3.1".memoffset}".default = true;
    nodrop."${deps.crossbeam_epoch."0.3.1".nodrop}".default = (f.nodrop."${deps.crossbeam_epoch."0.3.1".nodrop}".default or false);
    scopeguard."${deps.crossbeam_epoch."0.3.1".scopeguard}".default = (f.scopeguard."${deps.crossbeam_epoch."0.3.1".scopeguard}".default or false);
  }) [
    (features_.arrayvec."${deps."crossbeam_epoch"."0.3.1"."arrayvec"}" deps)
    (features_.cfg_if."${deps."crossbeam_epoch"."0.3.1"."cfg_if"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_epoch"."0.3.1"."crossbeam_utils"}" deps)
    (features_.lazy_static."${deps."crossbeam_epoch"."0.3.1"."lazy_static"}" deps)
    (features_.memoffset."${deps."crossbeam_epoch"."0.3.1"."memoffset"}" deps)
    (features_.nodrop."${deps."crossbeam_epoch"."0.3.1"."nodrop"}" deps)
    (features_.scopeguard."${deps."crossbeam_epoch"."0.3.1"."scopeguard"}" deps)
  ];


# end
# crossbeam-utils-0.2.2

  crates.crossbeam_utils."0.2.2" = deps: { features?(features_.crossbeam_utils."0.2.2" deps {}) }: buildRustCrate {
    crateName = "crossbeam-utils";
    version = "0.2.2";
    description = "Utilities for concurrent programming";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "0jiwzxv0lysjq68yk4bzkygrf69zhdidyw55nxlmimxlm6xv0j4m";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam_utils"."0.2.2"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."crossbeam_utils"."0.2.2" or {});
  };
  features_.crossbeam_utils."0.2.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam_utils."0.2.2".cfg_if}".default = true;
    crossbeam_utils = fold recursiveUpdate {} [
      { "0.2.2"."use_std" =
        (f.crossbeam_utils."0.2.2"."use_std" or false) ||
        (f.crossbeam_utils."0.2.2".default or false) ||
        (crossbeam_utils."0.2.2"."default" or false); }
      { "0.2.2".default = (f.crossbeam_utils."0.2.2".default or true); }
    ];
  }) [
    (features_.cfg_if."${deps."crossbeam_utils"."0.2.2"."cfg_if"}" deps)
  ];


# end
# ctor-0.1.9

  crates.ctor."0.1.9" = deps: { features?(features_.ctor."0.1.9" deps {}) }: buildRustCrate {
    crateName = "ctor";
    version = "0.1.9";
    description = "__attribute__((constructor)) for Rust";
    authors = [ "Matt Mastracci <matthew@mastracci.com>" ];
    edition = "2018";
    sha256 = "1028s4rx1s1zx291ahfba6gvb85phvhldg27fvcpqxm1qwp3jqc0";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."quote"."${deps."ctor"."0.1.9"."quote"}" deps)
      (crates."syn"."${deps."ctor"."0.1.9"."syn"}" deps)
    ]);
  };
  features_.ctor."0.1.9" = deps: f: updateFeatures f (rec {
    ctor."0.1.9".default = (f.ctor."0.1.9".default or true);
    quote."${deps.ctor."0.1.9".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.ctor."0.1.9".syn}"."fold" = true; }
      { "${deps.ctor."0.1.9".syn}"."full" = true; }
      { "${deps.ctor."0.1.9".syn}"."parsing" = true; }
      { "${deps.ctor."0.1.9".syn}"."printing" = true; }
      { "${deps.ctor."0.1.9".syn}"."proc-macro" = true; }
      { "${deps.ctor."0.1.9".syn}".default = (f.syn."${deps.ctor."0.1.9".syn}".default or false); }
    ];
  }) [
    (features_.quote."${deps."ctor"."0.1.9"."quote"}" deps)
    (features_.syn."${deps."ctor"."0.1.9"."syn"}" deps)
  ];


# end
# either-1.5.2

  crates.either."1.5.2" = deps: { features?(features_.either."1.5.2" deps {}) }: buildRustCrate {
    crateName = "either";
    version = "1.5.2";
    description = "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.\n";
    authors = [ "bluss" ];
    sha256 = "1zqq1057c51f53ga4p9l4dd8ax6md27h1xjrjp2plkvml5iymks5";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."either"."1.5.2" or {});
  };
  features_.either."1.5.2" = deps: f: updateFeatures f (rec {
    either = fold recursiveUpdate {} [
      { "1.5.2"."use_std" =
        (f.either."1.5.2"."use_std" or false) ||
        (f.either."1.5.2".default or false) ||
        (either."1.5.2"."default" or false); }
      { "1.5.2".default = (f.either."1.5.2".default or true); }
    ];
  }) [];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    description = "Experimental error handling abstraction.";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5"."backtrace" =
        (f.failure."0.1.5"."backtrace" or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5"."derive" =
        (f.failure."0.1.5"."derive" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5"."failure_derive" =
        (f.failure."0.1.5"."failure_derive" or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5"."std" =
        (f.failure."0.1.5"."std" or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
    ];
    failure_derive."${deps.failure."0.1.5".failure_derive}".default = true;
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
    (features_.failure_derive."${deps."failure"."0.1.5"."failure_derive"}" deps)
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_.failure_derive."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    description = "derives for the failure crate";
    authors = [ "Without Boats <woboats@gmail.com>" ];
    sha256 = "1wzk484b87r4qszcvdl2bkniv5ls4r2f2dshz7hmgiv6z4ln12g0";
    procMacro = true;
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
      (crates."quote"."${deps."failure_derive"."0.1.5"."quote"}" deps)
      (crates."syn"."${deps."failure_derive"."0.1.5"."syn"}" deps)
      (crates."synstructure"."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
    ]);
    features = mkFeatures (features."failure_derive"."0.1.5" or {});
  };
  features_.failure_derive."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2"}" deps)
    (features_.quote."${deps."failure_derive"."0.1.5"."quote"}" deps)
    (features_.syn."${deps."failure_derive"."0.1.5"."syn"}" deps)
    (features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure"}" deps)
  ];


# end
# finalfusion-0.6.0

  crates.finalfusion."0.6.0" = deps: { features?(features_.finalfusion."0.6.0" deps {}) }: buildRustCrate {
    crateName = "finalfusion";
    version = "0.6.0";
    description = "Reader and writer for common word embedding formats";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "03aclmpxwpvb57g5b5nibc9fravcqvmw17qfhjf3r79pyh62vh8w";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."finalfusion"."0.6.0"."byteorder"}" deps)
      (crates."failure"."${deps."finalfusion"."0.6.0"."failure"}" deps)
      (crates."fnv"."${deps."finalfusion"."0.6.0"."fnv"}" deps)
      (crates."itertools"."${deps."finalfusion"."0.6.0"."itertools"}" deps)
      (crates."memmap"."${deps."finalfusion"."0.6.0"."memmap"}" deps)
      (crates."ndarray"."${deps."finalfusion"."0.6.0"."ndarray"}" deps)
      (crates."ordered_float"."${deps."finalfusion"."0.6.0"."ordered_float"}" deps)
      (crates."rand"."${deps."finalfusion"."0.6.0"."rand"}" deps)
      (crates."rand_xorshift"."${deps."finalfusion"."0.6.0"."rand_xorshift"}" deps)
      (crates."reductive"."${deps."finalfusion"."0.6.0"."reductive"}" deps)
      (crates."toml"."${deps."finalfusion"."0.6.0"."toml"}" deps)
    ]);
  };
  features_.finalfusion."0.6.0" = deps: f: updateFeatures f (rec {
    byteorder."${deps.finalfusion."0.6.0".byteorder}".default = true;
    failure."${deps.finalfusion."0.6.0".failure}".default = true;
    finalfusion."0.6.0".default = (f.finalfusion."0.6.0".default or true);
    fnv."${deps.finalfusion."0.6.0".fnv}".default = true;
    itertools."${deps.finalfusion."0.6.0".itertools}".default = true;
    memmap."${deps.finalfusion."0.6.0".memmap}".default = true;
    ndarray."${deps.finalfusion."0.6.0".ndarray}".default = true;
    ordered_float."${deps.finalfusion."0.6.0".ordered_float}".default = true;
    rand."${deps.finalfusion."0.6.0".rand}".default = true;
    rand_xorshift."${deps.finalfusion."0.6.0".rand_xorshift}".default = true;
    reductive."${deps.finalfusion."0.6.0".reductive}".default = true;
    toml."${deps.finalfusion."0.6.0".toml}".default = true;
  }) [
    (features_.byteorder."${deps."finalfusion"."0.6.0"."byteorder"}" deps)
    (features_.failure."${deps."finalfusion"."0.6.0"."failure"}" deps)
    (features_.fnv."${deps."finalfusion"."0.6.0"."fnv"}" deps)
    (features_.itertools."${deps."finalfusion"."0.6.0"."itertools"}" deps)
    (features_.memmap."${deps."finalfusion"."0.6.0"."memmap"}" deps)
    (features_.ndarray."${deps."finalfusion"."0.6.0"."ndarray"}" deps)
    (features_.ordered_float."${deps."finalfusion"."0.6.0"."ordered_float"}" deps)
    (features_.rand."${deps."finalfusion"."0.6.0"."rand"}" deps)
    (features_.rand_xorshift."${deps."finalfusion"."0.6.0"."rand_xorshift"}" deps)
    (features_.reductive."${deps."finalfusion"."0.6.0"."reductive"}" deps)
    (features_.toml."${deps."finalfusion"."0.6.0"."toml"}" deps)
  ];


# end
# fnv-1.0.6

  crates.fnv."1.0.6" = deps: { features?(features_.fnv."1.0.6" deps {}) }: buildRustCrate {
    crateName = "fnv";
    version = "1.0.6";
    description = "Fowler–Noll–Vo hash function";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "128mlh23y3gg6ag5h8iiqlcbl59smisdzraqy88ldrf75kbw27ip";
    libPath = "lib.rs";
  };
  features_.fnv."1.0.6" = deps: f: updateFeatures f (rec {
    fnv."1.0.6".default = (f.fnv."1.0.6".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    description = "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# ghost-0.1.0

  crates.ghost."0.1.0" = deps: { features?(features_.ghost."0.1.0" deps {}) }: buildRustCrate {
    crateName = "ghost";
    version = "0.1.0";
    description = "Define your own PhantomData";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    edition = "2018";
    sha256 = "03kpnfk7xlkjv18mfvqdprhlq625lfri6l163lhrfma7j9c7i730";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."ghost"."0.1.0"."proc_macro2"}" deps)
      (crates."quote"."${deps."ghost"."0.1.0"."quote"}" deps)
      (crates."syn"."${deps."ghost"."0.1.0"."syn"}" deps)
    ]);
  };
  features_.ghost."0.1.0" = deps: f: updateFeatures f (rec {
    ghost."0.1.0".default = (f.ghost."0.1.0".default or true);
    proc_macro2."${deps.ghost."0.1.0".proc_macro2}".default = true;
    quote."${deps.ghost."0.1.0".quote}".default = true;
    syn."${deps.ghost."0.1.0".syn}".default = true;
  }) [
    (features_.proc_macro2."${deps."ghost"."0.1.0"."proc_macro2"}" deps)
    (features_.quote."${deps."ghost"."0.1.0"."quote"}" deps)
    (features_.syn."${deps."ghost"."0.1.0"."syn"}" deps)
  ];


# end
# inventory-0.1.3

  crates.inventory."0.1.3" = deps: { features?(features_.inventory."0.1.3" deps {}) }: buildRustCrate {
    crateName = "inventory";
    version = "0.1.3";
    description = "Typed distributed plugin registration";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    edition = "2018";
    sha256 = "011lvdwgcn4jlkcdq1b3spjg9yx3fi6fqmnmv44mqpjni4vqbsg9";
    dependencies = mapFeatures features ([
      (crates."ctor"."${deps."inventory"."0.1.3"."ctor"}" deps)
      (crates."ghost"."${deps."inventory"."0.1.3"."ghost"}" deps)
      (crates."inventory_impl"."${deps."inventory"."0.1.3"."inventory_impl"}" deps)
    ]);
  };
  features_.inventory."0.1.3" = deps: f: updateFeatures f (rec {
    ctor."${deps.inventory."0.1.3".ctor}".default = true;
    ghost."${deps.inventory."0.1.3".ghost}".default = true;
    inventory."0.1.3".default = (f.inventory."0.1.3".default or true);
    inventory_impl."${deps.inventory."0.1.3".inventory_impl}".default = true;
  }) [
    (features_.ctor."${deps."inventory"."0.1.3"."ctor"}" deps)
    (features_.ghost."${deps."inventory"."0.1.3"."ghost"}" deps)
    (features_.inventory_impl."${deps."inventory"."0.1.3"."inventory_impl"}" deps)
  ];


# end
# inventory-impl-0.1.3

  crates.inventory_impl."0.1.3" = deps: { features?(features_.inventory_impl."0.1.3" deps {}) }: buildRustCrate {
    crateName = "inventory-impl";
    version = "0.1.3";
    description = "Implementation of macros for the `inventory` crate";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    edition = "2018";
    sha256 = "03895n64bh0ihs1m0m7l4nqmfb9dc487grp7x92plwq61ywf3v55";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."inventory_impl"."0.1.3"."proc_macro2"}" deps)
      (crates."quote"."${deps."inventory_impl"."0.1.3"."quote"}" deps)
      (crates."syn"."${deps."inventory_impl"."0.1.3"."syn"}" deps)
    ]);
  };
  features_.inventory_impl."0.1.3" = deps: f: updateFeatures f (rec {
    inventory_impl."0.1.3".default = (f.inventory_impl."0.1.3".default or true);
    proc_macro2."${deps.inventory_impl."0.1.3".proc_macro2}".default = true;
    quote."${deps.inventory_impl."0.1.3".quote}".default = true;
    syn."${deps.inventory_impl."0.1.3".syn}".default = true;
  }) [
    (features_.proc_macro2."${deps."inventory_impl"."0.1.3"."proc_macro2"}" deps)
    (features_.quote."${deps."inventory_impl"."0.1.3"."quote"}" deps)
    (features_.syn."${deps."inventory_impl"."0.1.3"."syn"}" deps)
  ];


# end
# itertools-0.7.11

  crates.itertools."0.7.11" = deps: { features?(features_.itertools."0.7.11" deps {}) }: buildRustCrate {
    crateName = "itertools";
    version = "0.7.11";
    description = "Extra iterator adaptors, iterator methods, free functions, and macros.";
    authors = [ "bluss" ];
    sha256 = "0gavmkvn2c3cwfwk5zl5p7saiqn4ww227am5ykn6pgfm7c6ppz56";
    dependencies = mapFeatures features ([
      (crates."either"."${deps."itertools"."0.7.11"."either"}" deps)
    ]);
    features = mkFeatures (features."itertools"."0.7.11" or {});
  };
  features_.itertools."0.7.11" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.7.11".either}".default = (f.either."${deps.itertools."0.7.11".either}".default or false);
    itertools = fold recursiveUpdate {} [
      { "0.7.11"."use_std" =
        (f.itertools."0.7.11"."use_std" or false) ||
        (f.itertools."0.7.11".default or false) ||
        (itertools."0.7.11"."default" or false); }
      { "0.7.11".default = (f.itertools."0.7.11".default or true); }
    ];
  }) [
    (features_.either."${deps."itertools"."0.7.11"."either"}" deps)
  ];


# end
# itertools-0.8.0

  crates.itertools."0.8.0" = deps: { features?(features_.itertools."0.8.0" deps {}) }: buildRustCrate {
    crateName = "itertools";
    version = "0.8.0";
    description = "Extra iterator adaptors, iterator methods, free functions, and macros.";
    authors = [ "bluss" ];
    sha256 = "0xpz59yf03vyj540i7sqypn2aqfid08c4vzyg0l6rqm08da77n7n";
    dependencies = mapFeatures features ([
      (crates."either"."${deps."itertools"."0.8.0"."either"}" deps)
    ]);
    features = mkFeatures (features."itertools"."0.8.0" or {});
  };
  features_.itertools."0.8.0" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.8.0".either}".default = (f.either."${deps.itertools."0.8.0".either}".default or false);
    itertools = fold recursiveUpdate {} [
      { "0.8.0"."use_std" =
        (f.itertools."0.8.0"."use_std" or false) ||
        (f.itertools."0.8.0".default or false) ||
        (itertools."0.8.0"."default" or false); }
      { "0.8.0".default = (f.itertools."0.8.0".default or true); }
    ];
  }) [
    (features_.either."${deps."itertools"."0.8.0"."either"}" deps)
  ];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0"."spin" =
        (f.lazy_static."1.3.0"."spin" or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
    ];
  }) [];


# end
# libc-0.2.55

  crates.libc."0.2.55" = deps: { features?(features_.libc."0.2.55" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.55";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1i3a7q8xpqlxfsyb421warvjwi8lvsxdcx2hzvd12qaxfpkbj3p5";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.55" or {});
  };
  features_.libc."0.2.55" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.55"."align" =
        (f.libc."0.2.55"."align" or false) ||
        (f.libc."0.2.55".rustc-dep-of-std or false) ||
        (libc."0.2.55"."rustc-dep-of-std" or false); }
      { "0.2.55"."rustc-std-workspace-core" =
        (f.libc."0.2.55"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.55".rustc-dep-of-std or false) ||
        (libc."0.2.55"."rustc-dep-of-std" or false); }
      { "0.2.55"."use_std" =
        (f.libc."0.2.55"."use_std" or false) ||
        (f.libc."0.2.55".default or false) ||
        (libc."0.2.55"."default" or false); }
      { "0.2.55".default = (f.libc."0.2.55".default or true); }
    ];
  }) [];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    description = "A lightweight logging facade for Rust\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# mashup-0.1.9

  crates.mashup."0.1.9" = deps: { features?(features_.mashup."0.1.9" deps {}) }: buildRustCrate {
    crateName = "mashup";
    version = "0.1.9";
    description = "Concatenate identifiers in a macro invocation";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "17skgsfbzppxhzkb4y68jdd7d62df05fx3g3iij8rlz3xmwdibb1";
    dependencies = mapFeatures features ([
      (crates."mashup_impl"."${deps."mashup"."0.1.9"."mashup_impl"}" deps)
      (crates."proc_macro_hack"."${deps."mashup"."0.1.9"."proc_macro_hack"}" deps)
    ]);
  };
  features_.mashup."0.1.9" = deps: f: updateFeatures f (rec {
    mashup."0.1.9".default = (f.mashup."0.1.9".default or true);
    mashup_impl."${deps.mashup."0.1.9".mashup_impl}".default = true;
    proc_macro_hack."${deps.mashup."0.1.9".proc_macro_hack}".default = true;
  }) [
    (features_.mashup_impl."${deps."mashup"."0.1.9"."mashup_impl"}" deps)
    (features_.proc_macro_hack."${deps."mashup"."0.1.9"."proc_macro_hack"}" deps)
  ];


# end
# mashup-impl-0.1.9

  crates.mashup_impl."0.1.9" = deps: { features?(features_.mashup_impl."0.1.9" deps {}) }: buildRustCrate {
    crateName = "mashup-impl";
    version = "0.1.9";
    description = "Concatenate identifiers in a macro invocation";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "00inqg6rpm733pnqbl0inhcl1zrbbl7r9ggxij4cr1c2g8k6c5dw";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro_hack"."${deps."mashup_impl"."0.1.9"."proc_macro_hack"}" deps)
      (crates."proc_macro2"."${deps."mashup_impl"."0.1.9"."proc_macro2"}" deps)
    ]);
  };
  features_.mashup_impl."0.1.9" = deps: f: updateFeatures f (rec {
    mashup_impl."0.1.9".default = (f.mashup_impl."0.1.9".default or true);
    proc_macro2."${deps.mashup_impl."0.1.9".proc_macro2}".default = true;
    proc_macro_hack."${deps.mashup_impl."0.1.9".proc_macro_hack}".default = true;
  }) [
    (features_.proc_macro_hack."${deps."mashup_impl"."0.1.9"."proc_macro_hack"}" deps)
    (features_.proc_macro2."${deps."mashup_impl"."0.1.9"."proc_macro2"}" deps)
  ];


# end
# matrixmultiply-0.1.15

  crates.matrixmultiply."0.1.15" = deps: { features?(features_.matrixmultiply."0.1.15" deps {}) }: buildRustCrate {
    crateName = "matrixmultiply";
    version = "0.1.15";
    description = "General matrix multiplication of f32 and f64 matrices in Rust. Supports matrices with general strides. Uses a microkernel strategy, so that the implementation is easy to parallelize and optimize. `RUSTFLAGS=\"-C target-cpu=native\"` is your friend here.";
    authors = [ "bluss" ];
    sha256 = "0ix1i4lnkfqnzv8f9wr34bf0mlr1sx5hr7yr70k4npxmwxscvdj5";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rawpointer"."${deps."matrixmultiply"."0.1.15"."rawpointer"}" deps)
    ]);
  };
  features_.matrixmultiply."0.1.15" = deps: f: updateFeatures f (rec {
    matrixmultiply."0.1.15".default = (f.matrixmultiply."0.1.15".default or true);
    rawpointer."${deps.matrixmultiply."0.1.15".rawpointer}".default = true;
  }) [
    (features_.rawpointer."${deps."matrixmultiply"."0.1.15"."rawpointer"}" deps)
  ];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    description = "Safe interface to memchr.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0"."use_std" =
        (f.memchr."2.2.0"."use_std" or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
    ];
  }) [];


# end
# memmap-0.7.0

  crates.memmap."0.7.0" = deps: { features?(features_.memmap."0.7.0" deps {}) }: buildRustCrate {
    crateName = "memmap";
    version = "0.7.0";
    description = "Cross-platform Rust API for memory-mapped file IO";
    authors = [ "Dan Burkert <dan@danburkert.com>" ];
    sha256 = "1j1rz5p4vh3i5p6rxy620wypj36xc7qarw6dj3353ym67zfaml18";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."memmap"."0.7.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."memmap"."0.7.0"."winapi"}" deps)
    ]) else []);
  };
  features_.memmap."0.7.0" = deps: f: updateFeatures f (rec {
    libc."${deps.memmap."0.7.0".libc}".default = true;
    memmap."0.7.0".default = (f.memmap."0.7.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.memmap."0.7.0".winapi}"."basetsd" = true; }
      { "${deps.memmap."0.7.0".winapi}"."handleapi" = true; }
      { "${deps.memmap."0.7.0".winapi}"."memoryapi" = true; }
      { "${deps.memmap."0.7.0".winapi}"."minwindef" = true; }
      { "${deps.memmap."0.7.0".winapi}"."std" = true; }
      { "${deps.memmap."0.7.0".winapi}"."sysinfoapi" = true; }
      { "${deps.memmap."0.7.0".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."memmap"."0.7.0"."libc"}" deps)
    (features_.winapi."${deps."memmap"."0.7.0"."winapi"}" deps)
  ];


# end
# memoffset-0.2.1

  crates.memoffset."0.2.1" = deps: { features?(features_.memoffset."0.2.1" deps {}) }: buildRustCrate {
    crateName = "memoffset";
    version = "0.2.1";
    description = "offset_of functionality for Rust structs.";
    authors = [ "Gilad Naaman <gilad.naaman@gmail.com>" ];
    sha256 = "00vym01jk9slibq2nsiilgffp7n6k52a4q3n4dqp0xf5kzxvffcf";
  };
  features_.memoffset."0.2.1" = deps: f: updateFeatures f (rec {
    memoffset."0.2.1".default = (f.memoffset."0.2.1".default or true);
  }) [];


# end
# ndarray-0.12.1

  crates.ndarray."0.12.1" = deps: { features?(features_.ndarray."0.12.1" deps {}) }: buildRustCrate {
    crateName = "ndarray";
    version = "0.12.1";
    description = "An n-dimensional array for general elements and for numerics. Lightweight array views and slicing; views support chunking and splitting.";
    authors = [ "bluss" "Jim Turner" ];
    sha256 = "13708k97kdjfj6g4z1yapjln0v4m7zj0114h8snw44fj79l00346";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."itertools"."${deps."ndarray"."0.12.1"."itertools"}" deps)
      (crates."matrixmultiply"."${deps."ndarray"."0.12.1"."matrixmultiply"}" deps)
      (crates."num_complex"."${deps."ndarray"."0.12.1"."num_complex"}" deps)
      (crates."num_traits"."${deps."ndarray"."0.12.1"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."ndarray"."0.12.1" or {});
  };
  features_.ndarray."0.12.1" = deps: f: updateFeatures f (rec {
    itertools."${deps.ndarray."0.12.1".itertools}".default = (f.itertools."${deps.ndarray."0.12.1".itertools}".default or false);
    matrixmultiply."${deps.ndarray."0.12.1".matrixmultiply}".default = true;
    ndarray = fold recursiveUpdate {} [
      { "0.12.1"."blas" =
        (f.ndarray."0.12.1"."blas" or false) ||
        (f.ndarray."0.12.1".test-blas-openblas-sys or false) ||
        (ndarray."0.12.1"."test-blas-openblas-sys" or false); }
      { "0.12.1"."blas-src" =
        (f.ndarray."0.12.1"."blas-src" or false) ||
        (f.ndarray."0.12.1".blas or false) ||
        (ndarray."0.12.1"."blas" or false); }
      { "0.12.1"."cblas-sys" =
        (f.ndarray."0.12.1"."cblas-sys" or false) ||
        (f.ndarray."0.12.1".blas or false) ||
        (ndarray."0.12.1"."blas" or false); }
      { "0.12.1"."rustc-serialize" =
        (f.ndarray."0.12.1"."rustc-serialize" or false) ||
        (f.ndarray."0.12.1".docs or false) ||
        (ndarray."0.12.1"."docs" or false); }
      { "0.12.1"."serde" =
        (f.ndarray."0.12.1"."serde" or false) ||
        (f.ndarray."0.12.1".serde-1 or false) ||
        (ndarray."0.12.1"."serde-1" or false); }
      { "0.12.1"."serde-1" =
        (f.ndarray."0.12.1"."serde-1" or false) ||
        (f.ndarray."0.12.1".docs or false) ||
        (ndarray."0.12.1"."docs" or false); }
      { "0.12.1"."test-blas-openblas-sys" =
        (f.ndarray."0.12.1"."test-blas-openblas-sys" or false) ||
        (f.ndarray."0.12.1".test or false) ||
        (ndarray."0.12.1"."test" or false); }
      { "0.12.1".default = (f.ndarray."0.12.1".default or true); }
    ];
    num_complex."${deps.ndarray."0.12.1".num_complex}".default = true;
    num_traits."${deps.ndarray."0.12.1".num_traits}".default = true;
  }) [
    (features_.itertools."${deps."ndarray"."0.12.1"."itertools"}" deps)
    (features_.matrixmultiply."${deps."ndarray"."0.12.1"."matrixmultiply"}" deps)
    (features_.num_complex."${deps."ndarray"."0.12.1"."num_complex"}" deps)
    (features_.num_traits."${deps."ndarray"."0.12.1"."num_traits"}" deps)
  ];


# end
# ndarray-parallel-0.9.0

  crates.ndarray_parallel."0.9.0" = deps: { features?(features_.ndarray_parallel."0.9.0" deps {}) }: buildRustCrate {
    crateName = "ndarray-parallel";
    version = "0.9.0";
    description = "Parallelization for ndarray (using rayon).";
    authors = [ "bluss" ];
    sha256 = "1y3hyiry8jrk5i1wd7a95r9s3x2shmlv8wrbhnfkbrg8h5h39p17";
    dependencies = mapFeatures features ([
      (crates."ndarray"."${deps."ndarray_parallel"."0.9.0"."ndarray"}" deps)
      (crates."rayon"."${deps."ndarray_parallel"."0.9.0"."rayon"}" deps)
    ]);
  };
  features_.ndarray_parallel."0.9.0" = deps: f: updateFeatures f (rec {
    ndarray."${deps.ndarray_parallel."0.9.0".ndarray}".default = true;
    ndarray_parallel."0.9.0".default = (f.ndarray_parallel."0.9.0".default or true);
    rayon."${deps.ndarray_parallel."0.9.0".rayon}".default = true;
  }) [
    (features_.ndarray."${deps."ndarray_parallel"."0.9.0"."ndarray"}" deps)
    (features_.rayon."${deps."ndarray_parallel"."0.9.0"."rayon"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    description = "A wrapper type to inhibit drop (destructor). Use std::mem::ManuallyDrop instead!";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13"."nodrop-union" =
        (f.nodrop."0.1.13"."nodrop-union" or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13"."std" =
        (f.nodrop."0.1.13"."std" or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
    ];
  }) [];


# end
# num-complex-0.2.1

  crates.num_complex."0.2.1" = deps: { features?(features_.num_complex."0.2.1" deps {}) }: buildRustCrate {
    crateName = "num-complex";
    version = "0.2.1";
    description = "Complex numbers implementation for Rust";
    authors = [ "The Rust Project Developers" ];
    sha256 = "12lpp62ahc80p33cpw2771l8bwl0q13rl5vq0jzkqib1l5z8q80z";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_complex"."0.2.1"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."num_complex"."0.2.1" or {});
  };
  features_.num_complex."0.2.1" = deps: f: updateFeatures f (rec {
    num_complex = fold recursiveUpdate {} [
      { "0.2.1"."std" =
        (f.num_complex."0.2.1"."std" or false) ||
        (f.num_complex."0.2.1".default or false) ||
        (num_complex."0.2.1"."default" or false); }
      { "0.2.1".default = (f.num_complex."0.2.1".default or true); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_complex."0.2.1".num_traits}"."i128" =
        (f.num_traits."${deps.num_complex."0.2.1".num_traits}"."i128" or false) ||
        (num_complex."0.2.1"."i128" or false) ||
        (f."num_complex"."0.2.1"."i128" or false); }
      { "${deps.num_complex."0.2.1".num_traits}"."std" =
        (f.num_traits."${deps.num_complex."0.2.1".num_traits}"."std" or false) ||
        (num_complex."0.2.1"."std" or false) ||
        (f."num_complex"."0.2.1"."std" or false); }
      { "${deps.num_complex."0.2.1".num_traits}".default = (f.num_traits."${deps.num_complex."0.2.1".num_traits}".default or false); }
    ];
  }) [
    (features_.num_traits."${deps."num_complex"."0.2.1"."num_traits"}" deps)
  ];


# end
# num-traits-0.2.8

  crates.num_traits."0.2.8" = deps: { features?(features_.num_traits."0.2.8" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.8";
    description = "Numeric traits for generic mathematics";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1mnlmy35n734n9xlq0qkfbgzz33x09a1s4rfj30p1976p09b862v";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_traits"."0.2.8"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_traits"."0.2.8" or {});
  };
  features_.num_traits."0.2.8" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_traits."0.2.8".autocfg}".default = true;
    num_traits = fold recursiveUpdate {} [
      { "0.2.8"."std" =
        (f.num_traits."0.2.8"."std" or false) ||
        (f.num_traits."0.2.8".default or false) ||
        (num_traits."0.2.8"."default" or false); }
      { "0.2.8".default = (f.num_traits."0.2.8".default or true); }
    ];
  }) [
    (features_.autocfg."${deps."num_traits"."0.2.8"."autocfg"}" deps)
  ];


# end
# num_cpus-1.10.0

  crates.num_cpus."1.10.0" = deps: { features?(features_.num_cpus."1.10.0" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.0";
    description = "Get the number of CPUs on a machine.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1411jyxy1wd8d59mv7cf6ynkvvar92czmwhb9l2c1brdkxbbiqn7";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.0"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.0" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.0".libc}".default = true;
    num_cpus."1.10.0".default = (f.num_cpus."1.10.0".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.0"."libc"}" deps)
  ];


# end
# numpy-0.5.0

  crates.numpy."0.5.0" = deps: { features?(features_.numpy."0.5.0" deps {}) }: buildRustCrate {
    crateName = "numpy";
    version = "0.5.0";
    description = "Rust binding of NumPy C-API";
    authors = [ "Toshiki Teramura <toshiki.teramura@gmail.com>" "Yuji Kanagawa <yuji.kngw.80s.revive@gmail.com>" ];
    sha256 = "04308nr6vmd3ayvfy42r6is3hr4j8wsfcmmng15l1c88z062dp85";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."numpy"."0.5.0"."cfg_if"}" deps)
      (crates."libc"."${deps."numpy"."0.5.0"."libc"}" deps)
      (crates."ndarray"."${deps."numpy"."0.5.0"."ndarray"}" deps)
      (crates."num_complex"."${deps."numpy"."0.5.0"."num_complex"}" deps)
      (crates."num_traits"."${deps."numpy"."0.5.0"."num_traits"}" deps)
      (crates."pyo3"."${deps."numpy"."0.5.0"."pyo3"}" deps)
    ]);
    features = mkFeatures (features."numpy"."0.5.0" or {});
  };
  features_.numpy."0.5.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.numpy."0.5.0".cfg_if}".default = true;
    libc."${deps.numpy."0.5.0".libc}".default = true;
    ndarray."${deps.numpy."0.5.0".ndarray}".default = true;
    num_complex."${deps.numpy."0.5.0".num_complex}".default = true;
    num_traits."${deps.numpy."0.5.0".num_traits}".default = true;
    numpy."0.5.0".default = (f.numpy."0.5.0".default or true);
    pyo3 = fold recursiveUpdate {} [
      { "${deps.numpy."0.5.0".pyo3}"."python2" =
        (f.pyo3."${deps.numpy."0.5.0".pyo3}"."python2" or false) ||
        (numpy."0.5.0"."python2" or false) ||
        (f."numpy"."0.5.0"."python2" or false); }
      { "${deps.numpy."0.5.0".pyo3}"."python3" =
        (f.pyo3."${deps.numpy."0.5.0".pyo3}"."python3" or false) ||
        (numpy."0.5.0"."python3" or false) ||
        (f."numpy"."0.5.0"."python3" or false); }
      { "${deps.numpy."0.5.0".pyo3}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."numpy"."0.5.0"."cfg_if"}" deps)
    (features_.libc."${deps."numpy"."0.5.0"."libc"}" deps)
    (features_.ndarray."${deps."numpy"."0.5.0"."ndarray"}" deps)
    (features_.num_complex."${deps."numpy"."0.5.0"."num_complex"}" deps)
    (features_.num_traits."${deps."numpy"."0.5.0"."num_traits"}" deps)
    (features_.pyo3."${deps."numpy"."0.5.0"."pyo3"}" deps)
  ];


# end
# ordered-float-1.0.2

  crates.ordered_float."1.0.2" = deps: { features?(features_.ordered_float."1.0.2" deps {}) }: buildRustCrate {
    crateName = "ordered-float";
    version = "1.0.2";
    description = "Wrappers for total ordering on floats";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" "Matt Brubeck <mbrubeck@limpet.net>" ];
    sha256 = "1bwjh1gkh2n6zqb2q1a04gkskgz3hxbj3w7fvhx6yd7l0nbmbd1b";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."ordered_float"."1.0.2"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."ordered_float"."1.0.2" or {});
  };
  features_.ordered_float."1.0.2" = deps: f: updateFeatures f (rec {
    num_traits = fold recursiveUpdate {} [
      { "${deps.ordered_float."1.0.2".num_traits}"."std" =
        (f.num_traits."${deps.ordered_float."1.0.2".num_traits}"."std" or false) ||
        (ordered_float."1.0.2"."std" or false) ||
        (f."ordered_float"."1.0.2"."std" or false); }
      { "${deps.ordered_float."1.0.2".num_traits}".default = (f.num_traits."${deps.ordered_float."1.0.2".num_traits}".default or false); }
    ];
    ordered_float = fold recursiveUpdate {} [
      { "1.0.2"."std" =
        (f.ordered_float."1.0.2"."std" or false) ||
        (f.ordered_float."1.0.2".default or false) ||
        (ordered_float."1.0.2"."default" or false); }
      { "1.0.2".default = (f.ordered_float."1.0.2".default or true); }
    ];
  }) [
    (features_.num_traits."${deps."ordered_float"."1.0.2"."num_traits"}" deps)
  ];


# end
# proc-macro-hack-0.4.1

  crates.proc_macro_hack."0.4.1" = deps: { features?(features_.proc_macro_hack."0.4.1" deps {}) }: buildRustCrate {
    crateName = "proc-macro-hack";
    version = "0.4.1";
    description = "Procedural functionlike!() macros using only Macros 1.1";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0hh98fg9nmmaby4jq38jn4gndikyjbppvpqys1ms918aijayn5s0";
    dependencies = mapFeatures features ([
      (crates."proc_macro_hack_impl"."${deps."proc_macro_hack"."0.4.1"."proc_macro_hack_impl"}" deps)
    ]);
  };
  features_.proc_macro_hack."0.4.1" = deps: f: updateFeatures f (rec {
    proc_macro_hack."0.4.1".default = (f.proc_macro_hack."0.4.1".default or true);
    proc_macro_hack_impl."${deps.proc_macro_hack."0.4.1".proc_macro_hack_impl}".default = true;
  }) [
    (features_.proc_macro_hack_impl."${deps."proc_macro_hack"."0.4.1"."proc_macro_hack_impl"}" deps)
  ];


# end
# proc-macro-hack-impl-0.4.1

  crates.proc_macro_hack_impl."0.4.1" = deps: { features?(features_.proc_macro_hack_impl."0.4.1" deps {}) }: buildRustCrate {
    crateName = "proc-macro-hack-impl";
    version = "0.4.1";
    description = "Procedural functionlike!() macros using only Macros 1.1";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "16sr1hw9v1xy3q351c5h2lidhllgn16jr4dwbphdvhb7cn8m0cq6";
    procMacro = true;
  };
  features_.proc_macro_hack_impl."0.4.1" = deps: f: updateFeatures f (rec {
    proc_macro_hack_impl."0.4.1".default = (f.proc_macro_hack_impl."0.4.1".default or true);
  }) [];


# end
# proc-macro2-0.4.30

  crates.proc_macro2."0.4.30" = deps: { features?(features_.proc_macro2."0.4.30" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.30";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0iifv51wrm6r4r2gghw6rray3nv53zcap355bbz1nsmbhj5s09b9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.30" or {});
  };
  features_.proc_macro2."0.4.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.30"."proc-macro" =
        (f.proc_macro2."0.4.30"."proc-macro" or false) ||
        (f.proc_macro2."0.4.30".default or false) ||
        (proc_macro2."0.4.30"."default" or false); }
      { "0.4.30".default = (f.proc_macro2."0.4.30".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.30".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
  ];


# end
# pyo3-0.6.0

  crates.pyo3."0.6.0" = deps: { features?(features_.pyo3."0.6.0" deps {}) }: buildRustCrate {
    crateName = "pyo3";
    version = "0.6.0";
    description = "Bindings to Python interpreter";
    authors = [ "PyO3 Project and Contributors <https://github.com/PyO3>" ];
    edition = "2018";
    sha256 = "1yggzh3lxpyhdkxdws2jbjkcwcgh95yiy3mzrn58p39xq8g4nbfn";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."inventory"."${deps."pyo3"."0.6.0"."inventory"}" deps)
      (crates."libc"."${deps."pyo3"."0.6.0"."libc"}" deps)
      (crates."mashup"."${deps."pyo3"."0.6.0"."mashup"}" deps)
      (crates."num_traits"."${deps."pyo3"."0.6.0"."num_traits"}" deps)
      (crates."pyo3cls"."${deps."pyo3"."0.6.0"."pyo3cls"}" deps)
      (crates."spin"."${deps."pyo3"."0.6.0"."spin"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."regex"."${deps."pyo3"."0.6.0"."regex"}" deps)
      (crates."version_check"."${deps."pyo3"."0.6.0"."version_check"}" deps)
    ]);
    features = mkFeatures (features."pyo3"."0.6.0" or {});
  };
  features_.pyo3."0.6.0" = deps: f: updateFeatures f (rec {
    inventory."${deps.pyo3."0.6.0".inventory}".default = true;
    libc."${deps.pyo3."0.6.0".libc}".default = true;
    mashup."${deps.pyo3."0.6.0".mashup}".default = true;
    num_traits."${deps.pyo3."0.6.0".num_traits}".default = true;
    pyo3."0.6.0".default = (f.pyo3."0.6.0".default or true);
    pyo3cls."${deps.pyo3."0.6.0".pyo3cls}".default = true;
    regex."${deps.pyo3."0.6.0".regex}".default = true;
    spin."${deps.pyo3."0.6.0".spin}".default = true;
    version_check."${deps.pyo3."0.6.0".version_check}".default = true;
  }) [
    (features_.inventory."${deps."pyo3"."0.6.0"."inventory"}" deps)
    (features_.libc."${deps."pyo3"."0.6.0"."libc"}" deps)
    (features_.mashup."${deps."pyo3"."0.6.0"."mashup"}" deps)
    (features_.num_traits."${deps."pyo3"."0.6.0"."num_traits"}" deps)
    (features_.pyo3cls."${deps."pyo3"."0.6.0"."pyo3cls"}" deps)
    (features_.spin."${deps."pyo3"."0.6.0"."spin"}" deps)
    (features_.regex."${deps."pyo3"."0.6.0"."regex"}" deps)
    (features_.version_check."${deps."pyo3"."0.6.0"."version_check"}" deps)
  ];


# end
# pyo3-derive-backend-0.6.0

  crates.pyo3_derive_backend."0.6.0" = deps: { features?(features_.pyo3_derive_backend."0.6.0" deps {}) }: buildRustCrate {
    crateName = "pyo3-derive-backend";
    version = "0.6.0";
    description = "Code generation for PyO3 package";
    authors = [ "PyO3 Project and Contributors <https://github.com/PyO3>" ];
    edition = "2018";
    sha256 = "0s923hqd4m08ka38vr2cfhw2qq3i6xb78z0m0s24p9y7z2cgsh31";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."pyo3_derive_backend"."0.6.0"."proc_macro2"}" deps)
      (crates."quote"."${deps."pyo3_derive_backend"."0.6.0"."quote"}" deps)
      (crates."syn"."${deps."pyo3_derive_backend"."0.6.0"."syn"}" deps)
    ]);
  };
  features_.pyo3_derive_backend."0.6.0" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.pyo3_derive_backend."0.6.0".proc_macro2}".default = true;
    pyo3_derive_backend."0.6.0".default = (f.pyo3_derive_backend."0.6.0".default or true);
    quote."${deps.pyo3_derive_backend."0.6.0".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.pyo3_derive_backend."0.6.0".syn}"."extra-traits" = true; }
      { "${deps.pyo3_derive_backend."0.6.0".syn}"."full" = true; }
      { "${deps.pyo3_derive_backend."0.6.0".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."pyo3_derive_backend"."0.6.0"."proc_macro2"}" deps)
    (features_.quote."${deps."pyo3_derive_backend"."0.6.0"."quote"}" deps)
    (features_.syn."${deps."pyo3_derive_backend"."0.6.0"."syn"}" deps)
  ];


# end
# pyo3cls-0.6.0

  crates.pyo3cls."0.6.0" = deps: { features?(features_.pyo3cls."0.6.0" deps {}) }: buildRustCrate {
    crateName = "pyo3cls";
    version = "0.6.0";
    description = "Proc macros for PyO3 package";
    authors = [ "PyO3 Project and Contributors <https://github.com/PyO3>" ];
    edition = "2018";
    sha256 = "0ms56bs3mjanph2qwsdkxcgs47cfrngp2gkh5ds1yyxkj8n5g02r";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."pyo3cls"."0.6.0"."proc_macro2"}" deps)
      (crates."pyo3_derive_backend"."${deps."pyo3cls"."0.6.0"."pyo3_derive_backend"}" deps)
      (crates."quote"."${deps."pyo3cls"."0.6.0"."quote"}" deps)
      (crates."syn"."${deps."pyo3cls"."0.6.0"."syn"}" deps)
    ]);
  };
  features_.pyo3cls."0.6.0" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.pyo3cls."0.6.0".proc_macro2}".default = true;
    pyo3_derive_backend."${deps.pyo3cls."0.6.0".pyo3_derive_backend}".default = true;
    pyo3cls."0.6.0".default = (f.pyo3cls."0.6.0".default or true);
    quote."${deps.pyo3cls."0.6.0".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.pyo3cls."0.6.0".syn}"."extra-traits" = true; }
      { "${deps.pyo3cls."0.6.0".syn}"."full" = true; }
      { "${deps.pyo3cls."0.6.0".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."pyo3cls"."0.6.0"."proc_macro2"}" deps)
    (features_.pyo3_derive_backend."${deps."pyo3cls"."0.6.0"."pyo3_derive_backend"}" deps)
    (features_.quote."${deps."pyo3cls"."0.6.0"."quote"}" deps)
    (features_.syn."${deps."pyo3cls"."0.6.0"."syn"}" deps)
  ];


# end
# quote-0.6.12

  crates.quote."0.6.12" = deps: { features?(features_.quote."0.6.12" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.12";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ckd2d2sy0hrwrqcr47dn0n3hyh7ygpc026l8xaycccyg27mihv9";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.12"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.12" or {});
  };
  features_.quote."0.6.12" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.12".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.12"."proc-macro" or false) ||
        (f."quote"."0.6.12"."proc-macro" or false); }
      { "${deps.quote."0.6.12".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.12".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.12"."proc-macro" =
        (f.quote."0.6.12"."proc-macro" or false) ||
        (f.quote."0.6.12".default or false) ||
        (quote."0.6.12"."default" or false); }
      { "0.6.12".default = (f.quote."0.6.12".default or true); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.12"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5"."alloc" =
        (f.rand."0.6.5"."alloc" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."packed_simd" =
        (f.rand."0.6.5"."packed_simd" or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5"."rand_os" =
        (f.rand."0.6.5"."rand_os" or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."simd_support" =
        (f.rand."0.6.5"."simd_support" or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5"."std" =
        (f.rand."0.6.5"."std" or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    description = "ChaCha random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1"."std" =
        (f.rand_core."0.3.1"."std" or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    description = "Core random number generator traits and tools for implementation.\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0"."alloc" =
        (f.rand_core."0.4.0"."alloc" or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0"."serde" =
        (f.rand_core."0.4.0"."serde" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0"."serde_derive" =
        (f.rand_core."0.4.0"."serde_derive" or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    description = "HC128 random number generator\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    description = "ISAAC random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_isaac."0.1.1"."serde" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_isaac."0.1.1"."serde_derive" or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_.rand_jitter."0.1.4" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.4";
    description = "Random number generator based on timing jitter";
    authors = [ "The Rand Project Developers" ];
    sha256 = "13nr4h042ab9l7qcv47bxrxw3gkf2pc3cni6c9pyi4nxla0mm7b6";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.4" or {});
  };
  features_.rand_jitter."0.1.4" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.4".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.4".rand_core}"."std" or false) ||
        (rand_jitter."0.1.4"."std" or false) ||
        (f."rand_jitter"."0.1.4"."std" or false); }
      { "${deps.rand_jitter."0.1.4".rand_core}".default = true; }
    ];
    rand_jitter."0.1.4".default = (f.rand_jitter."0.1.4".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.4".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.4".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.4"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.4"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    description = "OS backed Random Number Generator";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    description = "Selected PCG random number generators\n";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2"."serde" =
        (f.rand_pcg."0.1.2"."serde" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2"."serde_derive" =
        (f.rand_pcg."0.1.2"."serde_derive" or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    description = "Xorshift random number generator\n";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_xorshift."0.1.1"."serde" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_xorshift."0.1.1"."serde_derive" or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rawpointer-0.1.0

  crates.rawpointer."0.1.0" = deps: { features?(features_.rawpointer."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rawpointer";
    version = "0.1.0";
    description = "Extra methods for raw pointers.\n\nFor example `.post_inc()` and `.pre_dec()` (c.f. `ptr++` and `--ptr`) and\n`ptrdistance`.\n";
    authors = [ "bluss" ];
    sha256 = "0hblv2cv310ixf5f1jw4nk9w5pb95wh4dwqyjv07g2xrshbw6j04";
  };
  features_.rawpointer."0.1.0" = deps: f: updateFeatures f (rec {
    rawpointer."0.1.0".default = (f.rawpointer."0.1.0".default or true);
  }) [];


# end
# rayon-1.0.3

  crates.rayon."1.0.3" = deps: { features?(features_.rayon."1.0.3" deps {}) }: buildRustCrate {
    crateName = "rayon";
    version = "1.0.3";
    description = "Simple work-stealing parallelism for Rust";
    authors = [ "Niko Matsakis <niko@alum.mit.edu>" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0bmwk0l5nbx20a5x16dhrgrmkh3m40v6i0qs2gi2iqimlszyhq93";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."rayon"."1.0.3"."crossbeam_deque"}" deps)
      (crates."either"."${deps."rayon"."1.0.3"."either"}" deps)
      (crates."rayon_core"."${deps."rayon"."1.0.3"."rayon_core"}" deps)
    ]);
  };
  features_.rayon."1.0.3" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.rayon."1.0.3".crossbeam_deque}".default = true;
    either."${deps.rayon."1.0.3".either}".default = (f.either."${deps.rayon."1.0.3".either}".default or false);
    rayon."1.0.3".default = (f.rayon."1.0.3".default or true);
    rayon_core."${deps.rayon."1.0.3".rayon_core}".default = true;
  }) [
    (features_.crossbeam_deque."${deps."rayon"."1.0.3"."crossbeam_deque"}" deps)
    (features_.either."${deps."rayon"."1.0.3"."either"}" deps)
    (features_.rayon_core."${deps."rayon"."1.0.3"."rayon_core"}" deps)
  ];


# end
# rayon-core-1.4.1

  crates.rayon_core."1.4.1" = deps: { features?(features_.rayon_core."1.4.1" deps {}) }: buildRustCrate {
    crateName = "rayon-core";
    version = "1.4.1";
    description = "Core APIs for Rayon";
    authors = [ "Niko Matsakis <niko@alum.mit.edu>" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "01xf3mwmmji7yaarrpzpqjhz928ajxkwmjczbwmnpy39y95m4fbn";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."rayon_core"."1.4.1"."crossbeam_deque"}" deps)
      (crates."lazy_static"."${deps."rayon_core"."1.4.1"."lazy_static"}" deps)
      (crates."libc"."${deps."rayon_core"."1.4.1"."libc"}" deps)
      (crates."num_cpus"."${deps."rayon_core"."1.4.1"."num_cpus"}" deps)
    ]);
  };
  features_.rayon_core."1.4.1" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.rayon_core."1.4.1".crossbeam_deque}".default = true;
    lazy_static."${deps.rayon_core."1.4.1".lazy_static}".default = true;
    libc."${deps.rayon_core."1.4.1".libc}".default = true;
    num_cpus."${deps.rayon_core."1.4.1".num_cpus}".default = true;
    rayon_core."1.4.1".default = (f.rayon_core."1.4.1".default or true);
  }) [
    (features_.crossbeam_deque."${deps."rayon_core"."1.4.1"."crossbeam_deque"}" deps)
    (features_.lazy_static."${deps."rayon_core"."1.4.1"."lazy_static"}" deps)
    (features_.libc."${deps."rayon_core"."1.4.1"."libc"}" deps)
    (features_.num_cpus."${deps."rayon_core"."1.4.1"."num_cpus"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    description = "An implementation of random number generator based on rdrand and rdseed instructions";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0"."std" =
        (f.rdrand."0.4.0"."std" or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# reductive-0.2.0

  crates.reductive."0.2.0" = deps: { features?(features_.reductive."0.2.0" deps {}) }: buildRustCrate {
    crateName = "reductive";
    version = "0.2.0";
    description = "Optimized vector quantization for dense vectors";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "0pca4j30lbbzfiimgkj2m0gdmidjzqkjvbxn0m9fdl46w7xgqhik";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."reductive"."0.2.0"."log"}" deps)
      (crates."ndarray"."${deps."reductive"."0.2.0"."ndarray"}" deps)
      (crates."ndarray_parallel"."${deps."reductive"."0.2.0"."ndarray_parallel"}" deps)
      (crates."num_traits"."${deps."reductive"."0.2.0"."num_traits"}" deps)
      (crates."ordered_float"."${deps."reductive"."0.2.0"."ordered_float"}" deps)
      (crates."rand"."${deps."reductive"."0.2.0"."rand"}" deps)
      (crates."rand_xorshift"."${deps."reductive"."0.2.0"."rand_xorshift"}" deps)
      (crates."rayon"."${deps."reductive"."0.2.0"."rayon"}" deps)
    ]);
    features = mkFeatures (features."reductive"."0.2.0" or {});
  };
  features_.reductive."0.2.0" = deps: f: updateFeatures f (rec {
    log."${deps.reductive."0.2.0".log}".default = true;
    ndarray."${deps.reductive."0.2.0".ndarray}".default = true;
    ndarray_parallel."${deps.reductive."0.2.0".ndarray_parallel}".default = true;
    num_traits."${deps.reductive."0.2.0".num_traits}".default = true;
    ordered_float."${deps.reductive."0.2.0".ordered_float}".default = true;
    rand."${deps.reductive."0.2.0".rand}".default = true;
    rand_xorshift."${deps.reductive."0.2.0".rand_xorshift}".default = true;
    rayon."${deps.reductive."0.2.0".rayon}".default = true;
    reductive = fold recursiveUpdate {} [
      { "0.2.0"."ndarray-linalg" =
        (f.reductive."0.2.0"."ndarray-linalg" or false) ||
        (f.reductive."0.2.0".opq-train or false) ||
        (reductive."0.2.0"."opq-train" or false); }
      { "0.2.0".default = (f.reductive."0.2.0".default or true); }
    ];
  }) [
    (features_.log."${deps."reductive"."0.2.0"."log"}" deps)
    (features_.ndarray."${deps."reductive"."0.2.0"."ndarray"}" deps)
    (features_.ndarray_parallel."${deps."reductive"."0.2.0"."ndarray_parallel"}" deps)
    (features_.num_traits."${deps."reductive"."0.2.0"."num_traits"}" deps)
    (features_.ordered_float."${deps."reductive"."0.2.0"."ordered_float"}" deps)
    (features_.rand."${deps."reductive"."0.2.0"."rand"}" deps)
    (features_.rand_xorshift."${deps."reductive"."0.2.0"."rand_xorshift"}" deps)
    (features_.rayon."${deps."reductive"."0.2.0"."rayon"}" deps)
  ];


# end
# regex-1.1.6

  crates.regex."1.1.6" = deps: { features?(features_.regex."1.1.6" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.6";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1yynvabg03m5f65qxcw70qckkfjwi9xyfpjdp6yq7pk0xf0ydc0b";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.6"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.6"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.6"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.6"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.6"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.6" or {});
  };
  features_.regex."1.1.6" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.6".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.6".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.6"."pattern" =
        (f.regex."1.1.6"."pattern" or false) ||
        (f.regex."1.1.6".unstable or false) ||
        (regex."1.1.6"."unstable" or false); }
      { "1.1.6"."use_std" =
        (f.regex."1.1.6"."use_std" or false) ||
        (f.regex."1.1.6".default or false) ||
        (regex."1.1.6"."default" or false); }
      { "1.1.6".default = (f.regex."1.1.6".default or true); }
    ];
    regex_syntax."${deps.regex."1.1.6".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.6".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.6".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.6"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.6"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.6"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.6"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.6"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.6.6

  crates.regex_syntax."0.6.6" = deps: { features?(features_.regex_syntax."0.6.6" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.6";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1cjrdc3affa3rjfaxkp91xnf9k0fsqn9z4xqc280vv39nvrl8p8b";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.6" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.6".default = (f.regex_syntax."0.6.6".default or true);
    ucd_util."${deps.regex_syntax."0.6.6".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.6"."ucd_util"}" deps)
  ];


# end
# rustc-demangle-0.1.15

  crates.rustc_demangle."0.1.15" = deps: { features?(features_.rustc_demangle."0.1.15" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.15";
    description = "Rust compiler symbol demangling.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "04rgsfzhz4k9s56vkczsdbvmvg9409xp0nw4cy99lb2i0aa0255s";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.15" or {});
  };
  features_.rustc_demangle."0.1.15" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.15"."compiler_builtins" =
        (f.rustc_demangle."0.1.15"."compiler_builtins" or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15"."core" =
        (f.rustc_demangle."0.1.15"."core" or false) ||
        (f.rustc_demangle."0.1.15".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".default = (f.rustc_demangle."0.1.15".default or true); }
    ];
  }) [];


# end
# scopeguard-0.3.3

  crates.scopeguard."0.3.3" = deps: { features?(features_.scopeguard."0.3.3" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "0.3.3";
    description = "A RAII scope guard that will run a given closure when it goes out of scope,\neven if the code between panics (assuming unwinding panic).\n\nDefines the macros `defer!` and `defer_on_unwind!`; the latter only runs\nif the scope is extited through unwinding on panic.\n";
    authors = [ "bluss" ];
    sha256 = "0i1l013csrqzfz6c68pr5pi01hg5v5yahq8fsdmaxy6p8ygsjf3r";
    features = mkFeatures (features."scopeguard"."0.3.3" or {});
  };
  features_.scopeguard."0.3.3" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "0.3.3"."use_std" =
        (f.scopeguard."0.3.3"."use_std" or false) ||
        (f.scopeguard."0.3.3".default or false) ||
        (scopeguard."0.3.3"."default" or false); }
      { "0.3.3".default = (f.scopeguard."0.3.3".default or true); }
    ];
  }) [];


# end
# serde-1.0.91

  crates.serde."1.0.91" = deps: { features?(features_.serde."1.0.91" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.91";
    description = "A generic serialization/deserialization framework";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0pv2awcqq2y99hw15nsrkghzlcar8i5wg77w636zg9d10n6db5gf";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.91" or {});
  };
  features_.serde."1.0.91" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.91"."serde_derive" =
        (f.serde."1.0.91"."serde_derive" or false) ||
        (f.serde."1.0.91".derive or false) ||
        (serde."1.0.91"."derive" or false); }
      { "1.0.91"."std" =
        (f.serde."1.0.91"."std" or false) ||
        (f.serde."1.0.91".default or false) ||
        (serde."1.0.91"."default" or false); }
      { "1.0.91"."unstable" =
        (f.serde."1.0.91"."unstable" or false) ||
        (f.serde."1.0.91".alloc or false) ||
        (serde."1.0.91"."alloc" or false); }
      { "1.0.91".default = (f.serde."1.0.91".default or true); }
    ];
  }) [];


# end
# spin-0.5.0

  crates.spin."0.5.0" = deps: { features?(features_.spin."0.5.0" deps {}) }: buildRustCrate {
    crateName = "spin";
    version = "0.5.0";
    description = "Synchronization primitives based on spinning.\nThey may contain data, are usable without `std`,\nand static initializers are available.\n";
    authors = [ "Mathijs van de Nes <git@mathijs.vd-nes.nl>" "John Ericson <git@JohnEricson.me>" ];
    sha256 = "1yln8vy2z7nkwn7s7fdzmqrwk77cwmfgcp89kzxm2ljdrf5vccar";
  };
  features_.spin."0.5.0" = deps: f: updateFeatures f (rec {
    spin."0.5.0".default = (f.spin."0.5.0".default or true);
  }) [];


# end
# syn-0.15.34

  crates.syn."0.15.34" = deps: { features?(features_.syn."0.15.34" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.34";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "15vmpadp8qyrri6p1mp2z59dbapwds1r2z51v8nzpf3b9c6xvzpf";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.34"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.34"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.34".quote or false then [ (crates.quote."${deps."syn"."0.15.34".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.34" or {});
  };
  features_.syn."0.15.34" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.34".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.34".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.34"."proc-macro" or false) ||
        (f."syn"."0.15.34"."proc-macro" or false); }
      { "${deps.syn."0.15.34".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.34".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.34".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.34".quote}"."proc-macro" or false) ||
        (syn."0.15.34"."proc-macro" or false) ||
        (f."syn"."0.15.34"."proc-macro" or false); }
      { "${deps.syn."0.15.34".quote}".default = (f.quote."${deps.syn."0.15.34".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.34"."clone-impls" =
        (f.syn."0.15.34"."clone-impls" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."derive" =
        (f.syn."0.15.34"."derive" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."parsing" =
        (f.syn."0.15.34"."parsing" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."printing" =
        (f.syn."0.15.34"."printing" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."proc-macro" =
        (f.syn."0.15.34"."proc-macro" or false) ||
        (f.syn."0.15.34".default or false) ||
        (syn."0.15.34"."default" or false); }
      { "0.15.34"."quote" =
        (f.syn."0.15.34"."quote" or false) ||
        (f.syn."0.15.34".printing or false) ||
        (syn."0.15.34"."printing" or false); }
      { "0.15.34".default = (f.syn."0.15.34".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.34".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.34"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.34"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.34"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.2

  crates.synstructure."0.10.2" = deps: { features?(features_.synstructure."0.10.2" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.2";
    description = "Helper methods and macros for custom derives";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0bp29grjsim99xm1l6h38mbl98gnk47lf82rawlmws5zn4asdpj4";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.2"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.2"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.2" or {});
  };
  features_.synstructure."0.10.2" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.2".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.2".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.2".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.2".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.2".syn}".default = true; }
    ];
    synstructure."0.10.2".default = (f.synstructure."0.10.2".default or true);
    unicode_xid."${deps.synstructure."0.10.2".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.2"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.2"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.2"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.2"."unicode_xid"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# toml-0.5.1

  crates.toml."0.5.1" = deps: { features?(features_.toml."0.5.1" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.5.1";
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides\nimplementations of the standard Serialize/Deserialize traits for TOML data to\nfacilitate deserializing and serializing Rust structures.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1878ifdh576viwqg80vnhm51bng96vhyfi20jk8fv6wcifhgl4dg";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.5.1"."serde"}" deps)
    ]);
    features = mkFeatures (features."toml"."0.5.1" or {});
  };
  features_.toml."0.5.1" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.5.1".serde}".default = true;
    toml = fold recursiveUpdate {} [
      { "0.5.1"."linked-hash-map" =
        (f.toml."0.5.1"."linked-hash-map" or false) ||
        (f.toml."0.5.1".preserve_order or false) ||
        (toml."0.5.1"."preserve_order" or false); }
      { "0.5.1".default = (f.toml."0.5.1".default or true); }
    ];
  }) [
    (features_.serde."${deps."toml"."0.5.1"."serde"}" deps)
  ];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    description = "A small utility library for working with the Unicode character database.\n";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    description = "Determine whether characters have the XID_Start\nor XID_Continue properties according to\nUnicode Standard Annex #31.\n";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    description = "Convert ranges of Unicode codepoints to UTF-8 byte ranges.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    description = "Tiny crate to check the version of the installed/running rustc.";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_.winapi."0.3.7" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.7";
    description = "Raw FFI bindings for all of Windows API.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1k51gfkp0zqw7nj07y443mscs46icmdhld442s2073niap0kkdr8";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.7" or {});
  };
  features_.winapi."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7"."impl-debug" =
        (f.winapi."0.3.7"."impl-debug" or false) ||
        (f.winapi."0.3.7".debug or false) ||
        (winapi."0.3.7"."debug" or false); }
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
}
