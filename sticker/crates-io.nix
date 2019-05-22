{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_.adler32."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    description = "Minimal Adler32 implementation for Rust.";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_.adler32."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
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
# aligned_alloc-0.1.3

  crates.aligned_alloc."0.1.3" = deps: { features?(features_.aligned_alloc."0.1.3" deps {}) }: buildRustCrate {
    crateName = "aligned_alloc";
    version = "0.1.3";
    description = "Provides cross-platform primitives for aligned memory allocation\n";
    authors = [ "Jonas Schievink <jonasschievink@gmail.com>" ];
    sha256 = "1dii2ksw5jaiwps8n3r5hm1b5f1bx9qkj7rfk49b3bhc6s15023w";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."aligned_alloc"."0.1.3"."kernel32_sys"}" deps)
      (crates."libc"."${deps."aligned_alloc"."0.1.3"."libc"}" deps)
      (crates."winapi"."${deps."aligned_alloc"."0.1.3"."winapi"}" deps)
    ]);
  };
  features_.aligned_alloc."0.1.3" = deps: f: updateFeatures f (rec {
    aligned_alloc."0.1.3".default = (f.aligned_alloc."0.1.3".default or true);
    kernel32_sys."${deps.aligned_alloc."0.1.3".kernel32_sys}".default = true;
    libc."${deps.aligned_alloc."0.1.3".libc}".default = true;
    winapi."${deps.aligned_alloc."0.1.3".winapi}".default = true;
  }) [
    (features_.kernel32_sys."${deps."aligned_alloc"."0.1.3"."kernel32_sys"}" deps)
    (features_.libc."${deps."aligned_alloc"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."aligned_alloc"."0.1.3"."winapi"}" deps)
  ];


# end
# approx-0.3.2

  crates.approx."0.3.2" = deps: { features?(features_.approx."0.3.2" deps {}) }: buildRustCrate {
    crateName = "approx";
    version = "0.3.2";
    description = "Approximate floating point equality comparisons and assertions.";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" ];
    sha256 = "1sziapqxz6qk1m3bv4pay1bfqv887pf6045qfg913ip4jmyv8fcb";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."approx"."0.3.2"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."approx"."0.3.2" or {});
  };
  features_.approx."0.3.2" = deps: f: updateFeatures f (rec {
    approx = fold recursiveUpdate {} [
      { "0.3.2"."std" =
        (f.approx."0.3.2"."std" or false) ||
        (f.approx."0.3.2".default or false) ||
        (approx."0.3.2"."default" or false); }
      { "0.3.2".default = (f.approx."0.3.2".default or true); }
    ];
    num_traits."${deps.approx."0.3.2".num_traits}".default = true;
  }) [
    (features_.num_traits."${deps."approx"."0.3.2"."num_traits"}" deps)
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
# atty-0.2.11

  crates.atty."0.2.11" = deps: { features?(features_.atty."0.2.11" deps {}) }: buildRustCrate {
    crateName = "atty";
    version = "0.2.11";
    description = "A simple interface for querying atty";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0by1bj2km9jxi4i4g76zzi76fc2rcm9934jpnyrqd95zw344pb20";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."termion"."${deps."atty"."0.2.11"."termion"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."atty"."0.2.11"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."atty"."0.2.11"."winapi"}" deps)
    ]) else []);
  };
  features_.atty."0.2.11" = deps: f: updateFeatures f (rec {
    atty."0.2.11".default = (f.atty."0.2.11".default or true);
    libc."${deps.atty."0.2.11".libc}".default = (f.libc."${deps.atty."0.2.11".libc}".default or false);
    termion."${deps.atty."0.2.11".termion}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.atty."0.2.11".winapi}"."consoleapi" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwinbase" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwindef" = true; }
      { "${deps.atty."0.2.11".winapi}"."processenv" = true; }
      { "${deps.atty."0.2.11".winapi}"."winbase" = true; }
      { "${deps.atty."0.2.11".winapi}".default = true; }
    ];
  }) [
    (features_.termion."${deps."atty"."0.2.11"."termion"}" deps)
    (features_.libc."${deps."atty"."0.2.11"."libc"}" deps)
    (features_.winapi."${deps."atty"."0.2.11"."winapi"}" deps)
  ];


# end
# autocfg-0.1.2

  crates.autocfg."0.1.2" = deps: { features?(features_.autocfg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.2";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0dv81dwnp1al3j4ffz007yrjv4w1c7hw09gnf0xs3icxiw6qqfs3";
  };
  features_.autocfg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."0.1.2".default = (f.autocfg."0.1.2".default or true);
  }) [];


# end
# backtrace-0.3.15

  crates.backtrace."0.3.15" = deps: { features?(features_.backtrace."0.3.15" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.15";
    description = "A library to acquire a stack trace (backtrace) at runtime in a Rust program.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "0qgbc07aq9kfixv29s60xx666lmdpgmf27a78fwjlhnfzhqvkn0p";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.15"."cfg_if"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.15"."rustc_demangle"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "fuchsia") && !(kernel == "emscripten") && !(kernel == "darwin") && !(kernel == "ios") then mapFeatures features ([
    ]
      ++ (if features.backtrace."0.3.15".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.15".backtrace_sys}" deps) ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") || abi == "sgx" then mapFeatures features ([
      (crates."libc"."${deps."backtrace"."0.3.15"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."backtrace"."0.3.15"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.15"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.15" or {});
  };
  features_.backtrace."0.3.15" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.15".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.15"."addr2line" =
        (f.backtrace."0.3.15"."addr2line" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."backtrace-sys" =
        (f.backtrace."0.3.15"."backtrace-sys" or false) ||
        (f.backtrace."0.3.15".libbacktrace or false) ||
        (backtrace."0.3.15"."libbacktrace" or false); }
      { "0.3.15"."coresymbolication" =
        (f.backtrace."0.3.15"."coresymbolication" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."dbghelp" =
        (f.backtrace."0.3.15"."dbghelp" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."dladdr" =
        (f.backtrace."0.3.15"."dladdr" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."findshlibs" =
        (f.backtrace."0.3.15"."findshlibs" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."gimli" =
        (f.backtrace."0.3.15"."gimli" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."libbacktrace" =
        (f.backtrace."0.3.15"."libbacktrace" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."libunwind" =
        (f.backtrace."0.3.15"."libunwind" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false); }
      { "0.3.15"."memmap" =
        (f.backtrace."0.3.15"."memmap" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."object" =
        (f.backtrace."0.3.15"."object" or false) ||
        (f.backtrace."0.3.15".gimli-symbolize or false) ||
        (backtrace."0.3.15"."gimli-symbolize" or false); }
      { "0.3.15"."rustc-serialize" =
        (f.backtrace."0.3.15"."rustc-serialize" or false) ||
        (f.backtrace."0.3.15".serialize-rustc or false) ||
        (backtrace."0.3.15"."serialize-rustc" or false); }
      { "0.3.15"."serde" =
        (f.backtrace."0.3.15"."serde" or false) ||
        (f.backtrace."0.3.15".serialize-serde or false) ||
        (backtrace."0.3.15"."serialize-serde" or false); }
      { "0.3.15"."serde_derive" =
        (f.backtrace."0.3.15"."serde_derive" or false) ||
        (f.backtrace."0.3.15".serialize-serde or false) ||
        (backtrace."0.3.15"."serialize-serde" or false); }
      { "0.3.15"."std" =
        (f.backtrace."0.3.15"."std" or false) ||
        (f.backtrace."0.3.15".default or false) ||
        (backtrace."0.3.15"."default" or false) ||
        (f.backtrace."0.3.15".libbacktrace or false) ||
        (backtrace."0.3.15"."libbacktrace" or false); }
      { "0.3.15".default = (f.backtrace."0.3.15".default or true); }
    ];
    backtrace_sys."${deps.backtrace."0.3.15".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.15".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.15".libc}".default = (f.libc."${deps.backtrace."0.3.15".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.15".rustc_demangle}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.15".winapi}"."dbghelp" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."minwindef" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."processthreadsapi" = true; }
      { "${deps.backtrace."0.3.15".winapi}"."winnt" = true; }
      { "${deps.backtrace."0.3.15".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."backtrace"."0.3.15"."cfg_if"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.15"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.15"."autocfg"}" deps)
    (features_.backtrace_sys."${deps."backtrace"."0.3.15"."backtrace_sys"}" deps)
    (features_.libc."${deps."backtrace"."0.3.15"."libc"}" deps)
    (features_.winapi."${deps."backtrace"."0.3.15"."winapi"}" deps)
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
# build_const-0.2.1

  crates.build_const."0.2.1" = deps: { features?(features_.build_const."0.2.1" deps {}) }: buildRustCrate {
    crateName = "build_const";
    version = "0.2.1";
    description = "library for creating importable constants from build.rs or a script";
    authors = [ "Garrett Berg <vitiral@gmail.com>" ];
    sha256 = "15249xzi3qlm72p4glxgavwyq70fx2sp4df6ii0sdlrixrrp77pl";
    features = mkFeatures (features."build_const"."0.2.1" or {});
  };
  features_.build_const."0.2.1" = deps: f: updateFeatures f (rec {
    build_const = fold recursiveUpdate {} [
      { "0.2.1"."std" =
        (f.build_const."0.2.1"."std" or false) ||
        (f.build_const."0.2.1".default or false) ||
        (build_const."0.2.1"."default" or false); }
      { "0.2.1".default = (f.build_const."0.2.1".default or true); }
    ];
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
# cc-1.0.35

  crates.cc."1.0.35" = deps: { features?(features_.cc."1.0.35" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.35";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native\nC compiler to compile native C code into a static archive to be linked into Rust\ncode.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0dq3d2hgc5r14lk97ajj4mw30fibznjzrl9w745fqhwnq51jp7dj";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.35" or {});
  };
  features_.cc."1.0.35" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.35"."rayon" =
        (f.cc."1.0.35"."rayon" or false) ||
        (f.cc."1.0.35".parallel or false) ||
        (cc."1.0.35"."parallel" or false); }
      { "1.0.35".default = (f.cc."1.0.35".default or true); }
    ];
  }) [];


# end
# cfg-if-0.1.7

  crates.cfg_if."0.1.7" = deps: { features?(features_.cfg_if."0.1.7" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.7";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]\nparameters. Structured like an if-else chain, the first matching branch is the\nitem that gets emitted.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13gvcx1dxjq4mpmpj26hpg3yc97qffkx2zi58ykr1dwr8q2biiig";
  };
  features_.cfg_if."0.1.7" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.7".default = (f.cfg_if."0.1.7".default or true);
  }) [];


# end
# clicolors-control-1.0.0

  crates.clicolors_control."1.0.0" = deps: { features?(features_.clicolors_control."1.0.0" deps {}) }: buildRustCrate {
    crateName = "clicolors-control";
    version = "1.0.0";
    description = "A common utility library to control CLI colorization";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "02vi8lmf17w4mqjm0rh46ij750bxam2w3a9yxak6i26xhryh77zl";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."clicolors_control"."1.0.0"."lazy_static"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."clicolors_control"."1.0.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."atty"."${deps."clicolors_control"."1.0.0"."atty"}" deps)
      (crates."winapi"."${deps."clicolors_control"."1.0.0"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."clicolors_control"."1.0.0" or {});
  };
  features_.clicolors_control."1.0.0" = deps: f: updateFeatures f (rec {
    atty."${deps.clicolors_control."1.0.0".atty}".default = true;
    clicolors_control = fold recursiveUpdate {} [
      { "1.0.0"."terminal_autoconfig" =
        (f.clicolors_control."1.0.0"."terminal_autoconfig" or false) ||
        (f.clicolors_control."1.0.0".default or false) ||
        (clicolors_control."1.0.0"."default" or false); }
      { "1.0.0".default = (f.clicolors_control."1.0.0".default or true); }
    ];
    lazy_static."${deps.clicolors_control."1.0.0".lazy_static}".default = true;
    libc."${deps.clicolors_control."1.0.0".libc}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.clicolors_control."1.0.0".winapi}"."consoleapi" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}"."handleapi" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}"."processenv" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}"."winbase" = true; }
      { "${deps.clicolors_control."1.0.0".winapi}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."clicolors_control"."1.0.0"."lazy_static"}" deps)
    (features_.libc."${deps."clicolors_control"."1.0.0"."libc"}" deps)
    (features_.atty."${deps."clicolors_control"."1.0.0"."atty"}" deps)
    (features_.winapi."${deps."clicolors_control"."1.0.0"."winapi"}" deps)
  ];


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
# conllx-0.11.1

  crates.conllx."0.11.1" = deps: { features?(features_.conllx."0.11.1" deps {}) }: buildRustCrate {
    crateName = "conllx";
    version = "0.11.1";
    description = "Readers/writers for the CoNLL-X dependency format";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "1nbmajmm1xs8bcq7p8bj68kdxflkxq1788zx0nh3r1rixc2ppagx";
    dependencies = mapFeatures features ([
      (crates."failure"."${deps."conllx"."0.11.1"."failure"}" deps)
      (crates."itertools"."${deps."conllx"."0.11.1"."itertools"}" deps)
      (crates."lazy_init"."${deps."conllx"."0.11.1"."lazy_init"}" deps)
      (crates."petgraph"."${deps."conllx"."0.11.1"."petgraph"}" deps)
    ]);
  };
  features_.conllx."0.11.1" = deps: f: updateFeatures f (rec {
    conllx."0.11.1".default = (f.conllx."0.11.1".default or true);
    failure."${deps.conllx."0.11.1".failure}".default = true;
    itertools."${deps.conllx."0.11.1".itertools}".default = true;
    lazy_init."${deps.conllx."0.11.1".lazy_init}".default = true;
    petgraph."${deps.conllx."0.11.1".petgraph}".default = true;
  }) [
    (features_.failure."${deps."conllx"."0.11.1"."failure"}" deps)
    (features_.itertools."${deps."conllx"."0.11.1"."itertools"}" deps)
    (features_.lazy_init."${deps."conllx"."0.11.1"."lazy_init"}" deps)
    (features_.petgraph."${deps."conllx"."0.11.1"."petgraph"}" deps)
  ];


# end
# console-0.7.5

  crates.console."0.7.5" = deps: { features?(features_.console."0.7.5" deps {}) }: buildRustCrate {
    crateName = "console";
    version = "0.7.5";
    description = "A terminal and console abstraction for Rust";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "13rlgy6jc7hwyg1rllmibipgvfl3bvpyxac4vcg6c3fh1xzzkamz";
    dependencies = mapFeatures features ([
      (crates."atty"."${deps."console"."0.7.5"."atty"}" deps)
      (crates."clicolors_control"."${deps."console"."0.7.5"."clicolors_control"}" deps)
      (crates."lazy_static"."${deps."console"."0.7.5"."lazy_static"}" deps)
      (crates."libc"."${deps."console"."0.7.5"."libc"}" deps)
      (crates."parking_lot"."${deps."console"."0.7.5"."parking_lot"}" deps)
      (crates."regex"."${deps."console"."0.7.5"."regex"}" deps)
      (crates."unicode_width"."${deps."console"."0.7.5"."unicode_width"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."termios"."${deps."console"."0.7.5"."termios"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."encode_unicode"."${deps."console"."0.7.5"."encode_unicode"}" deps)
      (crates."winapi"."${deps."console"."0.7.5"."winapi"}" deps)
    ]) else []);
  };
  features_.console."0.7.5" = deps: f: updateFeatures f (rec {
    atty."${deps.console."0.7.5".atty}".default = true;
    clicolors_control."${deps.console."0.7.5".clicolors_control}".default = true;
    console."0.7.5".default = (f.console."0.7.5".default or true);
    encode_unicode."${deps.console."0.7.5".encode_unicode}".default = true;
    lazy_static."${deps.console."0.7.5".lazy_static}".default = true;
    libc."${deps.console."0.7.5".libc}".default = true;
    parking_lot."${deps.console."0.7.5".parking_lot}".default = true;
    regex."${deps.console."0.7.5".regex}".default = true;
    termios."${deps.console."0.7.5".termios}".default = true;
    unicode_width."${deps.console."0.7.5".unicode_width}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.console."0.7.5".winapi}"."consoleapi" = true; }
      { "${deps.console."0.7.5".winapi}"."processenv" = true; }
      { "${deps.console."0.7.5".winapi}"."winbase" = true; }
      { "${deps.console."0.7.5".winapi}"."wincon" = true; }
      { "${deps.console."0.7.5".winapi}"."winuser" = true; }
      { "${deps.console."0.7.5".winapi}".default = true; }
    ];
  }) [
    (features_.atty."${deps."console"."0.7.5"."atty"}" deps)
    (features_.clicolors_control."${deps."console"."0.7.5"."clicolors_control"}" deps)
    (features_.lazy_static."${deps."console"."0.7.5"."lazy_static"}" deps)
    (features_.libc."${deps."console"."0.7.5"."libc"}" deps)
    (features_.parking_lot."${deps."console"."0.7.5"."parking_lot"}" deps)
    (features_.regex."${deps."console"."0.7.5"."regex"}" deps)
    (features_.unicode_width."${deps."console"."0.7.5"."unicode_width"}" deps)
    (features_.termios."${deps."console"."0.7.5"."termios"}" deps)
    (features_.encode_unicode."${deps."console"."0.7.5"."encode_unicode"}" deps)
    (features_.winapi."${deps."console"."0.7.5"."winapi"}" deps)
  ];


# end
# crc-1.8.1

  crates.crc."1.8.1" = deps: { features?(features_.crc."1.8.1" deps {}) }: buildRustCrate {
    crateName = "crc";
    version = "1.8.1";
    description = "Rust implementation of CRC(16, 32, 64) with support of various standards";
    authors = [ "Rui Hu <code@mrhooray.com>" ];
    sha256 = "00m9jjqrddp3bqyanvyxv0hf6s56bx1wy51vcdcxg4n2jdhg109s";

    buildDependencies = mapFeatures features ([
      (crates."build_const"."${deps."crc"."1.8.1"."build_const"}" deps)
    ]);
    features = mkFeatures (features."crc"."1.8.1" or {});
  };
  features_.crc."1.8.1" = deps: f: updateFeatures f (rec {
    build_const."${deps.crc."1.8.1".build_const}".default = true;
    crc = fold recursiveUpdate {} [
      { "1.8.1"."std" =
        (f.crc."1.8.1"."std" or false) ||
        (f.crc."1.8.1".default or false) ||
        (crc."1.8.1"."default" or false); }
      { "1.8.1".default = (f.crc."1.8.1".default or true); }
    ];
  }) [
    (features_.build_const."${deps."crc"."1.8.1"."build_const"}" deps)
  ];


# end
# crc32fast-1.2.0

  crates.crc32fast."1.2.0" = deps: { features?(features_.crc32fast."1.2.0" deps {}) }: buildRustCrate {
    crateName = "crc32fast";
    version = "1.2.0";
    description = "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation";
    authors = [ "Sam Rijs <srijs@airpost.net>" "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1mx88ndqln6vzg7hjhjp8b7g0qggpqggsjrlsdqrfsrbpdzffcn8";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."crc32fast"."1.2.0" or {});
  };
  features_.crc32fast."1.2.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.2.0".cfg_if}".default = true;
    crc32fast = fold recursiveUpdate {} [
      { "1.2.0"."std" =
        (f.crc32fast."1.2.0"."std" or false) ||
        (f.crc32fast."1.2.0".default or false) ||
        (crc32fast."1.2.0"."default" or false); }
      { "1.2.0".default = (f.crc32fast."1.2.0".default or true); }
    ];
  }) [
    (features_.cfg_if."${deps."crc32fast"."1.2.0"."cfg_if"}" deps)
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
# curl-0.4.20

  crates.curl."0.4.20" = deps: { features?(features_.curl."0.4.20" deps {}) }: buildRustCrate {
    crateName = "curl";
    version = "0.4.20";
    description = "Rust bindings to libcurl for making HTTP requests";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1nhq83z0gg77nxj5cqpammza9mv82ikma29gx5bawdjrq0xwsd5h";
    dependencies = mapFeatures features ([
      (crates."curl_sys"."${deps."curl"."0.4.20"."curl_sys"}" deps)
      (crates."libc"."${deps."curl"."0.4.20"."libc"}" deps)
      (crates."socket2"."${deps."curl"."0.4.20"."socket2"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.curl."0.4.20".openssl-probe or false then [ (crates.openssl_probe."${deps."curl"."0.4.20".openssl_probe}" deps) ] else [])
      ++ (if features.curl."0.4.20".openssl-sys or false then [ (crates.openssl_sys."${deps."curl"."0.4.20".openssl_sys}" deps) ] else [])) else [])
      ++ (if abi == "msvc" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."curl"."0.4.20"."kernel32_sys"}" deps)
      (crates."schannel"."${deps."curl"."0.4.20"."schannel"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."curl"."0.4.20"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."curl"."0.4.20" or {});
  };
  features_.curl."0.4.20" = deps: f: updateFeatures f (rec {
    curl = fold recursiveUpdate {} [
      { "0.4.20"."openssl-probe" =
        (f.curl."0.4.20"."openssl-probe" or false) ||
        (f.curl."0.4.20".ssl or false) ||
        (curl."0.4.20"."ssl" or false); }
      { "0.4.20"."openssl-sys" =
        (f.curl."0.4.20"."openssl-sys" or false) ||
        (f.curl."0.4.20".ssl or false) ||
        (curl."0.4.20"."ssl" or false); }
      { "0.4.20"."ssl" =
        (f.curl."0.4.20"."ssl" or false) ||
        (f.curl."0.4.20".default or false) ||
        (curl."0.4.20"."default" or false); }
      { "0.4.20".default = (f.curl."0.4.20".default or true); }
    ];
    curl_sys = fold recursiveUpdate {} [
      { "${deps.curl."0.4.20".curl_sys}"."force-system-lib-on-osx" =
        (f.curl_sys."${deps.curl."0.4.20".curl_sys}"."force-system-lib-on-osx" or false) ||
        (curl."0.4.20"."force-system-lib-on-osx" or false) ||
        (f."curl"."0.4.20"."force-system-lib-on-osx" or false); }
      { "${deps.curl."0.4.20".curl_sys}"."http2" =
        (f.curl_sys."${deps.curl."0.4.20".curl_sys}"."http2" or false) ||
        (curl."0.4.20"."http2" or false) ||
        (f."curl"."0.4.20"."http2" or false); }
      { "${deps.curl."0.4.20".curl_sys}"."ssl" =
        (f.curl_sys."${deps.curl."0.4.20".curl_sys}"."ssl" or false) ||
        (curl."0.4.20"."ssl" or false) ||
        (f."curl"."0.4.20"."ssl" or false); }
      { "${deps.curl."0.4.20".curl_sys}"."static-curl" =
        (f.curl_sys."${deps.curl."0.4.20".curl_sys}"."static-curl" or false) ||
        (curl."0.4.20"."static-curl" or false) ||
        (f."curl"."0.4.20"."static-curl" or false); }
      { "${deps.curl."0.4.20".curl_sys}"."static-ssl" =
        (f.curl_sys."${deps.curl."0.4.20".curl_sys}"."static-ssl" or false) ||
        (curl."0.4.20"."static-ssl" or false) ||
        (f."curl"."0.4.20"."static-ssl" or false); }
      { "${deps.curl."0.4.20".curl_sys}".default = (f.curl_sys."${deps.curl."0.4.20".curl_sys}".default or false); }
    ];
    kernel32_sys."${deps.curl."0.4.20".kernel32_sys}".default = true;
    libc."${deps.curl."0.4.20".libc}".default = true;
    openssl_probe."${deps.curl."0.4.20".openssl_probe}".default = true;
    openssl_sys."${deps.curl."0.4.20".openssl_sys}".default = true;
    schannel."${deps.curl."0.4.20".schannel}".default = true;
    socket2."${deps.curl."0.4.20".socket2}".default = true;
    winapi."${deps.curl."0.4.20".winapi}".default = true;
  }) [
    (features_.curl_sys."${deps."curl"."0.4.20"."curl_sys"}" deps)
    (features_.libc."${deps."curl"."0.4.20"."libc"}" deps)
    (features_.socket2."${deps."curl"."0.4.20"."socket2"}" deps)
    (features_.openssl_probe."${deps."curl"."0.4.20"."openssl_probe"}" deps)
    (features_.openssl_sys."${deps."curl"."0.4.20"."openssl_sys"}" deps)
    (features_.kernel32_sys."${deps."curl"."0.4.20"."kernel32_sys"}" deps)
    (features_.schannel."${deps."curl"."0.4.20"."schannel"}" deps)
    (features_.winapi."${deps."curl"."0.4.20"."winapi"}" deps)
  ];


# end
# curl-sys-0.4.17

  crates.curl_sys."0.4.17" = deps: { features?(features_.curl_sys."0.4.17" deps {}) }: buildRustCrate {
    crateName = "curl-sys";
    version = "0.4.17";
    description = "Native bindings to the libcurl library";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1b7jx9rwhhcggdw5hpq4knx9h3jlp558shlfzmifcm8car982y75";
    libPath = "lib.rs";
    libName = "curl_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."curl_sys"."0.4.17"."libc"}" deps)
      (crates."libz_sys"."${deps."curl_sys"."0.4.17"."libz_sys"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.curl_sys."0.4.17".openssl-sys or false then [ (crates.openssl_sys."${deps."curl_sys"."0.4.17".openssl_sys}" deps) ] else [])) else [])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."curl_sys"."0.4.17"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."curl_sys"."0.4.17"."cc"}" deps)
      (crates."pkg_config"."${deps."curl_sys"."0.4.17"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."curl_sys"."0.4.17" or {});
  };
  features_.curl_sys."0.4.17" = deps: f: updateFeatures f (rec {
    cc."${deps.curl_sys."0.4.17".cc}".default = true;
    curl_sys = fold recursiveUpdate {} [
      { "0.4.17"."libnghttp2-sys" =
        (f.curl_sys."0.4.17"."libnghttp2-sys" or false) ||
        (f.curl_sys."0.4.17".http2 or false) ||
        (curl_sys."0.4.17"."http2" or false); }
      { "0.4.17"."openssl-sys" =
        (f.curl_sys."0.4.17"."openssl-sys" or false) ||
        (f.curl_sys."0.4.17".ssl or false) ||
        (curl_sys."0.4.17"."ssl" or false); }
      { "0.4.17"."ssl" =
        (f.curl_sys."0.4.17"."ssl" or false) ||
        (f.curl_sys."0.4.17".default or false) ||
        (curl_sys."0.4.17"."default" or false); }
      { "0.4.17".default = (f.curl_sys."0.4.17".default or true); }
    ];
    libc."${deps.curl_sys."0.4.17".libc}".default = true;
    libz_sys."${deps.curl_sys."0.4.17".libz_sys}".default = true;
    openssl_sys."${deps.curl_sys."0.4.17".openssl_sys}".default = true;
    pkg_config."${deps.curl_sys."0.4.17".pkg_config}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.curl_sys."0.4.17".winapi}"."winsock2" = true; }
      { "${deps.curl_sys."0.4.17".winapi}"."ws2def" = true; }
      { "${deps.curl_sys."0.4.17".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."curl_sys"."0.4.17"."libc"}" deps)
    (features_.libz_sys."${deps."curl_sys"."0.4.17"."libz_sys"}" deps)
    (features_.cc."${deps."curl_sys"."0.4.17"."cc"}" deps)
    (features_.pkg_config."${deps."curl_sys"."0.4.17"."pkg_config"}" deps)
    (features_.openssl_sys."${deps."curl_sys"."0.4.17"."openssl_sys"}" deps)
    (features_.winapi."${deps."curl_sys"."0.4.17"."winapi"}" deps)
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
# encode_unicode-0.3.5

  crates.encode_unicode."0.3.5" = deps: { features?(features_.encode_unicode."0.3.5" deps {}) }: buildRustCrate {
    crateName = "encode_unicode";
    version = "0.3.5";
    description = "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.\n";
    authors = [ "Torbjørn Birch Moltu <t.b.moltu@lyse.net>" ];
    sha256 = "01qvydmk3mbq19carzbmzbds5ck0hskb60sm7ab474vzm5ws0i02";
    dependencies = mapFeatures features ([
])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
]) else []);
    features = mkFeatures (features."encode_unicode"."0.3.5" or {});
  };
  features_.encode_unicode."0.3.5" = deps: f: updateFeatures f (rec {
    encode_unicode = fold recursiveUpdate {} [
      { "0.3.5"."std" =
        (f.encode_unicode."0.3.5"."std" or false) ||
        (f.encode_unicode."0.3.5".default or false) ||
        (encode_unicode."0.3.5"."default" or false); }
      { "0.3.5".default = (f.encode_unicode."0.3.5".default or true); }
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
# filetime-0.2.4

  crates.filetime."0.2.4" = deps: { features?(features_.filetime."0.2.4" deps {}) }: buildRustCrate {
    crateName = "filetime";
    version = "0.2.4";
    description = "Platform-agnostic accessors of timestamps in File metadata\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1lsc0qjihr8y56rlzdcldzr0nbljm8qqi691msgwhy6wrkawwx5d";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."filetime"."0.2.4"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."filetime"."0.2.4"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."filetime"."0.2.4"."libc"}" deps)
    ]) else []);
  };
  features_.filetime."0.2.4" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.filetime."0.2.4".cfg_if}".default = true;
    filetime."0.2.4".default = (f.filetime."0.2.4".default or true);
    libc."${deps.filetime."0.2.4".libc}".default = true;
    redox_syscall."${deps.filetime."0.2.4".redox_syscall}".default = true;
  }) [
    (features_.cfg_if."${deps."filetime"."0.2.4"."cfg_if"}" deps)
    (features_.redox_syscall."${deps."filetime"."0.2.4"."redox_syscall"}" deps)
    (features_.libc."${deps."filetime"."0.2.4"."libc"}" deps)
  ];


# end
# finalfusion-0.5.1

  crates.finalfusion."0.5.1" = deps: { features?(features_.finalfusion."0.5.1" deps {}) }: buildRustCrate {
    crateName = "finalfusion";
    version = "0.5.1";
    description = "Reader and writer for common word embedding formats";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "1rmb69mh970r60czgfqwdlgdg01gh8f5azi9qq3s935sbs1dhrw6";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."finalfusion"."0.5.1"."byteorder"}" deps)
      (crates."failure"."${deps."finalfusion"."0.5.1"."failure"}" deps)
      (crates."fnv"."${deps."finalfusion"."0.5.1"."fnv"}" deps)
      (crates."itertools"."${deps."finalfusion"."0.5.1"."itertools"}" deps)
      (crates."memmap"."${deps."finalfusion"."0.5.1"."memmap"}" deps)
      (crates."ndarray"."${deps."finalfusion"."0.5.1"."ndarray"}" deps)
      (crates."ordered_float"."${deps."finalfusion"."0.5.1"."ordered_float"}" deps)
      (crates."rand"."${deps."finalfusion"."0.5.1"."rand"}" deps)
      (crates."rand_xorshift"."${deps."finalfusion"."0.5.1"."rand_xorshift"}" deps)
      (crates."reductive"."${deps."finalfusion"."0.5.1"."reductive"}" deps)
      (crates."toml"."${deps."finalfusion"."0.5.1"."toml"}" deps)
    ]);
  };
  features_.finalfusion."0.5.1" = deps: f: updateFeatures f (rec {
    byteorder."${deps.finalfusion."0.5.1".byteorder}".default = true;
    failure."${deps.finalfusion."0.5.1".failure}".default = true;
    finalfusion."0.5.1".default = (f.finalfusion."0.5.1".default or true);
    fnv."${deps.finalfusion."0.5.1".fnv}".default = true;
    itertools."${deps.finalfusion."0.5.1".itertools}".default = true;
    memmap."${deps.finalfusion."0.5.1".memmap}".default = true;
    ndarray."${deps.finalfusion."0.5.1".ndarray}".default = true;
    ordered_float."${deps.finalfusion."0.5.1".ordered_float}".default = true;
    rand."${deps.finalfusion."0.5.1".rand}".default = true;
    rand_xorshift."${deps.finalfusion."0.5.1".rand_xorshift}".default = true;
    reductive."${deps.finalfusion."0.5.1".reductive}".default = true;
    toml."${deps.finalfusion."0.5.1".toml}".default = true;
  }) [
    (features_.byteorder."${deps."finalfusion"."0.5.1"."byteorder"}" deps)
    (features_.failure."${deps."finalfusion"."0.5.1"."failure"}" deps)
    (features_.fnv."${deps."finalfusion"."0.5.1"."fnv"}" deps)
    (features_.itertools."${deps."finalfusion"."0.5.1"."itertools"}" deps)
    (features_.memmap."${deps."finalfusion"."0.5.1"."memmap"}" deps)
    (features_.ndarray."${deps."finalfusion"."0.5.1"."ndarray"}" deps)
    (features_.ordered_float."${deps."finalfusion"."0.5.1"."ordered_float"}" deps)
    (features_.rand."${deps."finalfusion"."0.5.1"."rand"}" deps)
    (features_.rand_xorshift."${deps."finalfusion"."0.5.1"."rand_xorshift"}" deps)
    (features_.reductive."${deps."finalfusion"."0.5.1"."reductive"}" deps)
    (features_.toml."${deps."finalfusion"."0.5.1"."toml"}" deps)
  ];


# end
# fixedbitset-0.1.9

  crates.fixedbitset."0.1.9" = deps: { features?(features_.fixedbitset."0.1.9" deps {}) }: buildRustCrate {
    crateName = "fixedbitset";
    version = "0.1.9";
    description = "FixedBitSet is a simple bitset collection";
    authors = [ "bluss" ];
    sha256 = "1bkb5aq7h9p4rzlgxagnda1f0dd11q0qz41bmdy11z18q1p8igy1";
  };
  features_.fixedbitset."0.1.9" = deps: f: updateFeatures f (rec {
    fixedbitset."0.1.9".default = (f.fixedbitset."0.1.9".default or true);
  }) [];


# end
# flate2-1.0.7

  crates.flate2."1.0.7" = deps: { features?(features_.flate2."1.0.7" deps {}) }: buildRustCrate {
    crateName = "flate2";
    version = "1.0.7";
    description = "Bindings to miniz.c for DEFLATE compression and decompression exposed as\nReader/Writer streams. Contains bindings for zlib, deflate, and gzip-based\nstreams.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "012vi948sap09hm1nmd228fqn7i5kp6wfb9zlz0m8ysq5if1s9mc";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."flate2"."1.0.7"."crc32fast"}" deps)
      (crates."libc"."${deps."flate2"."1.0.7"."libc"}" deps)
    ]
      ++ (if features.flate2."1.0.7".miniz-sys or false then [ (crates.miniz_sys."${deps."flate2"."1.0.7".miniz_sys}" deps) ] else [])
      ++ (if features.flate2."1.0.7".miniz_oxide_c_api or false then [ (crates.miniz_oxide_c_api."${deps."flate2"."1.0.7".miniz_oxide_c_api}" deps) ] else []))
      ++ (if cpu == "wasm32" && !(kernel == "emscripten") then mapFeatures features ([
      (crates."miniz_oxide_c_api"."${deps."flate2"."1.0.7"."miniz_oxide_c_api"}" deps)
    ]) else []);
    features = mkFeatures (features."flate2"."1.0.7" or {});
  };
  features_.flate2."1.0.7" = deps: f: updateFeatures f (rec {
    crc32fast."${deps.flate2."1.0.7".crc32fast}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "1.0.7"."futures" =
        (f.flate2."1.0.7"."futures" or false) ||
        (f.flate2."1.0.7".tokio or false) ||
        (flate2."1.0.7"."tokio" or false); }
      { "1.0.7"."libz-sys" =
        (f.flate2."1.0.7"."libz-sys" or false) ||
        (f.flate2."1.0.7".zlib or false) ||
        (flate2."1.0.7"."zlib" or false); }
      { "1.0.7"."miniz-sys" =
        (f.flate2."1.0.7"."miniz-sys" or false) ||
        (f.flate2."1.0.7".default or false) ||
        (flate2."1.0.7"."default" or false); }
      { "1.0.7"."miniz_oxide_c_api" =
        (f.flate2."1.0.7"."miniz_oxide_c_api" or false) ||
        (f.flate2."1.0.7".rust_backend or false) ||
        (flate2."1.0.7"."rust_backend" or false); }
      { "1.0.7"."tokio-io" =
        (f.flate2."1.0.7"."tokio-io" or false) ||
        (f.flate2."1.0.7".tokio or false) ||
        (flate2."1.0.7"."tokio" or false); }
      { "1.0.7".default = (f.flate2."1.0.7".default or true); }
    ];
    libc."${deps.flate2."1.0.7".libc}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "${deps.flate2."1.0.7".miniz_oxide_c_api}"."no_c_export" =
        (f.miniz_oxide_c_api."${deps.flate2."1.0.7".miniz_oxide_c_api}"."no_c_export" or false) ||
        true ||
        true; }
      { "${deps.flate2."1.0.7".miniz_oxide_c_api}".default = true; }
    ];
    miniz_sys."${deps.flate2."1.0.7".miniz_sys}".default = true;
  }) [
    (features_.crc32fast."${deps."flate2"."1.0.7"."crc32fast"}" deps)
    (features_.libc."${deps."flate2"."1.0.7"."libc"}" deps)
    (features_.miniz_sys."${deps."flate2"."1.0.7"."miniz_sys"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.7"."miniz_oxide_c_api"}" deps)
    (features_.miniz_oxide_c_api."${deps."flate2"."1.0.7"."miniz_oxide_c_api"}" deps)
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
# getopts-0.2.18

  crates.getopts."0.2.18" = deps: { features?(features_.getopts."0.2.18" deps {}) }: buildRustCrate {
    crateName = "getopts";
    version = "0.2.18";
    description = "getopts-like option parsing.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0c1m95wg8pkvdq4mwcd2v78r1lb6a5s3ljm7158dsl56mvzcwd5y";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."getopts"."0.2.18"."unicode_width"}" deps)
    ]);
  };
  features_.getopts."0.2.18" = deps: f: updateFeatures f (rec {
    getopts."0.2.18".default = (f.getopts."0.2.18".default or true);
    unicode_width."${deps.getopts."0.2.18".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."getopts"."0.2.18"."unicode_width"}" deps)
  ];


# end
# half-1.3.0

  crates.half."1.3.0" = deps: { features?(features_.half."1.3.0" deps {}) }: buildRustCrate {
    crateName = "half";
    version = "1.3.0";
    description = "Half-precision floating point f16 type for Rust implementing the IEEE 754-2008 binary16 type.";
    authors = [ "Kathryn Long <squeeself@gmail.com>" ];
    sha256 = "1pyl4kf8bzgiq0i8bm98vpc0g99qp8ns5i2aq34mb21fnw6s7xrz";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."half"."1.3.0" or {});
  };
  features_.half."1.3.0" = deps: f: updateFeatures f (rec {
    half = fold recursiveUpdate {} [
      { "1.3.0"."serde" =
        (f.half."1.3.0"."serde" or false) ||
        (f.half."1.3.0".serialize or false) ||
        (half."1.3.0"."serialize" or false); }
      { "1.3.0".default = (f.half."1.3.0".default or true); }
    ];
  }) [];


# end
# indicatif-0.11.0

  crates.indicatif."0.11.0" = deps: { features?(features_.indicatif."0.11.0" deps {}) }: buildRustCrate {
    crateName = "indicatif";
    version = "0.11.0";
    description = "A progress bar and cli reporting library for Rust";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "11559k3l50s92r84xj260qvrrscmngyk3x68hbivic8bar7g7fhz";
    dependencies = mapFeatures features ([
      (crates."console"."${deps."indicatif"."0.11.0"."console"}" deps)
      (crates."lazy_static"."${deps."indicatif"."0.11.0"."lazy_static"}" deps)
      (crates."number_prefix"."${deps."indicatif"."0.11.0"."number_prefix"}" deps)
      (crates."parking_lot"."${deps."indicatif"."0.11.0"."parking_lot"}" deps)
      (crates."regex"."${deps."indicatif"."0.11.0"."regex"}" deps)
    ]);
  };
  features_.indicatif."0.11.0" = deps: f: updateFeatures f (rec {
    console."${deps.indicatif."0.11.0".console}".default = true;
    indicatif."0.11.0".default = (f.indicatif."0.11.0".default or true);
    lazy_static."${deps.indicatif."0.11.0".lazy_static}".default = true;
    number_prefix."${deps.indicatif."0.11.0".number_prefix}".default = true;
    parking_lot."${deps.indicatif."0.11.0".parking_lot}".default = true;
    regex."${deps.indicatif."0.11.0".regex}".default = true;
  }) [
    (features_.console."${deps."indicatif"."0.11.0"."console"}" deps)
    (features_.lazy_static."${deps."indicatif"."0.11.0"."lazy_static"}" deps)
    (features_.number_prefix."${deps."indicatif"."0.11.0"."number_prefix"}" deps)
    (features_.parking_lot."${deps."indicatif"."0.11.0"."parking_lot"}" deps)
    (features_.regex."${deps."indicatif"."0.11.0"."regex"}" deps)
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
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    description = "Contains function definitions for the Windows API library kernel32. See winapi for types and constants.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# lazy-init-0.3.0

  crates.lazy_init."0.3.0" = deps: { features?(features_.lazy_init."0.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy-init";
    version = "0.3.0";
    description = "Lazy initialization.";
    authors = [ "Kyle Huey <khuey@kylehuey.com>" ];
    sha256 = "1flvklamz5rkldpkqgjbxx7avq6fkpa0542988zggmr87r3x68fr";
  };
  features_.lazy_init."0.3.0" = deps: f: updateFeatures f (rec {
    lazy_init."0.3.0".default = (f.lazy_init."0.3.0".default or true);
  }) [];


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
# libc-0.2.51

  crates.libc."0.2.51" = deps: { features?(features_.libc."0.2.51" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.51";
    description = "Raw FFI bindings to platform libraries like libc.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1lzavxj1ymm7vghs6nmzq9shprdlqby73py9k30gwvv0dwy365cv";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.51" or {});
  };
  features_.libc."0.2.51" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.51"."align" =
        (f.libc."0.2.51"."align" or false) ||
        (f.libc."0.2.51".rustc-dep-of-std or false) ||
        (libc."0.2.51"."rustc-dep-of-std" or false); }
      { "0.2.51"."rustc-std-workspace-core" =
        (f.libc."0.2.51"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.51".rustc-dep-of-std or false) ||
        (libc."0.2.51"."rustc-dep-of-std" or false); }
      { "0.2.51"."use_std" =
        (f.libc."0.2.51"."use_std" or false) ||
        (f.libc."0.2.51".default or false) ||
        (libc."0.2.51"."default" or false); }
      { "0.2.51".default = (f.libc."0.2.51".default or true); }
    ];
  }) [];


# end
# libz-sys-1.0.25

  crates.libz_sys."1.0.25" = deps: { features?(features_.libz_sys."1.0.25" deps {}) }: buildRustCrate {
    crateName = "libz-sys";
    version = "1.0.25";
    description = "Bindings to the system libz library (also known as zlib).\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "195jzg8mgjbvmkbpx1rzkzrqm0g2fdivk79v44c9lzl64r3f9fym";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."libz_sys"."1.0.25"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libz_sys"."1.0.25"."cc"}" deps)
      (crates."pkg_config"."${deps."libz_sys"."1.0.25"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."libz_sys"."1.0.25" or {});
  };
  features_.libz_sys."1.0.25" = deps: f: updateFeatures f (rec {
    cc."${deps.libz_sys."1.0.25".cc}".default = true;
    libc."${deps.libz_sys."1.0.25".libc}".default = true;
    libz_sys."1.0.25".default = (f.libz_sys."1.0.25".default or true);
    pkg_config."${deps.libz_sys."1.0.25".pkg_config}".default = true;
  }) [
    (features_.libc."${deps."libz_sys"."1.0.25"."libc"}" deps)
    (features_.cc."${deps."libz_sys"."1.0.25"."cc"}" deps)
    (features_.pkg_config."${deps."libz_sys"."1.0.25"."pkg_config"}" deps)
  ];


# end
# lock_api-0.1.5

  crates.lock_api."0.1.5" = deps: { features?(features_.lock_api."0.1.5" deps {}) }: buildRustCrate {
    crateName = "lock_api";
    version = "0.1.5";
    description = "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "132sidr5hvjfkaqm3l95zpcpi8yk5ddd0g79zf1ad4v65sxirqqm";
    dependencies = mapFeatures features ([
      (crates."scopeguard"."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
    ]
      ++ (if features.lock_api."0.1.5".owning_ref or false then [ (crates.owning_ref."${deps."lock_api"."0.1.5".owning_ref}" deps) ] else []));
    features = mkFeatures (features."lock_api"."0.1.5" or {});
  };
  features_.lock_api."0.1.5" = deps: f: updateFeatures f (rec {
    lock_api."0.1.5".default = (f.lock_api."0.1.5".default or true);
    owning_ref."${deps.lock_api."0.1.5".owning_ref}".default = true;
    scopeguard."${deps.lock_api."0.1.5".scopeguard}".default = (f.scopeguard."${deps.lock_api."0.1.5".scopeguard}".default or false);
  }) [
    (features_.owning_ref."${deps."lock_api"."0.1.5"."owning_ref"}" deps)
    (features_.scopeguard."${deps."lock_api"."0.1.5"."scopeguard"}" deps)
  ];


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
# miniz-sys-0.1.11

  crates.miniz_sys."0.1.11" = deps: { features?(features_.miniz_sys."0.1.11" deps {}) }: buildRustCrate {
    crateName = "miniz-sys";
    version = "0.1.11";
    description = "Bindings to the miniz.c library.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0l2wsakqjj7kc06dwxlpz4h8wih0f9d1idrz5gb1svipvh81khsm";
    libPath = "lib.rs";
    libName = "miniz_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."miniz_sys"."0.1.11"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_sys"."0.1.11"."cc"}" deps)
    ]);
  };
  features_.miniz_sys."0.1.11" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_sys."0.1.11".cc}".default = true;
    libc."${deps.miniz_sys."0.1.11".libc}".default = true;
    miniz_sys."0.1.11".default = (f.miniz_sys."0.1.11".default or true);
  }) [
    (features_.libc."${deps."miniz_sys"."0.1.11"."libc"}" deps)
    (features_.cc."${deps."miniz_sys"."0.1.11"."cc"}" deps)
  ];


# end
# miniz_oxide-0.2.1

  crates.miniz_oxide."0.2.1" = deps: { features?(features_.miniz_oxide."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide";
    version = "0.2.1";
    description = "DEFLATE compression and decompression library rewritten in Rust based on miniz";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1ly14vlk0gq7czi1323l2dsy5y8dpvdwld4h9083i0y3hx9iyfdz";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
    ]);
  };
  features_.miniz_oxide."0.2.1" = deps: f: updateFeatures f (rec {
    adler32."${deps.miniz_oxide."0.2.1".adler32}".default = true;
    miniz_oxide."0.2.1".default = (f.miniz_oxide."0.2.1".default or true);
  }) [
    (features_.adler32."${deps."miniz_oxide"."0.2.1"."adler32"}" deps)
  ];


# end
# miniz_oxide_c_api-0.2.1

  crates.miniz_oxide_c_api."0.2.1" = deps: { features?(features_.miniz_oxide_c_api."0.2.1" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide_c_api";
    version = "0.2.1";
    description = "DEFLATE compression and decompression API designed to be Rust drop-in replacement for miniz";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "1zsk334nhy2rvyhbr0815l0gp6w40al6rxxafkycaafx3m9j8cj2";
    build = "src/build.rs";
    dependencies = mapFeatures features ([
      (crates."crc"."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
      (crates."libc"."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
      (crates."miniz_oxide"."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
    ]);
    features = mkFeatures (features."miniz_oxide_c_api"."0.2.1" or {});
  };
  features_.miniz_oxide_c_api."0.2.1" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_oxide_c_api."0.2.1".cc}".default = true;
    crc."${deps.miniz_oxide_c_api."0.2.1".crc}".default = true;
    libc."${deps.miniz_oxide_c_api."0.2.1".libc}".default = true;
    miniz_oxide."${deps.miniz_oxide_c_api."0.2.1".miniz_oxide}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "0.2.1"."build_orig_miniz" =
        (f.miniz_oxide_c_api."0.2.1"."build_orig_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
      { "0.2.1"."build_stub_miniz" =
        (f.miniz_oxide_c_api."0.2.1"."build_stub_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.1".miniz_zip or false) ||
        (miniz_oxide_c_api."0.2.1"."miniz_zip" or false); }
      { "0.2.1"."no_c_export" =
        (f.miniz_oxide_c_api."0.2.1"."no_c_export" or false) ||
        (f.miniz_oxide_c_api."0.2.1".benching or false) ||
        (miniz_oxide_c_api."0.2.1"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.1".fuzzing or false) ||
        (miniz_oxide_c_api."0.2.1"."fuzzing" or false); }
      { "0.2.1".default = (f.miniz_oxide_c_api."0.2.1".default or true); }
    ];
  }) [
    (features_.crc."${deps."miniz_oxide_c_api"."0.2.1"."crc"}" deps)
    (features_.libc."${deps."miniz_oxide_c_api"."0.2.1"."libc"}" deps)
    (features_.miniz_oxide."${deps."miniz_oxide_c_api"."0.2.1"."miniz_oxide"}" deps)
    (features_.cc."${deps."miniz_oxide_c_api"."0.2.1"."cc"}" deps)
  ];


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
# num-traits-0.2.6

  crates.num_traits."0.2.6" = deps: { features?(features_.num_traits."0.2.6" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.6";
    description = "Numeric traits for generic mathematics";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1d20sil9n0wgznd1nycm3yjfj1mzyl41ambb7by1apxlyiil1azk";
    build = "build.rs";
    features = mkFeatures (features."num_traits"."0.2.6" or {});
  };
  features_.num_traits."0.2.6" = deps: f: updateFeatures f (rec {
    num_traits = fold recursiveUpdate {} [
      { "0.2.6"."std" =
        (f.num_traits."0.2.6"."std" or false) ||
        (f.num_traits."0.2.6".default or false) ||
        (num_traits."0.2.6"."default" or false); }
      { "0.2.6".default = (f.num_traits."0.2.6".default or true); }
    ];
  }) [];


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
# number_prefix-0.2.8

  crates.number_prefix."0.2.8" = deps: { features?(features_.number_prefix."0.2.8" deps {}) }: buildRustCrate {
    crateName = "number_prefix";
    version = "0.2.8";
    description = "Library for formatting numeric prefixes: kilo, giga, kibi.";
    authors = [ "ogham@bsago.me" ];
    sha256 = "0qlm6kx5ynjlqjmc88nb8dlansanxr8ajh1b5sb398d0n59lcikf";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."number_prefix"."0.2.8"."num_traits"}" deps)
    ]);
  };
  features_.number_prefix."0.2.8" = deps: f: updateFeatures f (rec {
    num_traits."${deps.number_prefix."0.2.8".num_traits}".default = true;
    number_prefix."0.2.8".default = (f.number_prefix."0.2.8".default or true);
  }) [
    (features_.num_traits."${deps."number_prefix"."0.2.8"."num_traits"}" deps)
  ];


# end
# openssl-probe-0.1.2

  crates.openssl_probe."0.1.2" = deps: { features?(features_.openssl_probe."0.1.2" deps {}) }: buildRustCrate {
    crateName = "openssl-probe";
    version = "0.1.2";
    description = "Tool for helping to find SSL certificate locations on the system for OpenSSL\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a89fznx26vvaxyrxdvgf6iwai5xvs6xjvpjin68fgvrslv6n15a";
  };
  features_.openssl_probe."0.1.2" = deps: f: updateFeatures f (rec {
    openssl_probe."0.1.2".default = (f.openssl_probe."0.1.2".default or true);
  }) [];


# end
# openssl-sys-0.9.43

  crates.openssl_sys."0.9.43" = deps: { features?(features_.openssl_sys."0.9.43" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.43";
    description = "FFI bindings to OpenSSL";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1ip0f94jakr85pxjhrkg9w9lgiiy1yga3ckm6c8xb13klsr7ky9y";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.43"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."openssl_sys"."0.9.43"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.43"."pkg_config"}" deps)
      (crates."rustc_version"."${deps."openssl_sys"."0.9.43"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.43" or {});
  };
  features_.openssl_sys."0.9.43" = deps: f: updateFeatures f (rec {
    cc."${deps.openssl_sys."0.9.43".cc}".default = true;
    libc."${deps.openssl_sys."0.9.43".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.43"."openssl-src" =
        (f.openssl_sys."0.9.43"."openssl-src" or false) ||
        (f.openssl_sys."0.9.43".vendored or false) ||
        (openssl_sys."0.9.43"."vendored" or false); }
      { "0.9.43".default = (f.openssl_sys."0.9.43".default or true); }
    ];
    pkg_config."${deps.openssl_sys."0.9.43".pkg_config}".default = true;
    rustc_version."${deps.openssl_sys."0.9.43".rustc_version}".default = true;
  }) [
    (features_.libc."${deps."openssl_sys"."0.9.43"."libc"}" deps)
    (features_.cc."${deps."openssl_sys"."0.9.43"."cc"}" deps)
    (features_.pkg_config."${deps."openssl_sys"."0.9.43"."pkg_config"}" deps)
    (features_.rustc_version."${deps."openssl_sys"."0.9.43"."rustc_version"}" deps)
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
    ]
      ++ (if features.ordered_float."1.0.2".serde or false then [ (crates.serde."${deps."ordered_float"."1.0.2".serde}" deps) ] else []));
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
    serde."${deps.ordered_float."1.0.2".serde}".default = (f.serde."${deps.ordered_float."1.0.2".serde}".default or false);
  }) [
    (features_.num_traits."${deps."ordered_float"."1.0.2"."num_traits"}" deps)
    (features_.serde."${deps."ordered_float"."1.0.2"."serde"}" deps)
  ];


# end
# ordermap-0.3.5

  crates.ordermap."0.3.5" = deps: { features?(features_.ordermap."0.3.5" deps {}) }: buildRustCrate {
    crateName = "ordermap";
    version = "0.3.5";
    description = "A hash table with consistent order and fast iteration.";
    authors = [ "bluss" ];
    sha256 = "0b6vxfyh627yqm6war3392g1hhi4dbn49ibx2qv6mv490jdhv7d3";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ordermap"."0.3.5" or {});
  };
  features_.ordermap."0.3.5" = deps: f: updateFeatures f (rec {
    ordermap = fold recursiveUpdate {} [
      { "0.3.5"."serde" =
        (f.ordermap."0.3.5"."serde" or false) ||
        (f.ordermap."0.3.5".serde-1 or false) ||
        (ordermap."0.3.5"."serde-1" or false); }
      { "0.3.5".default = (f.ordermap."0.3.5".default or true); }
    ];
  }) [];


# end
# owning_ref-0.4.0

  crates.owning_ref."0.4.0" = deps: { features?(features_.owning_ref."0.4.0" deps {}) }: buildRustCrate {
    crateName = "owning_ref";
    version = "0.4.0";
    description = "A library for creating references that carry their owner with them.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1m95qpc3hamkw9wlbfzqkzk7h6skyj40zr6sa3ps151slcfnnchm";
    dependencies = mapFeatures features ([
      (crates."stable_deref_trait"."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
    ]);
  };
  features_.owning_ref."0.4.0" = deps: f: updateFeatures f (rec {
    owning_ref."0.4.0".default = (f.owning_ref."0.4.0".default or true);
    stable_deref_trait."${deps.owning_ref."0.4.0".stable_deref_trait}".default = true;
  }) [
    (features_.stable_deref_trait."${deps."owning_ref"."0.4.0"."stable_deref_trait"}" deps)
  ];


# end
# parking_lot-0.7.1

  crates.parking_lot."0.7.1" = deps: { features?(features_.parking_lot."0.7.1" deps {}) }: buildRustCrate {
    crateName = "parking_lot";
    version = "0.7.1";
    description = "More compact and efficient implementations of the standard synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1qpb49xd176hqqabxdb48f1hvylfbf68rpz8yfrhw0x68ys0lkq1";
    dependencies = mapFeatures features ([
      (crates."lock_api"."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
      (crates."parking_lot_core"."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
    ]);
    features = mkFeatures (features."parking_lot"."0.7.1" or {});
  };
  features_.parking_lot."0.7.1" = deps: f: updateFeatures f (rec {
    lock_api = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".lock_api}"."nightly" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}"."owning_ref" =
        (f.lock_api."${deps.parking_lot."0.7.1".lock_api}"."owning_ref" or false) ||
        (parking_lot."0.7.1"."owning_ref" or false) ||
        (f."parking_lot"."0.7.1"."owning_ref" or false); }
      { "${deps.parking_lot."0.7.1".lock_api}".default = true; }
    ];
    parking_lot = fold recursiveUpdate {} [
      { "0.7.1"."owning_ref" =
        (f.parking_lot."0.7.1"."owning_ref" or false) ||
        (f.parking_lot."0.7.1".default or false) ||
        (parking_lot."0.7.1"."default" or false); }
      { "0.7.1".default = (f.parking_lot."0.7.1".default or true); }
    ];
    parking_lot_core = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."deadlock_detection" or false) ||
        (parking_lot."0.7.1"."deadlock_detection" or false) ||
        (f."parking_lot"."0.7.1"."deadlock_detection" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" =
        (f.parking_lot_core."${deps.parking_lot."0.7.1".parking_lot_core}"."nightly" or false) ||
        (parking_lot."0.7.1"."nightly" or false) ||
        (f."parking_lot"."0.7.1"."nightly" or false); }
      { "${deps.parking_lot."0.7.1".parking_lot_core}".default = true; }
    ];
  }) [
    (features_.lock_api."${deps."parking_lot"."0.7.1"."lock_api"}" deps)
    (features_.parking_lot_core."${deps."parking_lot"."0.7.1"."parking_lot_core"}" deps)
  ];


# end
# parking_lot_core-0.4.0

  crates.parking_lot_core."0.4.0" = deps: { features?(features_.parking_lot_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot_core";
    version = "0.4.0";
    description = "An advanced API for creating custom synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "1mzk5i240ddvhwnz65hhjk4cq61z235g1n8bd7al4mg6vx437c16";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
      (crates."smallvec"."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot_core"."0.4.0" or {});
  };
  features_.parking_lot_core."0.4.0" = deps: f: updateFeatures f (rec {
    libc."${deps.parking_lot_core."0.4.0".libc}".default = true;
    parking_lot_core = fold recursiveUpdate {} [
      { "0.4.0"."backtrace" =
        (f.parking_lot_core."0.4.0"."backtrace" or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0"."petgraph" =
        (f.parking_lot_core."0.4.0"."petgraph" or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0"."thread-id" =
        (f.parking_lot_core."0.4.0"."thread-id" or false) ||
        (f.parking_lot_core."0.4.0".deadlock_detection or false) ||
        (parking_lot_core."0.4.0"."deadlock_detection" or false); }
      { "0.4.0".default = (f.parking_lot_core."0.4.0".default or true); }
    ];
    rand."${deps.parking_lot_core."0.4.0".rand}".default = true;
    rustc_version."${deps.parking_lot_core."0.4.0".rustc_version}".default = true;
    smallvec."${deps.parking_lot_core."0.4.0".smallvec}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.parking_lot_core."0.4.0".winapi}"."errhandlingapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."handleapi" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."minwindef" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."ntstatus" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winbase" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winerror" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}"."winnt" = true; }
      { "${deps.parking_lot_core."0.4.0".winapi}".default = true; }
    ];
  }) [
    (features_.rand."${deps."parking_lot_core"."0.4.0"."rand"}" deps)
    (features_.smallvec."${deps."parking_lot_core"."0.4.0"."smallvec"}" deps)
    (features_.rustc_version."${deps."parking_lot_core"."0.4.0"."rustc_version"}" deps)
    (features_.libc."${deps."parking_lot_core"."0.4.0"."libc"}" deps)
    (features_.winapi."${deps."parking_lot_core"."0.4.0"."winapi"}" deps)
  ];


# end
# petgraph-0.4.13

  crates.petgraph."0.4.13" = deps: { features?(features_.petgraph."0.4.13" deps {}) }: buildRustCrate {
    crateName = "petgraph";
    version = "0.4.13";
    description = "Graph data structure library. Provides graph types and graph algorithms.";
    authors = [ "bluss" "mitchmindtree" ];
    sha256 = "0a8k12b9vd0bndwqhafa853w186axdw05bv4kqjimyaz67428g1i";
    dependencies = mapFeatures features ([
      (crates."fixedbitset"."${deps."petgraph"."0.4.13"."fixedbitset"}" deps)
    ]
      ++ (if features.petgraph."0.4.13".ordermap or false then [ (crates.ordermap."${deps."petgraph"."0.4.13".ordermap}" deps) ] else []));
    features = mkFeatures (features."petgraph"."0.4.13" or {});
  };
  features_.petgraph."0.4.13" = deps: f: updateFeatures f (rec {
    fixedbitset."${deps.petgraph."0.4.13".fixedbitset}".default = true;
    ordermap."${deps.petgraph."0.4.13".ordermap}".default = true;
    petgraph = fold recursiveUpdate {} [
      { "0.4.13"."generate" =
        (f.petgraph."0.4.13"."generate" or false) ||
        (f.petgraph."0.4.13".unstable or false) ||
        (petgraph."0.4.13"."unstable" or false); }
      { "0.4.13"."graphmap" =
        (f.petgraph."0.4.13"."graphmap" or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13".default or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13"."ordermap" =
        (f.petgraph."0.4.13"."ordermap" or false) ||
        (f.petgraph."0.4.13".graphmap or false) ||
        (petgraph."0.4.13"."graphmap" or false); }
      { "0.4.13"."quickcheck" =
        (f.petgraph."0.4.13"."quickcheck" or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false); }
      { "0.4.13"."serde" =
        (f.petgraph."0.4.13"."serde" or false) ||
        (f.petgraph."0.4.13".serde-1 or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13"."serde_derive" =
        (f.petgraph."0.4.13"."serde_derive" or false) ||
        (f.petgraph."0.4.13".serde-1 or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13"."stable_graph" =
        (f.petgraph."0.4.13"."stable_graph" or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13".default or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13"."unstable" =
        (f.petgraph."0.4.13"."unstable" or false) ||
        (f.petgraph."0.4.13".all or false) ||
        (petgraph."0.4.13"."all" or false); }
      { "0.4.13".default = (f.petgraph."0.4.13".default or true); }
    ];
  }) [
    (features_.fixedbitset."${deps."petgraph"."0.4.13"."fixedbitset"}" deps)
    (features_.ordermap."${deps."petgraph"."0.4.13"."ordermap"}" deps)
  ];


# end
# pkg-config-0.3.14

  crates.pkg_config."0.3.14" = deps: { features?(features_.pkg_config."0.3.14" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.14";
    description = "A library to run the pkg-config system tool at build time in order to be used in\nCargo build scripts.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0207fsarrm412j0dh87lfcas72n8mxar7q3mgflsbsrqnb140sv6";
  };
  features_.pkg_config."0.3.14" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.14".default = (f.pkg_config."0.3.14".default or true);
  }) [];


# end
# proc-macro2-0.4.27

  crates.proc_macro2."0.4.27" = deps: { features?(features_.proc_macro2."0.4.27" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.27";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an\noption, off by default, to also reimplement itself in terms of the upstream\nunstable API.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1cp4c40p3hwn2sz72ssqa62gp5n8w4gbamdqvvadzp5l7gxnq95i";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.27" or {});
  };
  features_.proc_macro2."0.4.27" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.27"."proc-macro" =
        (f.proc_macro2."0.4.27"."proc-macro" or false) ||
        (f.proc_macro2."0.4.27".default or false) ||
        (proc_macro2."0.4.27"."default" or false); }
      { "0.4.27".default = (f.proc_macro2."0.4.27".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.27".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
  ];


# end
# protobuf-2.5.0

  crates.protobuf."2.5.0" = deps: { features?(features_.protobuf."2.5.0" deps {}) }: buildRustCrate {
    crateName = "protobuf";
    version = "2.5.0";
    description = "Rust implementation of Google protocol buffers\n";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "0sy9l0lrdcszl0v5h3p8pkiif58qvh7cjp79fcnq339xbkz6p63y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."protobuf"."2.5.0" or {});
  };
  features_.protobuf."2.5.0" = deps: f: updateFeatures f (rec {
    protobuf = fold recursiveUpdate {} [
      { "2.5.0"."bytes" =
        (f.protobuf."2.5.0"."bytes" or false) ||
        (f.protobuf."2.5.0".with-bytes or false) ||
        (protobuf."2.5.0"."with-bytes" or false); }
      { "2.5.0"."serde" =
        (f.protobuf."2.5.0"."serde" or false) ||
        (f.protobuf."2.5.0".with-serde or false) ||
        (protobuf."2.5.0"."with-serde" or false); }
      { "2.5.0"."serde_derive" =
        (f.protobuf."2.5.0"."serde_derive" or false) ||
        (f.protobuf."2.5.0".with-serde or false) ||
        (protobuf."2.5.0"."with-serde" or false); }
      { "2.5.0".default = (f.protobuf."2.5.0".default or true); }
    ];
  }) [];


# end
# protobuf-codegen-2.5.0

  crates.protobuf_codegen."2.5.0" = deps: { features?(features_.protobuf_codegen."2.5.0" deps {}) }: buildRustCrate {
    crateName = "protobuf-codegen";
    version = "2.5.0";
    description = "Code generator for rust-protobuf.\n\nIncludes a library and `protoc-gen-rust` binary.\n\nSee `protoc-rust` and `protobuf-codegen-pure` crates.\n";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "0sq04c5lhcs11vii020clkngsg79bnjqq863qqcmciyh8r3p8jqs";
    crateBin =
      [{  name = "protoc-gen-rust";  path = "src/bin/protoc-gen-rust.rs"; }] ++
      [{  name = "protobuf-bin-gen-rust-do-not-use";  path = "src/bin/protobuf-bin-gen-rust-do-not-use.rs"; }];
    dependencies = mapFeatures features ([
      (crates."protobuf"."${deps."protobuf_codegen"."2.5.0"."protobuf"}" deps)
    ]);
  };
  features_.protobuf_codegen."2.5.0" = deps: f: updateFeatures f (rec {
    protobuf."${deps.protobuf_codegen."2.5.0".protobuf}".default = true;
    protobuf_codegen."2.5.0".default = (f.protobuf_codegen."2.5.0".default or true);
  }) [
    (features_.protobuf."${deps."protobuf_codegen"."2.5.0"."protobuf"}" deps)
  ];


# end
# protoc-2.5.0

  crates.protoc."2.5.0" = deps: { features?(features_.protoc."2.5.0" deps {}) }: buildRustCrate {
    crateName = "protoc";
    version = "2.5.0";
    description = "Protobuf protoc command as API\n";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "0h0wi70fd45a8p4zi9ygiazb9x9lwf2iqdyw2mi7jrhngwl6rqgi";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."protoc"."2.5.0"."log"}" deps)
    ]);
  };
  features_.protoc."2.5.0" = deps: f: updateFeatures f (rec {
    log."${deps.protoc."2.5.0".log}".default = true;
    protoc."2.5.0".default = (f.protoc."2.5.0".default or true);
  }) [
    (features_.log."${deps."protoc"."2.5.0"."log"}" deps)
  ];


# end
# protoc-rust-2.5.0

  crates.protoc_rust."2.5.0" = deps: { features?(features_.protoc_rust."2.5.0" deps {}) }: buildRustCrate {
    crateName = "protoc-rust";
    version = "2.5.0";
    description = "protoc --rust_out=... available as API. protoc needs to be in $PATH, protoc-gen-run does not.\n";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "063j3sbxcbhd94dffwr35vgff5j4kc2gsz646icgzz15qiv37iwa";
    dependencies = mapFeatures features ([
      (crates."protobuf"."${deps."protoc_rust"."2.5.0"."protobuf"}" deps)
      (crates."protobuf_codegen"."${deps."protoc_rust"."2.5.0"."protobuf_codegen"}" deps)
      (crates."protoc"."${deps."protoc_rust"."2.5.0"."protoc"}" deps)
      (crates."tempfile"."${deps."protoc_rust"."2.5.0"."tempfile"}" deps)
    ]);
  };
  features_.protoc_rust."2.5.0" = deps: f: updateFeatures f (rec {
    protobuf."${deps.protoc_rust."2.5.0".protobuf}".default = true;
    protobuf_codegen."${deps.protoc_rust."2.5.0".protobuf_codegen}".default = true;
    protoc."${deps.protoc_rust."2.5.0".protoc}".default = true;
    protoc_rust."2.5.0".default = (f.protoc_rust."2.5.0".default or true);
    tempfile."${deps.protoc_rust."2.5.0".tempfile}".default = true;
  }) [
    (features_.protobuf."${deps."protoc_rust"."2.5.0"."protobuf"}" deps)
    (features_.protobuf_codegen."${deps."protoc_rust"."2.5.0"."protobuf_codegen"}" deps)
    (features_.protoc."${deps."protoc_rust"."2.5.0"."protoc"}" deps)
    (features_.tempfile."${deps."protoc_rust"."2.5.0"."tempfile"}" deps)
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
# rand_jitter-0.1.3

  crates.rand_jitter."0.1.3" = deps: { features?(features_.rand_jitter."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.3";
    description = "Random number generator based on timing jitter";
    authors = [ "The Rand Project Developers" ];
    sha256 = "1cb4q73rmh1inlx3liy6rabapcqh6p6c1plsd2lxw6dmi67d1qc3";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.3"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.3" or {});
  };
  features_.rand_jitter."0.1.3" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.3".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.3".rand_core}"."std" or false) ||
        (rand_jitter."0.1.3"."std" or false) ||
        (f."rand_jitter"."0.1.3"."std" or false); }
      { "${deps.rand_jitter."0.1.3".rand_core}".default = true; }
    ];
    rand_jitter."0.1.3".default = (f.rand_jitter."0.1.3".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.3".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.3"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.3"."winapi"}" deps)
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
# redox_syscall-0.1.54

  crates.redox_syscall."0.1.54" = deps: { features?(features_.redox_syscall."0.1.54" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.54";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1ndcp7brnvii87ndcd34fk846498r07iznphkslcy0shic9cp4rr";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.54" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.54".default = (f.redox_syscall."0.1.54".default or true);
  }) [];


# end
# redox_termios-0.1.1

  crates.redox_termios."0.1.1" = deps: { features?(features_.redox_termios."0.1.1" deps {}) }: buildRustCrate {
    crateName = "redox_termios";
    version = "0.1.1";
    description = "A Rust library to access Redox termios functions";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "04s6yyzjca552hdaqlvqhp3vw0zqbc304md5czyd3axh56iry8wh";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_termios."0.1.1" = deps: f: updateFeatures f (rec {
    redox_syscall."${deps.redox_termios."0.1.1".redox_syscall}".default = true;
    redox_termios."0.1.1".default = (f.redox_termios."0.1.1".default or true);
  }) [
    (features_.redox_syscall."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
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
# regex-1.1.5

  crates.regex."1.1.5" = deps: { features?(features_.regex."1.1.5" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.5";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0r2y4pmg2089qfi65cgzx49zsw4ncrlxnhalq21gv3v73bz5i3j8";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.5"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.5"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.5"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.5"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.5"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.5" or {});
  };
  features_.regex."1.1.5" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.5".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.5".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.5"."pattern" =
        (f.regex."1.1.5"."pattern" or false) ||
        (f.regex."1.1.5".unstable or false) ||
        (regex."1.1.5"."unstable" or false); }
      { "1.1.5"."use_std" =
        (f.regex."1.1.5"."use_std" or false) ||
        (f.regex."1.1.5".default or false) ||
        (regex."1.1.5"."default" or false); }
      { "1.1.5".default = (f.regex."1.1.5".default or true); }
    ];
    regex_syntax."${deps.regex."1.1.5".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.5".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.5".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.5"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.5"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.5"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.5"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.5"."utf8_ranges"}" deps)
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
# remove_dir_all-0.5.1

  crates.remove_dir_all."0.5.1" = deps: { features?(features_.remove_dir_all."0.5.1" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.1";
    description = "A safe, reliable implementation of remove_dir_all for Windows";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "1chx3yvfbj46xjz4bzsvps208l46hfbcy0sm98gpiya454n4rrl7";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
    ]) else []);
  };
  features_.remove_dir_all."0.5.1" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.1".default = (f.remove_dir_all."0.5.1".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.1".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.1".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."remove_dir_all"."0.5.1"."winapi"}" deps)
  ];


# end
# rustc-demangle-0.1.14

  crates.rustc_demangle."0.1.14" = deps: { features?(features_.rustc_demangle."0.1.14" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.14";
    description = "Rust compiler symbol demangling.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "07vl0ms3a27fpry9kh9piv08w7d51i5m7bgphk7pw4jygwzdy31f";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.14" or {});
  };
  features_.rustc_demangle."0.1.14" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.14"."compiler_builtins" =
        (f.rustc_demangle."0.1.14"."compiler_builtins" or false) ||
        (f.rustc_demangle."0.1.14".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.14"."rustc-dep-of-std" or false); }
      { "0.1.14"."core" =
        (f.rustc_demangle."0.1.14"."core" or false) ||
        (f.rustc_demangle."0.1.14".rustc-dep-of-std or false) ||
        (rustc_demangle."0.1.14"."rustc-dep-of-std" or false); }
      { "0.1.14".default = (f.rustc_demangle."0.1.14".default or true); }
    ];
  }) [];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_.rustc_version."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    description = "A library for querying the version of a installed rustc compiler";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.2.3"."semver"}" deps)
  ];


# end
# schannel-0.1.15

  crates.schannel."0.1.15" = deps: { features?(features_.schannel."0.1.15" deps {}) }: buildRustCrate {
    crateName = "schannel";
    version = "0.1.15";
    description = "Schannel bindings for rust, allowing SSL/TLS (e.g. https) without openssl";
    authors = [ "Steven Fackler <sfackler@gmail.com>" "Steffen Butzer <steffen.butzer@outlook.com>" ];
    sha256 = "1x9i0z9y8n5cg23ppyglgqdlz6rwcv2a489m5qpfk6l2ib8a1jdv";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."schannel"."0.1.15"."lazy_static"}" deps)
      (crates."winapi"."${deps."schannel"."0.1.15"."winapi"}" deps)
    ]);
  };
  features_.schannel."0.1.15" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.schannel."0.1.15".lazy_static}".default = true;
    schannel."0.1.15".default = (f.schannel."0.1.15".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.schannel."0.1.15".winapi}"."lmcons" = true; }
      { "${deps.schannel."0.1.15".winapi}"."minschannel" = true; }
      { "${deps.schannel."0.1.15".winapi}"."schannel" = true; }
      { "${deps.schannel."0.1.15".winapi}"."securitybaseapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."sspi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."sysinfoapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."timezoneapi" = true; }
      { "${deps.schannel."0.1.15".winapi}"."winbase" = true; }
      { "${deps.schannel."0.1.15".winapi}"."wincrypt" = true; }
      { "${deps.schannel."0.1.15".winapi}"."winerror" = true; }
      { "${deps.schannel."0.1.15".winapi}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."schannel"."0.1.15"."lazy_static"}" deps)
    (features_.winapi."${deps."schannel"."0.1.15"."winapi"}" deps)
  ];


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
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_.semver."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    description = "Semantic version parsing and comparison.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_.semver."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0"."serde" =
        (f.semver."0.9.0"."serde" or false) ||
        (f.semver."0.9.0".ci or false) ||
        (semver."0.9.0"."ci" or false); }
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (features_.semver_parser."${deps."semver"."0.9.0"."semver_parser"}" deps)
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_.semver_parser."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    description = "Parsing of the semver spec.\n";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_.semver_parser."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.90

  crates.serde."1.0.90" = deps: { features?(features_.serde."1.0.90" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.90";
    description = "A generic serialization/deserialization framework";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "10b6n74m1dvb667vrn1db47ncb4h0mkqbg1dsamqjvv5vl5b5j56";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.90" or {});
  };
  features_.serde."1.0.90" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.90"."serde_derive" =
        (f.serde."1.0.90"."serde_derive" or false) ||
        (f.serde."1.0.90".derive or false) ||
        (serde."1.0.90"."derive" or false); }
      { "1.0.90"."std" =
        (f.serde."1.0.90"."std" or false) ||
        (f.serde."1.0.90".default or false) ||
        (serde."1.0.90"."default" or false); }
      { "1.0.90"."unstable" =
        (f.serde."1.0.90"."unstable" or false) ||
        (f.serde."1.0.90".alloc or false) ||
        (serde."1.0.90"."alloc" or false); }
      { "1.0.90".default = (f.serde."1.0.90".default or true); }
    ];
  }) [];


# end
# serde_cbor-0.9.0

  crates.serde_cbor."0.9.0" = deps: { features?(features_.serde_cbor."0.9.0" deps {}) }: buildRustCrate {
    crateName = "serde_cbor";
    version = "0.9.0";
    description = "CBOR support for serde.";
    authors = [ "Pyfisch <pyfisch@gmail.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "1b7si54jp1c6dp79fxkkax2rxxa59f1l64n8f3snsfmdf5jhzb9k";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."serde_cbor"."0.9.0"."byteorder"}" deps)
      (crates."half"."${deps."serde_cbor"."0.9.0"."half"}" deps)
      (crates."serde"."${deps."serde_cbor"."0.9.0"."serde"}" deps)
    ]);
  };
  features_.serde_cbor."0.9.0" = deps: f: updateFeatures f (rec {
    byteorder."${deps.serde_cbor."0.9.0".byteorder}".default = true;
    half."${deps.serde_cbor."0.9.0".half}".default = true;
    serde."${deps.serde_cbor."0.9.0".serde}".default = true;
    serde_cbor."0.9.0".default = (f.serde_cbor."0.9.0".default or true);
  }) [
    (features_.byteorder."${deps."serde_cbor"."0.9.0"."byteorder"}" deps)
    (features_.half."${deps."serde_cbor"."0.9.0"."half"}" deps)
    (features_.serde."${deps."serde_cbor"."0.9.0"."serde"}" deps)
  ];


# end
# serde_derive-1.0.90

  crates.serde_derive."1.0.90" = deps: { features?(features_.serde_derive."1.0.90" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.90";
    description = "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1m4xgyl8jj3mxj0wszminzc1qf2gbkj9dpl17vi95nwl6m7i157y";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.90"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.90"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.90"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.90" or {});
  };
  features_.serde_derive."1.0.90" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.90".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.90".quote}".default = true;
    serde_derive."1.0.90".default = (f.serde_derive."1.0.90".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.90".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.90".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.90"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.90"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.90"."syn"}" deps)
  ];


# end
# smallvec-0.6.9

  crates.smallvec."0.6.9" = deps: { features?(features_.smallvec."0.6.9" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.9";
    description = "'Small vector' optimization: store up to a small number of items on the stack";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "0p96l51a2pq5y0vn48nhbm6qslbc6k8h28cxm0pmzkqmj7xynz6w";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.9" or {});
  };
  features_.smallvec."0.6.9" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.9"."std" =
        (f.smallvec."0.6.9"."std" or false) ||
        (f.smallvec."0.6.9".default or false) ||
        (smallvec."0.6.9"."default" or false); }
      { "0.6.9".default = (f.smallvec."0.6.9".default or true); }
    ];
  }) [];


# end
# socket2-0.3.8

  crates.socket2."0.3.8" = deps: { features?(features_.socket2."0.3.8" deps {}) }: buildRustCrate {
    crateName = "socket2";
    version = "0.3.8";
    description = "Utilities for handling networking sockets with a maximal amount of configuration\npossible intended.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a71m20jxmf9kqqinksphc7wj1j7q672q29cpza7p9siyzyfx598";
    dependencies = (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" then mapFeatures features ([
      (crates."cfg_if"."${deps."socket2"."0.3.8"."cfg_if"}" deps)
      (crates."libc"."${deps."socket2"."0.3.8"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."socket2"."0.3.8"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."socket2"."0.3.8"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."socket2"."0.3.8" or {});
  };
  features_.socket2."0.3.8" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.socket2."0.3.8".cfg_if}".default = true;
    libc."${deps.socket2."0.3.8".libc}".default = true;
    redox_syscall."${deps.socket2."0.3.8".redox_syscall}".default = true;
    socket2."0.3.8".default = (f.socket2."0.3.8".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.socket2."0.3.8".winapi}"."handleapi" = true; }
      { "${deps.socket2."0.3.8".winapi}"."minwindef" = true; }
      { "${deps.socket2."0.3.8".winapi}"."ws2def" = true; }
      { "${deps.socket2."0.3.8".winapi}"."ws2ipdef" = true; }
      { "${deps.socket2."0.3.8".winapi}"."ws2tcpip" = true; }
      { "${deps.socket2."0.3.8".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."socket2"."0.3.8"."cfg_if"}" deps)
    (features_.libc."${deps."socket2"."0.3.8"."libc"}" deps)
    (features_.redox_syscall."${deps."socket2"."0.3.8"."redox_syscall"}" deps)
    (features_.winapi."${deps."socket2"."0.3.8"."winapi"}" deps)
  ];


# end
# stable_deref_trait-1.1.1

  crates.stable_deref_trait."1.1.1" = deps: { features?(features_.stable_deref_trait."1.1.1" deps {}) }: buildRustCrate {
    crateName = "stable_deref_trait";
    version = "1.1.1";
    description = "An unsafe marker trait for types like Box and Rc that dereference to a stable address even when moved, and hence can be used with libraries such as owning_ref and rental.\n";
    authors = [ "Robert Grosse <n210241048576@gmail.com>" ];
    sha256 = "1xy9slzslrzr31nlnw52sl1d820b09y61b7f13lqgsn8n7y0l4g8";
    features = mkFeatures (features."stable_deref_trait"."1.1.1" or {});
  };
  features_.stable_deref_trait."1.1.1" = deps: f: updateFeatures f (rec {
    stable_deref_trait = fold recursiveUpdate {} [
      { "1.1.1"."std" =
        (f.stable_deref_trait."1.1.1"."std" or false) ||
        (f.stable_deref_trait."1.1.1".default or false) ||
        (stable_deref_trait."1.1.1"."default" or false); }
      { "1.1.1".default = (f.stable_deref_trait."1.1.1".default or true); }
    ];
  }) [];


# end
# stdinout-0.4.0

  crates.stdinout."0.4.0" = deps: { features?(features_.stdinout."0.4.0" deps {}) }: buildRustCrate {
    crateName = "stdinout";
    version = "0.4.0";
    description = "Simple wrapper for files or stdin/stdout.";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    sha256 = "197vgpiml8img4n1dgpa4gx7qi8kf87y3gbhlndqp72rifhk7jdd";
  };
  features_.stdinout."0.4.0" = deps: f: updateFeatures f (rec {
    stdinout."0.4.0".default = (f.stdinout."0.4.0".default or true);
  }) [];


# end
# syn-0.15.30

  crates.syn."0.15.30" = deps: { features?(features_.syn."0.15.30" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.30";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0rdjg37f7h1yqwmzqji4ll82xzzxv8k6vrf55p53c8dl49vqlgnx";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.30"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.30"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.30".quote or false then [ (crates.quote."${deps."syn"."0.15.30".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.30" or {});
  };
  features_.syn."0.15.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.30".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.30".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.30"."proc-macro" or false) ||
        (f."syn"."0.15.30"."proc-macro" or false); }
      { "${deps.syn."0.15.30".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.30".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.30".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.30".quote}"."proc-macro" or false) ||
        (syn."0.15.30"."proc-macro" or false) ||
        (f."syn"."0.15.30"."proc-macro" or false); }
      { "${deps.syn."0.15.30".quote}".default = (f.quote."${deps.syn."0.15.30".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.30"."clone-impls" =
        (f.syn."0.15.30"."clone-impls" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."derive" =
        (f.syn."0.15.30"."derive" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."parsing" =
        (f.syn."0.15.30"."parsing" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."printing" =
        (f.syn."0.15.30"."printing" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."proc-macro" =
        (f.syn."0.15.30"."proc-macro" or false) ||
        (f.syn."0.15.30".default or false) ||
        (syn."0.15.30"."default" or false); }
      { "0.15.30"."quote" =
        (f.syn."0.15.30"."quote" or false) ||
        (f.syn."0.15.30".printing or false) ||
        (syn."0.15.30"."printing" or false); }
      { "0.15.30".default = (f.syn."0.15.30".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.30".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.30"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.30"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.30"."unicode_xid"}" deps)
  ];


# end
# synstructure-0.10.1

  crates.synstructure."0.10.1" = deps: { features?(features_.synstructure."0.10.1" deps {}) }: buildRustCrate {
    crateName = "synstructure";
    version = "0.10.1";
    description = "Helper methods and macros for custom derives";
    authors = [ "Nika Layzell <nika@thelayzells.com>" ];
    sha256 = "0mx2vwd0d0f7hanz15nkp0ikkfjsx9rfkph7pynxyfbj45ank4g3";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
      (crates."quote"."${deps."synstructure"."0.10.1"."quote"}" deps)
      (crates."syn"."${deps."synstructure"."0.10.1"."syn"}" deps)
      (crates."unicode_xid"."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."synstructure"."0.10.1" or {});
  };
  features_.synstructure."0.10.1" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.synstructure."0.10.1".proc_macro2}".default = true;
    quote."${deps.synstructure."0.10.1".quote}".default = true;
    syn = fold recursiveUpdate {} [
      { "${deps.synstructure."0.10.1".syn}"."extra-traits" = true; }
      { "${deps.synstructure."0.10.1".syn}"."visit" = true; }
      { "${deps.synstructure."0.10.1".syn}".default = true; }
    ];
    synstructure."0.10.1".default = (f.synstructure."0.10.1".default or true);
    unicode_xid."${deps.synstructure."0.10.1".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."synstructure"."0.10.1"."proc_macro2"}" deps)
    (features_.quote."${deps."synstructure"."0.10.1"."quote"}" deps)
    (features_.syn."${deps."synstructure"."0.10.1"."syn"}" deps)
    (features_.unicode_xid."${deps."synstructure"."0.10.1"."unicode_xid"}" deps)
  ];


# end
# tar-0.4.22

  crates.tar."0.4.22" = deps: { features?(features_.tar."0.4.22" deps {}) }: buildRustCrate {
    crateName = "tar";
    version = "0.4.22";
    description = "A Rust implementation of a TAR file reader and writer. This library does not\ncurrently handle compression, but it is abstract over all I/O readers and\nwriters. Additionally, great lengths are taken to ensure that the entire\ncontents are never required to be entirely resident in memory all at once.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1y2b5av1ckf7v7rw1p59fjddn2jwzv0xr69lgdd4l41g43c3zq9j";
    dependencies = mapFeatures features ([
      (crates."filetime"."${deps."tar"."0.4.22"."filetime"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tar"."0.4.22"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tar"."0.4.22"."libc"}" deps)
    ]
      ++ (if features.tar."0.4.22".xattr or false then [ (crates.xattr."${deps."tar"."0.4.22".xattr}" deps) ] else [])) else []);
    features = mkFeatures (features."tar"."0.4.22" or {});
  };
  features_.tar."0.4.22" = deps: f: updateFeatures f (rec {
    filetime."${deps.tar."0.4.22".filetime}".default = true;
    libc."${deps.tar."0.4.22".libc}".default = true;
    redox_syscall."${deps.tar."0.4.22".redox_syscall}".default = true;
    tar = fold recursiveUpdate {} [
      { "0.4.22"."xattr" =
        (f.tar."0.4.22"."xattr" or false) ||
        (f.tar."0.4.22".default or false) ||
        (tar."0.4.22"."default" or false); }
      { "0.4.22".default = (f.tar."0.4.22".default or true); }
    ];
    xattr."${deps.tar."0.4.22".xattr}".default = true;
  }) [
    (features_.filetime."${deps."tar"."0.4.22"."filetime"}" deps)
    (features_.redox_syscall."${deps."tar"."0.4.22"."redox_syscall"}" deps)
    (features_.libc."${deps."tar"."0.4.22"."libc"}" deps)
    (features_.xattr."${deps."tar"."0.4.22"."xattr"}" deps)
  ];


# end
# tempfile-3.0.7

  crates.tempfile."3.0.7" = deps: { features?(features_.tempfile."3.0.7" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.0.7";
    description = "A library for managing temporary files and directories.\n";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    sha256 = "19h7ch8fvisxrrmabcnhlfj6b8vg34zaw8491x141p0n0727niaf";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.0.7"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.0.7"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.0.7"."winapi"}" deps)
    ]) else []);
  };
  features_.tempfile."3.0.7" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.0.7".cfg_if}".default = true;
    libc."${deps.tempfile."3.0.7".libc}".default = true;
    rand."${deps.tempfile."3.0.7".rand}".default = true;
    redox_syscall."${deps.tempfile."3.0.7".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.0.7".remove_dir_all}".default = true;
    tempfile."3.0.7".default = (f.tempfile."3.0.7".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.0.7".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.0.7".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.0.7".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."tempfile"."3.0.7"."cfg_if"}" deps)
    (features_.rand."${deps."tempfile"."3.0.7"."rand"}" deps)
    (features_.remove_dir_all."${deps."tempfile"."3.0.7"."remove_dir_all"}" deps)
    (features_.redox_syscall."${deps."tempfile"."3.0.7"."redox_syscall"}" deps)
    (features_.libc."${deps."tempfile"."3.0.7"."libc"}" deps)
    (features_.winapi."${deps."tempfile"."3.0.7"."winapi"}" deps)
  ];


# end
# tensorflow-0.13.0

  crates.tensorflow."0.13.0" = deps: { features?(features_.tensorflow."0.13.0" deps {}) }: buildRustCrate {
    crateName = "tensorflow";
    version = "0.13.0";
    description = "Rust language bindings for TensorFlow.";
    authors = [ "Adam Crume <acrume@google.com>" ];
    edition = "2018";
    sha256 = "1lrvjx4qrdai1i2cdrm6zbjal8mr81l53yf4s4zgnvd3i01j813x";
    dependencies = mapFeatures features ([
      (crates."aligned_alloc"."${deps."tensorflow"."0.13.0"."aligned_alloc"}" deps)
      (crates."byteorder"."${deps."tensorflow"."0.13.0"."byteorder"}" deps)
      (crates."crc"."${deps."tensorflow"."0.13.0"."crc"}" deps)
      (crates."libc"."${deps."tensorflow"."0.13.0"."libc"}" deps)
      (crates."num_complex"."${deps."tensorflow"."0.13.0"."num_complex"}" deps)
      (crates."tensorflow_sys"."${deps."tensorflow"."0.13.0"."tensorflow_sys"}" deps)
    ]);
    features = mkFeatures (features."tensorflow"."0.13.0" or {});
  };
  features_.tensorflow."0.13.0" = deps: f: updateFeatures f (rec {
    aligned_alloc."${deps.tensorflow."0.13.0".aligned_alloc}".default = true;
    byteorder."${deps.tensorflow."0.13.0".byteorder}".default = true;
    crc."${deps.tensorflow."0.13.0".crc}".default = true;
    libc."${deps.tensorflow."0.13.0".libc}".default = true;
    num_complex."${deps.tensorflow."0.13.0".num_complex}".default = (f.num_complex."${deps.tensorflow."0.13.0".num_complex}".default or false);
    tensorflow."0.13.0".default = (f.tensorflow."0.13.0".default or true);
    tensorflow_sys = fold recursiveUpdate {} [
      { "${deps.tensorflow."0.13.0".tensorflow_sys}"."examples_system_alloc" =
        (f.tensorflow_sys."${deps.tensorflow."0.13.0".tensorflow_sys}"."examples_system_alloc" or false) ||
        (tensorflow."0.13.0"."examples_system_alloc" or false) ||
        (f."tensorflow"."0.13.0"."examples_system_alloc" or false); }
      { "${deps.tensorflow."0.13.0".tensorflow_sys}"."tensorflow_gpu" =
        (f.tensorflow_sys."${deps.tensorflow."0.13.0".tensorflow_sys}"."tensorflow_gpu" or false) ||
        (tensorflow."0.13.0"."tensorflow_gpu" or false) ||
        (f."tensorflow"."0.13.0"."tensorflow_gpu" or false); }
      { "${deps.tensorflow."0.13.0".tensorflow_sys}".default = true; }
    ];
  }) [
    (features_.aligned_alloc."${deps."tensorflow"."0.13.0"."aligned_alloc"}" deps)
    (features_.byteorder."${deps."tensorflow"."0.13.0"."byteorder"}" deps)
    (features_.crc."${deps."tensorflow"."0.13.0"."crc"}" deps)
    (features_.libc."${deps."tensorflow"."0.13.0"."libc"}" deps)
    (features_.num_complex."${deps."tensorflow"."0.13.0"."num_complex"}" deps)
    (features_.tensorflow_sys."${deps."tensorflow"."0.13.0"."tensorflow_sys"}" deps)
  ];


# end
# tensorflow-sys-0.16.0

  crates.tensorflow_sys."0.16.0" = deps: { features?(features_.tensorflow_sys."0.16.0" deps {}) }: buildRustCrate {
    crateName = "tensorflow-sys";
    version = "0.16.0";
    description = "The package provides bindings to TensorFlow.";
    authors = [ "Adam Crume <acrume@google.com>" "Ivan Ukhov <ivan.ukhov@gmail.com>" ];
    edition = "2018";
    sha256 = "160aybvzb5cgh5scpx46v99j6lbn0a09m65ddmqni2zv0lskdmxi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."tensorflow_sys"."0.16.0"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."curl"."${deps."tensorflow_sys"."0.16.0"."curl"}" deps)
      (crates."flate2"."${deps."tensorflow_sys"."0.16.0"."flate2"}" deps)
      (crates."pkg_config"."${deps."tensorflow_sys"."0.16.0"."pkg_config"}" deps)
      (crates."semver"."${deps."tensorflow_sys"."0.16.0"."semver"}" deps)
      (crates."tar"."${deps."tensorflow_sys"."0.16.0"."tar"}" deps)
    ]);
    features = mkFeatures (features."tensorflow_sys"."0.16.0" or {});
  };
  features_.tensorflow_sys."0.16.0" = deps: f: updateFeatures f (rec {
    curl."${deps.tensorflow_sys."0.16.0".curl}".default = true;
    flate2."${deps.tensorflow_sys."0.16.0".flate2}".default = true;
    libc."${deps.tensorflow_sys."0.16.0".libc}".default = true;
    pkg_config."${deps.tensorflow_sys."0.16.0".pkg_config}".default = true;
    semver."${deps.tensorflow_sys."0.16.0".semver}".default = true;
    tar."${deps.tensorflow_sys."0.16.0".tar}".default = true;
    tensorflow_sys."0.16.0".default = (f.tensorflow_sys."0.16.0".default or true);
  }) [
    (features_.libc."${deps."tensorflow_sys"."0.16.0"."libc"}" deps)
    (features_.curl."${deps."tensorflow_sys"."0.16.0"."curl"}" deps)
    (features_.flate2."${deps."tensorflow_sys"."0.16.0"."flate2"}" deps)
    (features_.pkg_config."${deps."tensorflow_sys"."0.16.0"."pkg_config"}" deps)
    (features_.semver."${deps."tensorflow_sys"."0.16.0"."semver"}" deps)
    (features_.tar."${deps."tensorflow_sys"."0.16.0"."tar"}" deps)
  ];


# end
# termion-1.5.1

  crates.termion."1.5.1" = deps: { features?(features_.termion."1.5.1" deps {}) }: buildRustCrate {
    crateName = "termion";
    version = "1.5.1";
    description = "A bindless library for manipulating terminals.";
    authors = [ "ticki <Ticki@users.noreply.github.com>" "gycos <alexandre.bury@gmail.com>" "IGI-111 <igi-111@protonmail.com>" ];
    sha256 = "02gq4vd8iws1f3gjrgrgpajsk2bk43nds5acbbb4s8dvrdvr8nf1";
    dependencies = (if !(kernel == "redox") then mapFeatures features ([
      (crates."libc"."${deps."termion"."1.5.1"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."termion"."1.5.1"."redox_syscall"}" deps)
      (crates."redox_termios"."${deps."termion"."1.5.1"."redox_termios"}" deps)
    ]) else []);
  };
  features_.termion."1.5.1" = deps: f: updateFeatures f (rec {
    libc."${deps.termion."1.5.1".libc}".default = true;
    redox_syscall."${deps.termion."1.5.1".redox_syscall}".default = true;
    redox_termios."${deps.termion."1.5.1".redox_termios}".default = true;
    termion."1.5.1".default = (f.termion."1.5.1".default or true);
  }) [
    (features_.libc."${deps."termion"."1.5.1"."libc"}" deps)
    (features_.redox_syscall."${deps."termion"."1.5.1"."redox_syscall"}" deps)
    (features_.redox_termios."${deps."termion"."1.5.1"."redox_termios"}" deps)
  ];


# end
# termios-0.3.1

  crates.termios."0.3.1" = deps: { features?(features_.termios."0.3.1" deps {}) }: buildRustCrate {
    crateName = "termios";
    version = "0.3.1";
    description = "Safe bindings for the termios library.";
    authors = [ "David Cuddeback <david.cuddeback@gmail.com>" ];
    sha256 = "1h0fwglrhay85fkbl05ym5gh8hxzl7pyz0a51zfmmngxrf7823c2";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."termios"."0.3.1"."libc"}" deps)
    ]);
  };
  features_.termios."0.3.1" = deps: f: updateFeatures f (rec {
    libc."${deps.termios."0.3.1".libc}".default = true;
    termios."0.3.1".default = (f.termios."0.3.1".default or true);
  }) [
    (features_.libc."${deps."termios"."0.3.1"."libc"}" deps)
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
# threadpool-1.7.1

  crates.threadpool."1.7.1" = deps: { features?(features_.threadpool."1.7.1" deps {}) }: buildRustCrate {
    crateName = "threadpool";
    version = "1.7.1";
    description = "A thread pool for running a number of jobs on a fixed set of worker threads.\n";
    authors = [ "The Rust Project Developers" "Corey Farwell <coreyf@rwell.org>" "Stefan Schindler <dns2utf8@estada.ch>" ];
    sha256 = "09g715plrn59kasvigqjrjqzcgqnaf6v6pia0xx03f18kvfmkq06";
    dependencies = mapFeatures features ([
      (crates."num_cpus"."${deps."threadpool"."1.7.1"."num_cpus"}" deps)
    ]);
  };
  features_.threadpool."1.7.1" = deps: f: updateFeatures f (rec {
    num_cpus."${deps.threadpool."1.7.1".num_cpus}".default = true;
    threadpool."1.7.1".default = (f.threadpool."1.7.1".default or true);
  }) [
    (features_.num_cpus."${deps."threadpool"."1.7.1"."num_cpus"}" deps)
  ];


# end
# toml-0.4.10

  crates.toml."0.4.10" = deps: { features?(features_.toml."0.4.10" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.4.10";
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides\nimplementations of the standard Serialize/Deserialize traits for TOML data to\nfacilitate deserializing and serializing Rust structures.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0fs4kxl86w3kmgwcgcv23nk79zagayz1spg281r83w0ywf88d6f1";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.4.10"."serde"}" deps)
    ]);
  };
  features_.toml."0.4.10" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.4.10".serde}".default = true;
    toml."0.4.10".default = (f.toml."0.4.10".default or true);
  }) [
    (features_.serde."${deps."toml"."0.4.10"."serde"}" deps)
  ];


# end
# toml-0.5.0

  crates.toml."0.5.0" = deps: { features?(features_.toml."0.5.0" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.5.0";
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides\nimplementations of the standard Serialize/Deserialize traits for TOML data to\nfacilitate deserializing and serializing Rust structures.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0l2lqzbn5g9l376k01isq1nhb14inkr4c50qbjbdzh5qysz7dyk5";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.5.0"."serde"}" deps)
    ]);
    features = mkFeatures (features."toml"."0.5.0" or {});
  };
  features_.toml."0.5.0" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.5.0".serde}".default = true;
    toml = fold recursiveUpdate {} [
      { "0.5.0"."linked-hash-map" =
        (f.toml."0.5.0"."linked-hash-map" or false) ||
        (f.toml."0.5.0".preserve_order or false) ||
        (toml."0.5.0"."preserve_order" or false); }
      { "0.5.0".default = (f.toml."0.5.0".default or true); }
    ];
  }) [
    (features_.serde."${deps."toml"."0.5.0"."serde"}" deps)
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
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    description = "Determine displayed width of `char` and `str` types\naccording to Unicode Standard Annex #11 rules.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
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
# vcpkg-0.2.6

  crates.vcpkg."0.2.6" = deps: { features?(features_.vcpkg."0.2.6" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.6";
    description = "A library to find native dependencies in a vcpkg tree at build\ntime in order to be used in Cargo build scripts.\n";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1ig6jqpzzl1z9vk4qywgpfr4hfbd8ny8frqsgm3r449wkc4n1i5x";
  };
  features_.vcpkg."0.2.6" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.6".default = (f.vcpkg."0.2.6".default or true);
  }) [];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    description = "Types and constants for WinAPI bindings. See README for list of crates providing function bindings.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
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
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    description = "Common code for build.rs in WinAPI -sys crates.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


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
# xattr-0.2.2

  crates.xattr."0.2.2" = deps: { features?(features_.xattr."0.2.2" deps {}) }: buildRustCrate {
    crateName = "xattr";
    version = "0.2.2";
    description = "unix extended filesystem attributes";
    authors = [ "Steven Allen <steven@stebalien.com>" ];
    sha256 = "01zqnn6bhrd58hvpj3y1nqnbmlswrvsdapn2zbi7h1bh5lspiyk5";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."xattr"."0.2.2"."libc"}" deps)
    ]);
    features = mkFeatures (features."xattr"."0.2.2" or {});
  };
  features_.xattr."0.2.2" = deps: f: updateFeatures f (rec {
    libc."${deps.xattr."0.2.2".libc}".default = true;
    xattr = fold recursiveUpdate {} [
      { "0.2.2"."unsupported" =
        (f.xattr."0.2.2"."unsupported" or false) ||
        (f.xattr."0.2.2".default or false) ||
        (xattr."0.2.2"."default" or false); }
      { "0.2.2".default = (f.xattr."0.2.2".default or true); }
    ];
  }) [
    (features_.libc."${deps."xattr"."0.2.2"."libc"}" deps)
  ];


# end
}
