{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.6.10

  crates.aho_corasick."0.6.10" = deps: { features?(features_.aho_corasick."0.6.10" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.6.10";
    description = "Fast multiple substring searching with finite state machines.";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0bhasxfpmfmz1460chwsx59vdld05axvmk1nbp3sd48xav3d108p";
    libName = "aho_corasick";
    crateBin =
      [{  name = "aho-corasick-dot";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
    ]);
  };
  features_.aho_corasick."0.6.10" = deps: f: updateFeatures f (rec {
    aho_corasick."0.6.10".default = (f.aho_corasick."0.6.10".default or true);
    memchr."${deps.aho_corasick."0.6.10".memchr}".default = true;
  }) [
    (features_.memchr."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
  ];


# end
# ansi_term-0.9.0

  crates.ansi_term."0.9.0" = deps: { features?(features_.ansi_term."0.9.0" deps {}) }: buildRustCrate {
    crateName = "ansi_term";
    version = "0.9.0";
    description = "Library for ANSI terminal colours and styles (bold, underline)";
    authors = [ "ogham@bsago.me" "Ryan Scheel (Havvy) <ryan.havvy@gmail.com>" ];
    sha256 = "1vcd8m2hglrdi4zmqnkkz5zy3c73ifgii245k7vj6qr5dzpn9hij";
  };
  features_.ansi_term."0.9.0" = deps: f: updateFeatures f (rec {
    ansi_term."0.9.0".default = (f.ansi_term."0.9.0".default or true);
  }) [];


# end
# approx-0.1.1

  crates.approx."0.1.1" = deps: { features?(features_.approx."0.1.1" deps {}) }: buildRustCrate {
    crateName = "approx";
    version = "0.1.1";
    description = "Approximate floating point equality comparisons and assertions.";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" ];
    sha256 = "1wrhjjqhdg9qvw59489iw3cy1dy96v63isbflbkwbrv79ayksa3c";
    features = mkFeatures (features."approx"."0.1.1" or {});
  };
  features_.approx."0.1.1" = deps: f: updateFeatures f (rec {
    approx."0.1.1".default = (f.approx."0.1.1".default or true);
  }) [];


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
# backtrace-0.3.18

  crates.backtrace."0.3.18" = deps: { features?(features_.backtrace."0.3.18" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.18";
    description = "A library to acquire a stack trace (backtrace) at runtime in a Rust program.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "1wip6h7hqsyzk2x776r8rfbdy0aria2d30sddksykrlichj59mk6";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.18"."cfg_if"}" deps)
      (crates."libc"."${deps."backtrace"."0.3.18"."libc"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.18"."rustc_demangle"}" deps)
    ]
      ++ (if features.backtrace."0.3.18".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.18".backtrace_sys}" deps) ] else []))
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.18"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.18" or {});
  };
  features_.backtrace."0.3.18" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.18".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.18"."addr2line" =
        (f.backtrace."0.3.18"."addr2line" or false) ||
        (f.backtrace."0.3.18".gimli-symbolize or false) ||
        (backtrace."0.3.18"."gimli-symbolize" or false); }
      { "0.3.18"."backtrace-sys" =
        (f.backtrace."0.3.18"."backtrace-sys" or false) ||
        (f.backtrace."0.3.18".libbacktrace or false) ||
        (backtrace."0.3.18"."libbacktrace" or false); }
      { "0.3.18"."coresymbolication" =
        (f.backtrace."0.3.18"."coresymbolication" or false) ||
        (f.backtrace."0.3.18".default or false) ||
        (backtrace."0.3.18"."default" or false); }
      { "0.3.18"."dbghelp" =
        (f.backtrace."0.3.18"."dbghelp" or false) ||
        (f.backtrace."0.3.18".default or false) ||
        (backtrace."0.3.18"."default" or false); }
      { "0.3.18"."dladdr" =
        (f.backtrace."0.3.18"."dladdr" or false) ||
        (f.backtrace."0.3.18".default or false) ||
        (backtrace."0.3.18"."default" or false); }
      { "0.3.18"."findshlibs" =
        (f.backtrace."0.3.18"."findshlibs" or false) ||
        (f.backtrace."0.3.18".gimli-symbolize or false) ||
        (backtrace."0.3.18"."gimli-symbolize" or false); }
      { "0.3.18"."libbacktrace" =
        (f.backtrace."0.3.18"."libbacktrace" or false) ||
        (f.backtrace."0.3.18".default or false) ||
        (backtrace."0.3.18"."default" or false); }
      { "0.3.18"."libunwind" =
        (f.backtrace."0.3.18"."libunwind" or false) ||
        (f.backtrace."0.3.18".default or false) ||
        (backtrace."0.3.18"."default" or false); }
      { "0.3.18"."memmap" =
        (f.backtrace."0.3.18"."memmap" or false) ||
        (f.backtrace."0.3.18".gimli-symbolize or false) ||
        (backtrace."0.3.18"."gimli-symbolize" or false); }
      { "0.3.18"."rustc-serialize" =
        (f.backtrace."0.3.18"."rustc-serialize" or false) ||
        (f.backtrace."0.3.18".serialize-rustc or false) ||
        (backtrace."0.3.18"."serialize-rustc" or false); }
      { "0.3.18"."serde" =
        (f.backtrace."0.3.18"."serde" or false) ||
        (f.backtrace."0.3.18".serialize-serde or false) ||
        (backtrace."0.3.18"."serialize-serde" or false); }
      { "0.3.18"."serde_derive" =
        (f.backtrace."0.3.18"."serde_derive" or false) ||
        (f.backtrace."0.3.18".serialize-serde or false) ||
        (backtrace."0.3.18"."serialize-serde" or false); }
      { "0.3.18"."std" =
        (f.backtrace."0.3.18"."std" or false) ||
        (f.backtrace."0.3.18".default or false) ||
        (backtrace."0.3.18"."default" or false); }
      { "0.3.18".default = (f.backtrace."0.3.18".default or true); }
    ];
    backtrace_sys."${deps.backtrace."0.3.18".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.18".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.18".libc}".default = (f.libc."${deps.backtrace."0.3.18".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.18".rustc_demangle}".default = true;
  }) [
    (features_.backtrace_sys."${deps."backtrace"."0.3.18"."backtrace_sys"}" deps)
    (features_.cfg_if."${deps."backtrace"."0.3.18"."cfg_if"}" deps)
    (features_.libc."${deps."backtrace"."0.3.18"."libc"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.18"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.18"."autocfg"}" deps)
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
# cgmath-0.16.1

  crates.cgmath."0.16.1" = deps: { features?(features_.cgmath."0.16.1" deps {}) }: buildRustCrate {
    crateName = "cgmath";
    version = "0.16.1";
    description = "A linear algebra and mathematics library for computer graphics.";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" ];
    sha256 = "12xwzi8j3z18f2qlgv9kl83sp12dps9l55qp58id3zg62q4psbnm";
    dependencies = mapFeatures features ([
      (crates."approx"."${deps."cgmath"."0.16.1"."approx"}" deps)
      (crates."num_traits"."${deps."cgmath"."0.16.1"."num_traits"}" deps)
      (crates."rand"."${deps."cgmath"."0.16.1"."rand"}" deps)
    ]);
    features = mkFeatures (features."cgmath"."0.16.1" or {});
  };
  features_.cgmath."0.16.1" = deps: f: updateFeatures f (rec {
    approx."${deps.cgmath."0.16.1".approx}".default = true;
    cgmath."0.16.1".default = (f.cgmath."0.16.1".default or true);
    num_traits."${deps.cgmath."0.16.1".num_traits}".default = true;
    rand."${deps.cgmath."0.16.1".rand}".default = true;
  }) [
    (features_.approx."${deps."cgmath"."0.16.1"."approx"}" deps)
    (features_.num_traits."${deps."cgmath"."0.16.1"."num_traits"}" deps)
    (features_.rand."${deps."cgmath"."0.16.1"."rand"}" deps)
  ];


# end
# colored-1.8.0

  crates.colored."1.8.0" = deps: { features?(features_.colored."1.8.0" deps {}) }: buildRustCrate {
    crateName = "colored";
    version = "1.8.0";
    description = "The most simple way to add colors in your terminal";
    authors = [ "Thomas Wickham <mackwic@gmail.com>" ];
    sha256 = "1gwbq1g26n49wjqacdnr5gc3rfms7zkm8rbw5mc9zcdi6x2wmkya";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."colored"."1.8.0"."lazy_static"}" deps)
      (crates."winconsole"."${deps."colored"."1.8.0"."winconsole"}" deps)
    ]);
    features = mkFeatures (features."colored"."1.8.0" or {});
  };
  features_.colored."1.8.0" = deps: f: updateFeatures f (rec {
    colored."1.8.0".default = (f.colored."1.8.0".default or true);
    lazy_static."${deps.colored."1.8.0".lazy_static}".default = true;
    winconsole."${deps.colored."1.8.0".winconsole}".default = true;
  }) [
    (features_.lazy_static."${deps."colored"."1.8.0"."lazy_static"}" deps)
    (features_.winconsole."${deps."colored"."1.8.0"."winconsole"}" deps)
  ];


# end
# conllx-0.10.2

  crates.conllx."0.10.2" = deps: { features?(features_.conllx."0.10.2" deps {}) }: buildRustCrate {
    crateName = "conllx";
    version = "0.10.2";
    description = "Readers/writers for the CoNLL-X dependency format";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    sha256 = "01kz1vz5ycsnja1aci0linfz2d4ppraiisaz59l8a4vmclvcxh9n";
    dependencies = mapFeatures features ([
      (crates."failure"."${deps."conllx"."0.10.2"."failure"}" deps)
      (crates."itertools"."${deps."conllx"."0.10.2"."itertools"}" deps)
      (crates."lazy_init"."${deps."conllx"."0.10.2"."lazy_init"}" deps)
      (crates."petgraph"."${deps."conllx"."0.10.2"."petgraph"}" deps)
    ]);
  };
  features_.conllx."0.10.2" = deps: f: updateFeatures f (rec {
    conllx."0.10.2".default = (f.conllx."0.10.2".default or true);
    failure."${deps.conllx."0.10.2".failure}".default = true;
    itertools."${deps.conllx."0.10.2".itertools}".default = true;
    lazy_init."${deps.conllx."0.10.2".lazy_init}".default = true;
    petgraph."${deps.conllx."0.10.2".petgraph}".default = true;
  }) [
    (features_.failure."${deps."conllx"."0.10.2"."failure"}" deps)
    (features_.itertools."${deps."conllx"."0.10.2"."itertools"}" deps)
    (features_.lazy_init."${deps."conllx"."0.10.2"."lazy_init"}" deps)
    (features_.petgraph."${deps."conllx"."0.10.2"."petgraph"}" deps)
  ];


# end
# difference-1.0.0

  crates.difference."1.0.0" = deps: { features?(features_.difference."1.0.0" deps {}) }: buildRustCrate {
    crateName = "difference";
    version = "1.0.0";
    description = "A Rust text diffing and assertion library.";
    authors = [ "Johann Hofmann <mail@johann-hofmann.com>" ];
    sha256 = "0r1p2diin8zykfiifv6v9i3ajimdb1rg6qzxkrfw2n2iy57846qn";
    crateBin =
      [{  name = "difference"; }];
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."difference"."1.0.0" or {});
  };
  features_.difference."1.0.0" = deps: f: updateFeatures f (rec {
    difference = fold recursiveUpdate {} [
      { "1.0.0"."getopts" =
        (f.difference."1.0.0"."getopts" or false) ||
        (f.difference."1.0.0".bin or false) ||
        (difference."1.0.0"."bin" or false); }
      { "1.0.0".default = (f.difference."1.0.0".default or true); }
    ];
  }) [];


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
# flate2-0.2.20

  crates.flate2."0.2.20" = deps: { features?(features_.flate2."0.2.20" deps {}) }: buildRustCrate {
    crateName = "flate2";
    version = "0.2.20";
    description = "Bindings to miniz.c for DEFLATE compression and decompression exposed as\nReader/Writer streams. Contains bindings for zlib, deflate, and gzip-based\nstreams.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1am0d2vmqym1vcg7rvv516vpcrbhdn1jisy0q03r3nbzdzh54ppl";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."flate2"."0.2.20"."libc"}" deps)
    ]
      ++ (if features.flate2."0.2.20".miniz-sys or false then [ (crates.miniz_sys."${deps."flate2"."0.2.20".miniz_sys}" deps) ] else []));
    features = mkFeatures (features."flate2"."0.2.20" or {});
  };
  features_.flate2."0.2.20" = deps: f: updateFeatures f (rec {
    flate2 = fold recursiveUpdate {} [
      { "0.2.20"."futures" =
        (f.flate2."0.2.20"."futures" or false) ||
        (f.flate2."0.2.20".tokio or false) ||
        (flate2."0.2.20"."tokio" or false); }
      { "0.2.20"."libz-sys" =
        (f.flate2."0.2.20"."libz-sys" or false) ||
        (f.flate2."0.2.20".zlib or false) ||
        (flate2."0.2.20"."zlib" or false); }
      { "0.2.20"."miniz-sys" =
        (f.flate2."0.2.20"."miniz-sys" or false) ||
        (f.flate2."0.2.20".default or false) ||
        (flate2."0.2.20"."default" or false); }
      { "0.2.20"."tokio-io" =
        (f.flate2."0.2.20"."tokio-io" or false) ||
        (f.flate2."0.2.20".tokio or false) ||
        (flate2."0.2.20"."tokio" or false); }
      { "0.2.20".default = (f.flate2."0.2.20".default or true); }
    ];
    libc."${deps.flate2."0.2.20".libc}".default = true;
    miniz_sys."${deps.flate2."0.2.20".miniz_sys}".default = true;
  }) [
    (features_.libc."${deps."flate2"."0.2.20"."libc"}" deps)
    (features_.miniz_sys."${deps."flate2"."0.2.20"."miniz_sys"}" deps)
  ];


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
# getopts-0.2.19

  crates.getopts."0.2.19" = deps: { features?(features_.getopts."0.2.19" deps {}) }: buildRustCrate {
    crateName = "getopts";
    version = "0.2.19";
    description = "getopts-like option parsing.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "01wcnfvhza4pr4g31v3mvq0f83fmnj0walyv82rvaiqbl5srgyg6";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."getopts"."0.2.19"."unicode_width"}" deps)
    ]);
  };
  features_.getopts."0.2.19" = deps: f: updateFeatures f (rec {
    getopts."0.2.19".default = (f.getopts."0.2.19".default or true);
    unicode_width."${deps.getopts."0.2.19".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."getopts"."0.2.19"."unicode_width"}" deps)
  ];


# end
# itertools-0.6.5

  crates.itertools."0.6.5" = deps: { features?(features_.itertools."0.6.5" deps {}) }: buildRustCrate {
    crateName = "itertools";
    version = "0.6.5";
    description = "Extra iterator adaptors, iterator methods, free functions, and macros.";
    authors = [ "bluss" ];
    sha256 = "0gbhgn7s8qkxxw10i514fzpqnc3aissn4kcgylm2cvnv9zmg8mw1";
    dependencies = mapFeatures features ([
      (crates."either"."${deps."itertools"."0.6.5"."either"}" deps)
    ]);
  };
  features_.itertools."0.6.5" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.6.5".either}".default = (f.either."${deps.itertools."0.6.5".either}".default or false);
    itertools."0.6.5".default = (f.itertools."0.6.5".default or true);
  }) [
    (features_.either."${deps."itertools"."0.6.5"."either"}" deps)
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
# lazy_static-0.2.11

  crates.lazy_static."0.2.11" = deps: { features?(features_.lazy_static."0.2.11" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "0.2.11";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1x6871cvpy5b96yv4c7jvpq316fp5d4609s9py7qk6cd6x9k34vm";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."0.2.11" or {});
  };
  features_.lazy_static."0.2.11" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "0.2.11"."compiletest_rs" =
        (f.lazy_static."0.2.11"."compiletest_rs" or false) ||
        (f.lazy_static."0.2.11".compiletest or false) ||
        (lazy_static."0.2.11"."compiletest" or false); }
      { "0.2.11"."nightly" =
        (f.lazy_static."0.2.11"."nightly" or false) ||
        (f.lazy_static."0.2.11".spin_no_std or false) ||
        (lazy_static."0.2.11"."spin_no_std" or false); }
      { "0.2.11"."spin" =
        (f.lazy_static."0.2.11"."spin" or false) ||
        (f.lazy_static."0.2.11".spin_no_std or false) ||
        (lazy_static."0.2.11"."spin_no_std" or false); }
      { "0.2.11".default = (f.lazy_static."0.2.11".default or true); }
    ];
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
# maplit-0.1.6

  crates.maplit."0.1.6" = deps: { features?(features_.maplit."0.1.6" deps {}) }: buildRustCrate {
    crateName = "maplit";
    version = "0.1.6";
    description = "Container / collection literal macros for HashMap, HashSet, BTreeMap, BTreeSet.";
    authors = [ "bluss" ];
    sha256 = "1f8kf5v7xra8ssvh5c10qlacbk4l0z2817pkscflx5s5q6y7925h";
  };
  features_.maplit."0.1.6" = deps: f: updateFeatures f (rec {
    maplit."0.1.6".default = (f.maplit."0.1.6".default or true);
  }) [];


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
# miniz-sys-0.1.12

  crates.miniz_sys."0.1.12" = deps: { features?(features_.miniz_sys."0.1.12" deps {}) }: buildRustCrate {
    crateName = "miniz-sys";
    version = "0.1.12";
    description = "Bindings to the miniz.c library.\n";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0id77wj1wcrp848hv66p8hazrkxm7jm3gim2m60z22ddsvlxh69q";
    libPath = "lib.rs";
    libName = "miniz_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."miniz_sys"."0.1.12"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_sys"."0.1.12"."cc"}" deps)
    ]);
  };
  features_.miniz_sys."0.1.12" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_sys."0.1.12".cc}".default = true;
    libc."${deps.miniz_sys."0.1.12".libc}".default = true;
    miniz_sys."0.1.12".default = (f.miniz_sys."0.1.12".default or true);
  }) [
    (features_.libc."${deps."miniz_sys"."0.1.12"."libc"}" deps)
    (features_.cc."${deps."miniz_sys"."0.1.12"."cc"}" deps)
  ];


# end
# num-traits-0.1.43

  crates.num_traits."0.1.43" = deps: { features?(features_.num_traits."0.1.43" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.1.43";
    description = "Numeric traits for generic mathematics";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1zdzx78vrcg3f39w94pqjs1mwxl1phyv7843hwgwkzggwcxhhf6s";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_traits"."0.1.43"."num_traits"}" deps)
    ]);
  };
  features_.num_traits."0.1.43" = deps: f: updateFeatures f (rec {
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_traits."0.1.43".num_traits}".default = true; }
      { "0.1.43".default = (f.num_traits."0.1.43".default or true); }
    ];
  }) [
    (features_.num_traits."${deps."num_traits"."0.1.43"."num_traits"}" deps)
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
# pretty_assertions-0.3.4

  crates.pretty_assertions."0.3.4" = deps: { features?(features_.pretty_assertions."0.3.4" deps {}) }: buildRustCrate {
    crateName = "pretty_assertions";
    version = "0.3.4";
    description = "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs.";
    authors = [ "Colin Kiegel <kiegel@gmx.de>" "Florent Fayolle <florent.fayolle69@gmail.com>" ];
    sha256 = "0v0gz935k72k5j3kn14pl8fl35hgibvyvifbi0hdgxyhbr961fbg";
    dependencies = mapFeatures features ([
      (crates."ansi_term"."${deps."pretty_assertions"."0.3.4"."ansi_term"}" deps)
      (crates."difference"."${deps."pretty_assertions"."0.3.4"."difference"}" deps)
    ]);
  };
  features_.pretty_assertions."0.3.4" = deps: f: updateFeatures f (rec {
    ansi_term."${deps.pretty_assertions."0.3.4".ansi_term}".default = true;
    difference."${deps.pretty_assertions."0.3.4".difference}".default = true;
    pretty_assertions."0.3.4".default = (f.pretty_assertions."0.3.4".default or true);
  }) [
    (features_.ansi_term."${deps."pretty_assertions"."0.3.4"."ansi_term"}" deps)
    (features_.difference."${deps."pretty_assertions"."0.3.4"."difference"}" deps)
  ];


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
# rand-0.3.23

  crates.rand."0.3.23" = deps: { features?(features_.rand."0.3.23" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.3.23";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "118rairvv46npqqx7hmkf97kkimjrry9z31z4inxcv2vn0nj1s2g";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."rand"."0.3.23"."libc"}" deps)
      (crates."rand"."${deps."rand"."0.3.23"."rand"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.3.23" or {});
  };
  features_.rand."0.3.23" = deps: f: updateFeatures f (rec {
    libc."${deps.rand."0.3.23".libc}".default = true;
    rand = fold recursiveUpdate {} [
      { "${deps.rand."0.3.23".rand}".default = true; }
      { "0.3.23"."i128_support" =
        (f.rand."0.3.23"."i128_support" or false) ||
        (f.rand."0.3.23".nightly or false) ||
        (rand."0.3.23"."nightly" or false); }
      { "0.3.23".default = (f.rand."0.3.23".default or true); }
    ];
  }) [
    (features_.libc."${deps."rand"."0.3.23"."libc"}" deps)
    (features_.rand."${deps."rand"."0.3.23"."rand"}" deps)
  ];


# end
# rand-0.4.6

  crates.rand."0.4.6" = deps: { features?(features_.rand."0.4.6" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.4.6";
    description = "Random number generators and other randomness functionality.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0c3rmg5q7d6qdi7cbmg5py9alm70wd3xsg0mmcawrnl35qv37zfs";
    dependencies = (if abi == "sgx" then mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.4.6"."rand_core"}" deps)
      (crates."rdrand"."${deps."rand"."0.4.6"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.rand."0.4.6".libc or false then [ (crates.libc."${deps."rand"."0.4.6".libc}" deps) ] else [])) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.4.6"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand"."0.4.6" or {});
  };
  features_.rand."0.4.6" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."${deps.rand."0.4.6".fuchsia_cprng}".default = true;
    libc."${deps.rand."0.4.6".libc}".default = true;
    rand = fold recursiveUpdate {} [
      { "0.4.6"."i128_support" =
        (f.rand."0.4.6"."i128_support" or false) ||
        (f.rand."0.4.6".nightly or false) ||
        (rand."0.4.6"."nightly" or false); }
      { "0.4.6"."libc" =
        (f.rand."0.4.6"."libc" or false) ||
        (f.rand."0.4.6".std or false) ||
        (rand."0.4.6"."std" or false); }
      { "0.4.6"."std" =
        (f.rand."0.4.6"."std" or false) ||
        (f.rand."0.4.6".default or false) ||
        (rand."0.4.6"."default" or false); }
      { "0.4.6".default = (f.rand."0.4.6".default or true); }
    ];
    rand_core."${deps.rand."0.4.6".rand_core}".default = (f.rand_core."${deps.rand."0.4.6".rand_core}".default or false);
    rdrand."${deps.rand."0.4.6".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.4.6".winapi}"."minwindef" = true; }
      { "${deps.rand."0.4.6".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."profileapi" = true; }
      { "${deps.rand."0.4.6".winapi}"."winnt" = true; }
      { "${deps.rand."0.4.6".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand"."0.4.6"."rand_core"}" deps)
    (features_.rdrand."${deps."rand"."0.4.6"."rdrand"}" deps)
    (features_.fuchsia_cprng."${deps."rand"."0.4.6"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand"."0.4.6"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.4.6"."winapi"}" deps)
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
# regex-0.2.11

  crates.regex."0.2.11" = deps: { features?(features_.regex."0.2.11" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "0.2.11";
    description = "An implementation of regular expressions for Rust. This implementation uses\nfinite automata and guarantees linear time matching on all inputs.\n";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0r50cymxdqp0fv1dxd22mjr6y32q450nwacd279p9s7lh0cafijj";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."0.2.11"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."0.2.11"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."0.2.11"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."0.2.11"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."0.2.11"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."0.2.11" or {});
  };
  features_.regex."0.2.11" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."0.2.11".aho_corasick}".default = true;
    memchr."${deps.regex."0.2.11".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "0.2.11"."pattern" =
        (f.regex."0.2.11"."pattern" or false) ||
        (f.regex."0.2.11".unstable or false) ||
        (regex."0.2.11"."unstable" or false); }
      { "0.2.11".default = (f.regex."0.2.11".default or true); }
    ];
    regex_syntax."${deps.regex."0.2.11".regex_syntax}".default = true;
    thread_local."${deps.regex."0.2.11".thread_local}".default = true;
    utf8_ranges."${deps.regex."0.2.11".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."0.2.11"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."0.2.11"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."0.2.11"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."0.2.11"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."0.2.11"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.5.6

  crates.regex_syntax."0.5.6" = deps: { features?(features_.regex_syntax."0.5.6" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.5.6";
    description = "A regular expression parser.";
    authors = [ "The Rust Project Developers" ];
    sha256 = "10vf3r34bgjnbrnqd5aszn35bjvm8insw498l1vjy8zx5yms3427";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.5.6"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.5.6" = deps: f: updateFeatures f (rec {
    regex_syntax."0.5.6".default = (f.regex_syntax."0.5.6".default or true);
    ucd_util."${deps.regex_syntax."0.5.6".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.5.6"."ucd_util"}" deps)
  ];


# end
# reservoir-0.2.0

  crates.reservoir."0.2.0" = deps: { features?(features_.reservoir."0.2.0" deps {}) }: buildRustCrate {
    crateName = "reservoir";
    version = "0.2.0";
    description = "Reservoir sampling of iterators";
    authors = [ "Nat Pryce <sw@natpryce.com>" ];
    sha256 = "1dkj9qmbmydk2jbxxkv738ak79vfnqdpksx5nk62j7yby0id1ci7";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."reservoir"."0.2.0"."rand"}" deps)
    ]);
  };
  features_.reservoir."0.2.0" = deps: f: updateFeatures f (rec {
    rand."${deps.reservoir."0.2.0".rand}".default = true;
    reservoir."0.2.0".default = (f.reservoir."0.2.0".default or true);
  }) [
    (features_.rand."${deps."reservoir"."0.2.0"."rand"}" deps)
  ];


# end
# rgb-0.8.13

  crates.rgb."0.8.13" = deps: { features?(features_.rgb."0.8.13" deps {}) }: buildRustCrate {
    crateName = "rgb";
    version = "0.8.13";
    description = "`struct RGB/RGBA/etc.` for sharing pixels between crates + convenience methods for color manipulation.\nAllows no-copy high-level interoperability. Also adds common convenience methods and implements standard Rust traits to make `RGB`/`RGBA` pixels and slices first-class Rust objects.";
    authors = [ "Kornel Lesiński <kornel@geekhood.net>" ];
    sha256 = "0jiricfialx3p3idbkl1p9pizzq8cfjvia0nyzq6pw5hddj49vak";
    dependencies = mapFeatures features ([
]);
  };
  features_.rgb."0.8.13" = deps: f: updateFeatures f (rec {
    rgb."0.8.13".default = (f.rgb."0.8.13".default or true);
  }) [];


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
# unicode-normalization-0.1.8

  crates.unicode_normalization."0.1.8" = deps: { features?(features_.unicode_normalization."0.1.8" deps {}) }: buildRustCrate {
    crateName = "unicode-normalization";
    version = "0.1.8";
    description = "This crate provides functions for normalization of\nUnicode strings, including Canonical and Compatible\nDecomposition and Recomposition, as described in\nUnicode Standard Annex #15.\n";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "1pb26i2xd5zz0icabyqahikpca0iwj2jd4145pczc4bb7p641dsz";
    dependencies = mapFeatures features ([
      (crates."smallvec"."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
    ]);
  };
  features_.unicode_normalization."0.1.8" = deps: f: updateFeatures f (rec {
    smallvec."${deps.unicode_normalization."0.1.8".smallvec}".default = true;
    unicode_normalization."0.1.8".default = (f.unicode_normalization."0.1.8".default or true);
  }) [
    (features_.smallvec."${deps."unicode_normalization"."0.1.8"."smallvec"}" deps)
  ];


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
# winconsole-0.10.0

  crates.winconsole."0.10.0" = deps: { features?(features_.winconsole."0.10.0" deps {}) }: buildRustCrate {
    crateName = "winconsole";
    version = "0.10.0";
    description = "A wrapper for console-related functions in the Windows API.";
    authors = [ "Omar M. <omarkmu@gmail.com>" ];
    sha256 = "1l477dbqblnajm4l7gydi7gjgfwb5g9kkpq15ynzyi7y5g4pq6cm";
    dependencies = mapFeatures features ([
      (crates."cgmath"."${deps."winconsole"."0.10.0"."cgmath"}" deps)
      (crates."lazy_static"."${deps."winconsole"."0.10.0"."lazy_static"}" deps)
      (crates."rgb"."${deps."winconsole"."0.10.0"."rgb"}" deps)
      (crates."winapi"."${deps."winconsole"."0.10.0"."winapi"}" deps)
    ]);
    features = mkFeatures (features."winconsole"."0.10.0" or {});
  };
  features_.winconsole."0.10.0" = deps: f: updateFeatures f (rec {
    cgmath."${deps.winconsole."0.10.0".cgmath}".default = true;
    lazy_static."${deps.winconsole."0.10.0".lazy_static}".default = true;
    rgb."${deps.winconsole."0.10.0".rgb}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.winconsole."0.10.0".winapi}"."consoleapi" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."minwindef" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."processenv" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."utilapiset" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winbase" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."wincon" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."windef" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winnls" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winnt" = true; }
      { "${deps.winconsole."0.10.0".winapi}"."winuser" = true; }
      { "${deps.winconsole."0.10.0".winapi}".default = true; }
    ];
    winconsole."0.10.0".default = (f.winconsole."0.10.0".default or true);
  }) [
    (features_.cgmath."${deps."winconsole"."0.10.0"."cgmath"}" deps)
    (features_.lazy_static."${deps."winconsole"."0.10.0"."lazy_static"}" deps)
    (features_.rgb."${deps."winconsole"."0.10.0"."rgb"}" deps)
    (features_.winapi."${deps."winconsole"."0.10.0"."winapi"}" deps)
  ];


# end
}
