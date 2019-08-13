{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.7.6

  crates.aho_corasick."0.7.6" = deps: { features?(features_."aho_corasick"."0.7.6" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.7.6";
    description = "Fast multiple substring searching.";
    homepage = "https://github.com/BurntSushi/aho-corasick";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1srdggg7iawz7rfyb79qfnz6vmzkgl6g6gabyd9ad6pbx7zzj8gz";
    libName = "aho_corasick";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.7.6"."memchr"}" deps)
    ]);
    features = mkFeatures (features."aho_corasick"."0.7.6" or {});
  };
  features_."aho_corasick"."0.7.6" = deps: f: updateFeatures f (rec {
    aho_corasick = fold recursiveUpdate {} [
      { "0.7.6"."std" =
        (f.aho_corasick."0.7.6"."std" or false) ||
        (f.aho_corasick."0.7.6"."default" or false) ||
        (aho_corasick."0.7.6"."default" or false); }
      { "0.7.6".default = (f.aho_corasick."0.7.6".default or true); }
    ];
    memchr = fold recursiveUpdate {} [
      { "${deps.aho_corasick."0.7.6".memchr}"."use_std" =
        (f.memchr."${deps.aho_corasick."0.7.6".memchr}"."use_std" or false) ||
        (aho_corasick."0.7.6"."std" or false) ||
        (f."aho_corasick"."0.7.6"."std" or false); }
      { "${deps.aho_corasick."0.7.6".memchr}".default = (f.memchr."${deps.aho_corasick."0.7.6".memchr}".default or false); }
    ];
  }) [
    (if deps."aho_corasick"."0.7.6" ? "memchr" then features_.memchr."${deps."aho_corasick"."0.7.6"."memchr" or ""}" deps else {})
  ];


# end
# ansi_term-0.11.0

  crates.ansi_term."0.11.0" = deps: { features?(features_."ansi_term"."0.11.0" deps {}) }: buildRustCrate {
    crateName = "ansi_term";
    version = "0.11.0";
    description = "Library for ANSI terminal colours and styles (bold, underline)";
    homepage = "https://github.com/ogham/rust-ansi-term";
    authors = [ "ogham@bsago.me" "Ryan Scheel (Havvy) <ryan.havvy@gmail.com>" "Josh Triplett <josh@joshtriplett.org>" ];
    sha256 = "08fk0p2xvkqpmz3zlrwnf6l8sj2vngw464rvzspzp31sbgxbwm4v";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."ansi_term"."0.11.0"."winapi"}" deps)
    ]) else []);
  };
  features_."ansi_term"."0.11.0" = deps: f: updateFeatures f (rec {
    ansi_term."0.11.0".default = (f.ansi_term."0.11.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.ansi_term."0.11.0".winapi}"."consoleapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."errhandlingapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."processenv" = true; }
      { "${deps.ansi_term."0.11.0".winapi}".default = true; }
    ];
  }) [
    (if deps."ansi_term"."0.11.0" ? "winapi" then features_.winapi."${deps."ansi_term"."0.11.0"."winapi" or ""}" deps else {})
  ];


# end
# arrayvec-0.4.11

  crates.arrayvec."0.4.11" = deps: { features?(features_."arrayvec"."0.4.11" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.11";
    description = "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.";
    authors = [ "bluss" ];
    sha256 = "1bd08rakkyr9jlf538cs80s3ly464ni3afr63zlw860ndar1zfmv";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.11"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.11" or {});
  };
  features_."arrayvec"."0.4.11" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.11"."serde" =
        (f.arrayvec."0.4.11"."serde" or false) ||
        (f.arrayvec."0.4.11"."serde-1" or false) ||
        (arrayvec."0.4.11"."serde-1" or false); }
      { "0.4.11"."std" =
        (f.arrayvec."0.4.11"."std" or false) ||
        (f.arrayvec."0.4.11"."default" or false) ||
        (arrayvec."0.4.11"."default" or false); }
      { "0.4.11".default = (f.arrayvec."0.4.11".default or true); }
    ];
    nodrop."${deps.arrayvec."0.4.11".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.11".nodrop}".default or false);
  }) [
    (if deps."arrayvec"."0.4.11" ? "nodrop" then features_.nodrop."${deps."arrayvec"."0.4.11"."nodrop" or ""}" deps else {})
  ];


# end
# atty-0.2.13

  crates.atty."0.2.13" = deps: { features?(features_."atty"."0.2.13" deps {}) }: buildRustCrate {
    crateName = "atty";
    version = "0.2.13";
    description = "A simple interface for querying atty";
    homepage = "https://github.com/softprops/atty";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0a1ii8h9fvvrq05bz7j135zjjz1sjz6n2invn2ngxqri0jxgmip2";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."atty"."0.2.13"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."atty"."0.2.13"."winapi"}" deps)
    ]) else []);
  };
  features_."atty"."0.2.13" = deps: f: updateFeatures f (rec {
    atty."0.2.13".default = (f.atty."0.2.13".default or true);
    libc."${deps.atty."0.2.13".libc}".default = (f.libc."${deps.atty."0.2.13".libc}".default or false);
    winapi = fold recursiveUpdate {} [
      { "${deps.atty."0.2.13".winapi}"."consoleapi" = true; }
      { "${deps.atty."0.2.13".winapi}"."minwinbase" = true; }
      { "${deps.atty."0.2.13".winapi}"."minwindef" = true; }
      { "${deps.atty."0.2.13".winapi}"."processenv" = true; }
      { "${deps.atty."0.2.13".winapi}"."winbase" = true; }
      { "${deps.atty."0.2.13".winapi}".default = true; }
    ];
  }) [
    (if deps."atty"."0.2.13" ? "libc" then features_.libc."${deps."atty"."0.2.13"."libc" or ""}" deps else {})
    (if deps."atty"."0.2.13" ? "winapi" then features_.winapi."${deps."atty"."0.2.13"."winapi" or ""}" deps else {})
  ];


# end
# autocfg-0.1.5

  crates.autocfg."0.1.5" = deps: { features?(features_."autocfg"."0.1.5" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.5";
    description = "Automatic cfg for Rust compiler features";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1f3bj604fyr4xh08r357hs3hpdzapiqgccvmj1jpi953ffqrp09a";
  };
  features_."autocfg"."0.1.5" = deps: f: updateFeatures f (rec {
    autocfg."0.1.5".default = (f.autocfg."0.1.5".default or true);
  }) [];


# end
# backtrace-0.3.34

  crates.backtrace."0.3.34" = deps: { features?(features_."backtrace"."0.3.34" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.34";
    description = "A library to acquire a stack trace (backtrace) at runtime in a Rust program.
";
    homepage = "https://github.com/rust-lang/backtrace-rs";
    authors = [ "The Rust Project Developers" ];
    edition = "2018";
    sha256 = "13c0nc948br11rc4rdgvbr1i5yhh2wzzasicrswijli0fjsnwds3";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.34"."cfg_if"}" deps)
      (crates."libc"."${deps."backtrace"."0.3.34"."libc"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.34"."rustc_demangle"}" deps)
    ]
      ++ (if features.backtrace."0.3.34".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.34".backtrace_sys}" deps) ] else []))
      ++ (if !(kernel == "darwin" || kernel == "windows") then mapFeatures features ([
]) else [])
      ++ (if kernel == "darwin" then mapFeatures features ([
]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."backtrace"."0.3.34" or {});
  };
  features_."backtrace"."0.3.34" = deps: f: updateFeatures f (rec {
    backtrace = fold recursiveUpdate {} [
      { "0.3.34"."addr2line" =
        (f.backtrace."0.3.34"."addr2line" or false) ||
        (f.backtrace."0.3.34"."gimli-symbolize" or false) ||
        (backtrace."0.3.34"."gimli-symbolize" or false); }
      { "0.3.34"."backtrace-sys" =
        (f.backtrace."0.3.34"."backtrace-sys" or false) ||
        (f.backtrace."0.3.34"."libbacktrace" or false) ||
        (backtrace."0.3.34"."libbacktrace" or false); }
      { "0.3.34"."compiler_builtins" =
        (f.backtrace."0.3.34"."compiler_builtins" or false) ||
        (f.backtrace."0.3.34"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.34"."rustc-dep-of-std" or false); }
      { "0.3.34"."core" =
        (f.backtrace."0.3.34"."core" or false) ||
        (f.backtrace."0.3.34"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.34"."rustc-dep-of-std" or false); }
      { "0.3.34"."dbghelp" =
        (f.backtrace."0.3.34"."dbghelp" or false) ||
        (f.backtrace."0.3.34"."default" or false) ||
        (backtrace."0.3.34"."default" or false); }
      { "0.3.34"."dladdr" =
        (f.backtrace."0.3.34"."dladdr" or false) ||
        (f.backtrace."0.3.34"."default" or false) ||
        (backtrace."0.3.34"."default" or false); }
      { "0.3.34"."findshlibs" =
        (f.backtrace."0.3.34"."findshlibs" or false) ||
        (f.backtrace."0.3.34"."gimli-symbolize" or false) ||
        (backtrace."0.3.34"."gimli-symbolize" or false); }
      { "0.3.34"."goblin" =
        (f.backtrace."0.3.34"."goblin" or false) ||
        (f.backtrace."0.3.34"."gimli-symbolize" or false) ||
        (backtrace."0.3.34"."gimli-symbolize" or false); }
      { "0.3.34"."libbacktrace" =
        (f.backtrace."0.3.34"."libbacktrace" or false) ||
        (f.backtrace."0.3.34"."default" or false) ||
        (backtrace."0.3.34"."default" or false); }
      { "0.3.34"."libunwind" =
        (f.backtrace."0.3.34"."libunwind" or false) ||
        (f.backtrace."0.3.34"."default" or false) ||
        (backtrace."0.3.34"."default" or false); }
      { "0.3.34"."memmap" =
        (f.backtrace."0.3.34"."memmap" or false) ||
        (f.backtrace."0.3.34"."gimli-symbolize" or false) ||
        (backtrace."0.3.34"."gimli-symbolize" or false); }
      { "0.3.34"."rustc-serialize" =
        (f.backtrace."0.3.34"."rustc-serialize" or false) ||
        (f.backtrace."0.3.34"."serialize-rustc" or false) ||
        (backtrace."0.3.34"."serialize-rustc" or false); }
      { "0.3.34"."serde" =
        (f.backtrace."0.3.34"."serde" or false) ||
        (f.backtrace."0.3.34"."serialize-serde" or false) ||
        (backtrace."0.3.34"."serialize-serde" or false); }
      { "0.3.34"."std" =
        (f.backtrace."0.3.34"."std" or false) ||
        (f.backtrace."0.3.34"."default" or false) ||
        (backtrace."0.3.34"."default" or false); }
      { "0.3.34".default = (f.backtrace."0.3.34".default or true); }
    ];
    backtrace_sys."${deps.backtrace."0.3.34".backtrace_sys}"."rustc-dep-of-std" =
        (f.backtrace_sys."${deps.backtrace."0.3.34".backtrace_sys}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.34"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.34"."rustc-dep-of-std" or false);
    cfg_if = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.34".cfg_if}"."rustc-dep-of-std" =
        (f.cfg_if."${deps.backtrace."0.3.34".cfg_if}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.34"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.34"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.34".cfg_if}".default = true; }
    ];
    libc = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.34".libc}"."rustc-dep-of-std" =
        (f.libc."${deps.backtrace."0.3.34".libc}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.34"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.34"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.34".libc}".default = (f.libc."${deps.backtrace."0.3.34".libc}".default or false); }
    ];
    rustc_demangle = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.34".rustc_demangle}"."rustc-dep-of-std" =
        (f.rustc_demangle."${deps.backtrace."0.3.34".rustc_demangle}"."rustc-dep-of-std" or false) ||
        (backtrace."0.3.34"."rustc-dep-of-std" or false) ||
        (f."backtrace"."0.3.34"."rustc-dep-of-std" or false); }
      { "${deps.backtrace."0.3.34".rustc_demangle}".default = true; }
    ];
  }) [
    (f: if deps."backtrace"."0.3.34" ? "backtrace_sys" then recursiveUpdate f { backtrace_sys."${deps."backtrace"."0.3.34"."backtrace_sys"}"."default" = true; } else f)
    (if deps."backtrace"."0.3.34" ? "backtrace_sys" then features_.backtrace_sys."${deps."backtrace"."0.3.34"."backtrace_sys" or ""}" deps else {})
    (if deps."backtrace"."0.3.34" ? "cfg_if" then features_.cfg_if."${deps."backtrace"."0.3.34"."cfg_if" or ""}" deps else {})
    (if deps."backtrace"."0.3.34" ? "libc" then features_.libc."${deps."backtrace"."0.3.34"."libc" or ""}" deps else {})
    (if deps."backtrace"."0.3.34" ? "rustc_demangle" then features_.rustc_demangle."${deps."backtrace"."0.3.34"."rustc_demangle" or ""}" deps else {})
  ];


# end
# backtrace-sys-0.1.31

  crates.backtrace_sys."0.1.31" = deps: { features?(features_."backtrace_sys"."0.1.31" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.31";
    description = "Bindings to the libbacktrace gcc library
";
    homepage = "https://github.com/alexcrichton/backtrace-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1gv41cypl4y5r32za4gx2fks43d76sp1r3yb5524i4gs50lrkypv";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.31"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.31"."cc"}" deps)
    ]);
    features = mkFeatures (features."backtrace_sys"."0.1.31" or {});
  };
  features_."backtrace_sys"."0.1.31" = deps: f: updateFeatures f (rec {
    backtrace_sys = fold recursiveUpdate {} [
      { "0.1.31"."compiler_builtins" =
        (f.backtrace_sys."0.1.31"."compiler_builtins" or false) ||
        (f.backtrace_sys."0.1.31"."rustc-dep-of-std" or false) ||
        (backtrace_sys."0.1.31"."rustc-dep-of-std" or false); }
      { "0.1.31"."core" =
        (f.backtrace_sys."0.1.31"."core" or false) ||
        (f.backtrace_sys."0.1.31"."rustc-dep-of-std" or false) ||
        (backtrace_sys."0.1.31"."rustc-dep-of-std" or false); }
      { "0.1.31".default = (f.backtrace_sys."0.1.31".default or true); }
    ];
    cc."${deps.backtrace_sys."0.1.31".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.31".libc}".default = (f.libc."${deps.backtrace_sys."0.1.31".libc}".default or false);
  }) [
    (if deps."backtrace_sys"."0.1.31" ? "libc" then features_.libc."${deps."backtrace_sys"."0.1.31"."libc" or ""}" deps else {})
    (if deps."backtrace_sys"."0.1.31" ? "cc" then features_.cc."${deps."backtrace_sys"."0.1.31"."cc" or ""}" deps else {})
  ];


# end
# bitflags-1.1.0

  crates.bitflags."1.1.0" = deps: { features?(features_."bitflags"."1.1.0" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.1.0";
    description = "A macro to generate structures which behave like bitflags.
";
    homepage = "https://github.com/bitflags/bitflags";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1iwa4jrqcf4lnbwl562a3lx3r0jkh1j88b219bsqvbm4sni67dyv";
    build = "build.rs";
    features = mkFeatures (features."bitflags"."1.1.0" or {});
  };
  features_."bitflags"."1.1.0" = deps: f: updateFeatures f (rec {
    bitflags."1.1.0".default = (f.bitflags."1.1.0".default or true);
  }) [];


# end
# blas-src-0.2.1

  crates.blas_src."0.2.1" = deps: { features?(features_."blas_src"."0.2.1" deps {}) }: buildRustCrate {
    crateName = "blas-src";
    version = "0.2.1";
    description = "The package provides a BLAS source of choice.";
    homepage = "https://github.com/blas-lapack-rs/blas-src";
    authors = [ "Ivan Ukhov <ivan.ukhov@gmail.com>" "Toshiki Teramura <toshiki.teramura@gmail.com>" ];
    sha256 = "0zajr9px5a2ql4cwhj71gjc52rxkjy9zxjlajrvn67hhmi8yjvb7";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."blas_src"."0.2.1" or {});
  };
  features_."blas_src"."0.2.1" = deps: f: updateFeatures f (rec {
    blas_src = fold recursiveUpdate {} [
      { "0.2.1"."accelerate-src" =
        (f.blas_src."0.2.1"."accelerate-src" or false) ||
        (f.blas_src."0.2.1"."accelerate" or false) ||
        (blas_src."0.2.1"."accelerate" or false); }
      { "0.2.1"."intel-mkl-src" =
        (f.blas_src."0.2.1"."intel-mkl-src" or false) ||
        (f.blas_src."0.2.1"."intel-mkl" or false) ||
        (blas_src."0.2.1"."intel-mkl" or false); }
      { "0.2.1"."netlib-src" =
        (f.blas_src."0.2.1"."netlib-src" or false) ||
        (f.blas_src."0.2.1"."netlib" or false) ||
        (blas_src."0.2.1"."netlib" or false); }
      { "0.2.1"."openblas-src" =
        (f.blas_src."0.2.1"."openblas-src" or false) ||
        (f.blas_src."0.2.1"."openblas" or false) ||
        (blas_src."0.2.1"."openblas" or false); }
      { "0.2.1".default = (f.blas_src."0.2.1".default or true); }
    ];
  }) [];


# end
# byteorder-1.3.2

  crates.byteorder."1.3.2" = deps: { features?(features_."byteorder"."1.3.2" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.2";
    description = "Library for reading/writing numbers in big-endian and little-endian.";
    homepage = "https://github.com/BurntSushi/byteorder";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "099fxwc79ncpcl8dgg9hql8gznz11a3sjs7pai0mg6w8r05khvdx";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.2" or {});
  };
  features_."byteorder"."1.3.2" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.2"."std" =
        (f.byteorder."1.3.2"."std" or false) ||
        (f.byteorder."1.3.2"."default" or false) ||
        (byteorder."1.3.2"."default" or false); }
      { "1.3.2".default = (f.byteorder."1.3.2".default or true); }
    ];
  }) [];


# end
# cblas-sys-0.1.4

  crates.cblas_sys."0.1.4" = deps: { features?(features_."cblas_sys"."0.1.4" deps {}) }: buildRustCrate {
    crateName = "cblas-sys";
    version = "0.1.4";
    description = "The package provides bindings to CBLAS (C).";
    homepage = "https://github.com/blas-lapack-rs/cblas-sys";
    authors = [ "Ivan Ukhov <ivan.ukhov@gmail.com>" ];
    sha256 = "1gxnyx9p3alvq4h1p6wa4fcrb3g0mbddk1bpikqw5fxp5y96cd9w";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."cblas_sys"."0.1.4"."libc"}" deps)
    ]);
  };
  features_."cblas_sys"."0.1.4" = deps: f: updateFeatures f (rec {
    cblas_sys."0.1.4".default = (f.cblas_sys."0.1.4".default or true);
    libc."${deps.cblas_sys."0.1.4".libc}".default = true;
  }) [
    (if deps."cblas_sys"."0.1.4" ? "libc" then features_.libc."${deps."cblas_sys"."0.1.4"."libc" or ""}" deps else {})
  ];


# end
# cc-1.0.38

  crates.cc."1.0.38" = deps: { features?(features_."cc"."1.0.38" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.38";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.
";
    homepage = "https://github.com/alexcrichton/cc-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "17zc9i3mp8jjnrz20ah4inpz2ihmjxl93iswvzm5rv4grk60pzn4";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.38" or {});
  };
  features_."cc"."1.0.38" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.38"."rayon" =
        (f.cc."1.0.38"."rayon" or false) ||
        (f.cc."1.0.38"."parallel" or false) ||
        (cc."1.0.38"."parallel" or false); }
      { "1.0.38".default = (f.cc."1.0.38".default or true); }
    ];
  }) [];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_."cfg_if"."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    description = "A macro to ergonomically define an item depending on a large number of #[cfg]
parameters. Structured like an if-else chain, the first matching branch is the
item that gets emitted.
";
    homepage = "https://github.com/alexcrichton/cfg-if";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_."cfg_if"."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# clap-2.33.0

  crates.clap."2.33.0" = deps: { features?(features_."clap"."2.33.0" deps {}) }: buildRustCrate {
    crateName = "clap";
    version = "2.33.0";
    description = "A simple to use, efficient, and full-featured Command Line Argument Parser
";
    homepage = "https://clap.rs/";
    authors = [ "Kevin K. <kbknapp@gmail.com>" ];
    sha256 = "054n9ngh6pkknpmd4acgdsp40iw6f5jzq8a4h2b76gnbvk6p5xjh";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."clap"."2.33.0"."bitflags"}" deps)
      (crates."textwrap"."${deps."clap"."2.33.0"."textwrap"}" deps)
      (crates."unicode_width"."${deps."clap"."2.33.0"."unicode_width"}" deps)
    ]
      ++ (if features.clap."2.33.0".atty or false then [ (crates.atty."${deps."clap"."2.33.0".atty}" deps) ] else [])
      ++ (if features.clap."2.33.0".strsim or false then [ (crates.strsim."${deps."clap"."2.33.0".strsim}" deps) ] else [])
      ++ (if features.clap."2.33.0".vec_map or false then [ (crates.vec_map."${deps."clap"."2.33.0".vec_map}" deps) ] else []))
      ++ (if !(kernel == "windows") then mapFeatures features ([
    ]
      ++ (if features.clap."2.33.0".ansi_term or false then [ (crates.ansi_term."${deps."clap"."2.33.0".ansi_term}" deps) ] else [])) else []);
    features = mkFeatures (features."clap"."2.33.0" or {});
  };
  features_."clap"."2.33.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.clap."2.33.0".bitflags}".default = true;
    clap = fold recursiveUpdate {} [
      { "2.33.0"."ansi_term" =
        (f.clap."2.33.0"."ansi_term" or false) ||
        (f.clap."2.33.0"."color" or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0"."atty" =
        (f.clap."2.33.0"."atty" or false) ||
        (f.clap."2.33.0"."color" or false) ||
        (clap."2.33.0"."color" or false); }
      { "2.33.0"."clippy" =
        (f.clap."2.33.0"."clippy" or false) ||
        (f.clap."2.33.0"."lints" or false) ||
        (clap."2.33.0"."lints" or false); }
      { "2.33.0"."color" =
        (f.clap."2.33.0"."color" or false) ||
        (f.clap."2.33.0"."default" or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."strsim" =
        (f.clap."2.33.0"."strsim" or false) ||
        (f.clap."2.33.0"."suggestions" or false) ||
        (clap."2.33.0"."suggestions" or false); }
      { "2.33.0"."suggestions" =
        (f.clap."2.33.0"."suggestions" or false) ||
        (f.clap."2.33.0"."default" or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."term_size" =
        (f.clap."2.33.0"."term_size" or false) ||
        (f.clap."2.33.0"."wrap_help" or false) ||
        (clap."2.33.0"."wrap_help" or false); }
      { "2.33.0"."vec_map" =
        (f.clap."2.33.0"."vec_map" or false) ||
        (f.clap."2.33.0"."default" or false) ||
        (clap."2.33.0"."default" or false); }
      { "2.33.0"."yaml" =
        (f.clap."2.33.0"."yaml" or false) ||
        (f.clap."2.33.0"."doc" or false) ||
        (clap."2.33.0"."doc" or false); }
      { "2.33.0"."yaml-rust" =
        (f.clap."2.33.0"."yaml-rust" or false) ||
        (f.clap."2.33.0"."yaml" or false) ||
        (clap."2.33.0"."yaml" or false); }
      { "2.33.0".default = (f.clap."2.33.0".default or true); }
    ];
    textwrap = fold recursiveUpdate {} [
      { "${deps.clap."2.33.0".textwrap}"."term_size" =
        (f.textwrap."${deps.clap."2.33.0".textwrap}"."term_size" or false) ||
        (clap."2.33.0"."wrap_help" or false) ||
        (f."clap"."2.33.0"."wrap_help" or false); }
      { "${deps.clap."2.33.0".textwrap}".default = true; }
    ];
    unicode_width."${deps.clap."2.33.0".unicode_width}".default = true;
  }) [
    (f: if deps."clap"."2.33.0" ? "ansi_term" then recursiveUpdate f { ansi_term."${deps."clap"."2.33.0"."ansi_term"}"."default" = true; } else f)
    (f: if deps."clap"."2.33.0" ? "atty" then recursiveUpdate f { atty."${deps."clap"."2.33.0"."atty"}"."default" = true; } else f)
    (f: if deps."clap"."2.33.0" ? "strsim" then recursiveUpdate f { strsim."${deps."clap"."2.33.0"."strsim"}"."default" = true; } else f)
    (f: if deps."clap"."2.33.0" ? "vec_map" then recursiveUpdate f { vec_map."${deps."clap"."2.33.0"."vec_map"}"."default" = true; } else f)
    (if deps."clap"."2.33.0" ? "atty" then features_.atty."${deps."clap"."2.33.0"."atty" or ""}" deps else {})
    (if deps."clap"."2.33.0" ? "bitflags" then features_.bitflags."${deps."clap"."2.33.0"."bitflags" or ""}" deps else {})
    (if deps."clap"."2.33.0" ? "strsim" then features_.strsim."${deps."clap"."2.33.0"."strsim" or ""}" deps else {})
    (if deps."clap"."2.33.0" ? "textwrap" then features_.textwrap."${deps."clap"."2.33.0"."textwrap" or ""}" deps else {})
    (if deps."clap"."2.33.0" ? "unicode_width" then features_.unicode_width."${deps."clap"."2.33.0"."unicode_width" or ""}" deps else {})
    (if deps."clap"."2.33.0" ? "vec_map" then features_.vec_map."${deps."clap"."2.33.0"."vec_map" or ""}" deps else {})
    (if deps."clap"."2.33.0" ? "ansi_term" then features_.ansi_term."${deps."clap"."2.33.0"."ansi_term" or ""}" deps else {})
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_."cloudabi"."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    description = "Low level interface to CloudABI. Contains all syscalls and related types.";
    homepage = "https://nuxi.nl/cloudabi/";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_."cloudabi"."0.0.3" = deps: f: updateFeatures f (rec {
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3"."bitflags" =
        (f.cloudabi."0.0.3"."bitflags" or false) ||
        (f.cloudabi."0.0.3"."default" or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (f: if deps."cloudabi"."0.0.3" ? "bitflags" then recursiveUpdate f { bitflags."${deps."cloudabi"."0.0.3"."bitflags"}"."default" = true; } else f)
    (if deps."cloudabi"."0.0.3" ? "bitflags" then features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags" or ""}" deps else {})
  ];


# end
# crossbeam-deque-0.6.3

  crates.crossbeam_deque."0.6.3" = deps: { features?(features_."crossbeam_deque"."0.6.3" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.6.3";
    description = "Concurrent work-stealing deque";
    homepage = "https://github.com/crossbeam-rs/crossbeam";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "07dahkh6rc09nzg7054rnmxhni263pi9arcyjyy822kg59c0lfz8";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.6.3"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.6.3"."crossbeam_utils"}" deps)
    ]);
  };
  features_."crossbeam_deque"."0.6.3" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.6.3".default = (f.crossbeam_deque."0.6.3".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.6.3".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.6.3".crossbeam_utils}".default = true;
  }) [
    (if deps."crossbeam_deque"."0.6.3" ? "crossbeam_epoch" then features_.crossbeam_epoch."${deps."crossbeam_deque"."0.6.3"."crossbeam_epoch" or ""}" deps else {})
    (if deps."crossbeam_deque"."0.6.3" ? "crossbeam_utils" then features_.crossbeam_utils."${deps."crossbeam_deque"."0.6.3"."crossbeam_utils" or ""}" deps else {})
  ];


# end
# crossbeam-epoch-0.7.2

  crates.crossbeam_epoch."0.7.2" = deps: { features?(features_."crossbeam_epoch"."0.7.2" deps {}) }: buildRustCrate {
    crateName = "crossbeam-epoch";
    version = "0.7.2";
    description = "Epoch-based garbage collection";
    homepage = "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-epoch";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "015axh69r6ggj481ncqj09d7ssbqf8psgyqq9hhpkrh3j7xn4vmn";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."crossbeam_epoch"."0.7.2"."arrayvec"}" deps)
      (crates."cfg_if"."${deps."crossbeam_epoch"."0.7.2"."cfg_if"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_epoch"."0.7.2"."crossbeam_utils"}" deps)
      (crates."memoffset"."${deps."crossbeam_epoch"."0.7.2"."memoffset"}" deps)
      (crates."scopeguard"."${deps."crossbeam_epoch"."0.7.2"."scopeguard"}" deps)
    ]
      ++ (if features.crossbeam_epoch."0.7.2".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_epoch"."0.7.2".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_epoch"."0.7.2" or {});
  };
  features_."crossbeam_epoch"."0.7.2" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.2".arrayvec}"."use_union" =
        (f.arrayvec."${deps.crossbeam_epoch."0.7.2".arrayvec}"."use_union" or false) ||
        (crossbeam_epoch."0.7.2"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.2"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.2".arrayvec}".default = (f.arrayvec."${deps.crossbeam_epoch."0.7.2".arrayvec}".default or false); }
    ];
    cfg_if."${deps.crossbeam_epoch."0.7.2".cfg_if}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "0.7.2"."lazy_static" =
        (f.crossbeam_epoch."0.7.2"."lazy_static" or false) ||
        (f.crossbeam_epoch."0.7.2"."std" or false) ||
        (crossbeam_epoch."0.7.2"."std" or false); }
      { "0.7.2"."std" =
        (f.crossbeam_epoch."0.7.2"."std" or false) ||
        (f.crossbeam_epoch."0.7.2"."default" or false) ||
        (crossbeam_epoch."0.7.2"."default" or false); }
      { "0.7.2".default = (f.crossbeam_epoch."0.7.2".default or true); }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.7.2".crossbeam_utils}"."alloc" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.2".crossbeam_utils}"."alloc" or false) ||
        (crossbeam_epoch."0.7.2"."alloc" or false) ||
        (f."crossbeam_epoch"."0.7.2"."alloc" or false); }
      { "${deps.crossbeam_epoch."0.7.2".crossbeam_utils}"."nightly" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.2".crossbeam_utils}"."nightly" or false) ||
        (crossbeam_epoch."0.7.2"."nightly" or false) ||
        (f."crossbeam_epoch"."0.7.2"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.7.2".crossbeam_utils}"."std" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.2".crossbeam_utils}"."std" or false) ||
        (crossbeam_epoch."0.7.2"."std" or false) ||
        (f."crossbeam_epoch"."0.7.2"."std" or false); }
      { "${deps.crossbeam_epoch."0.7.2".crossbeam_utils}".default = (f.crossbeam_utils."${deps.crossbeam_epoch."0.7.2".crossbeam_utils}".default or false); }
    ];
    memoffset."${deps.crossbeam_epoch."0.7.2".memoffset}".default = true;
    scopeguard."${deps.crossbeam_epoch."0.7.2".scopeguard}".default = (f.scopeguard."${deps.crossbeam_epoch."0.7.2".scopeguard}".default or false);
  }) [
    (f: if deps."crossbeam_epoch"."0.7.2" ? "lazy_static" then recursiveUpdate f { lazy_static."${deps."crossbeam_epoch"."0.7.2"."lazy_static"}"."default" = true; } else f)
    (if deps."crossbeam_epoch"."0.7.2" ? "arrayvec" then features_.arrayvec."${deps."crossbeam_epoch"."0.7.2"."arrayvec" or ""}" deps else {})
    (if deps."crossbeam_epoch"."0.7.2" ? "cfg_if" then features_.cfg_if."${deps."crossbeam_epoch"."0.7.2"."cfg_if" or ""}" deps else {})
    (if deps."crossbeam_epoch"."0.7.2" ? "crossbeam_utils" then features_.crossbeam_utils."${deps."crossbeam_epoch"."0.7.2"."crossbeam_utils" or ""}" deps else {})
    (if deps."crossbeam_epoch"."0.7.2" ? "lazy_static" then features_.lazy_static."${deps."crossbeam_epoch"."0.7.2"."lazy_static" or ""}" deps else {})
    (if deps."crossbeam_epoch"."0.7.2" ? "memoffset" then features_.memoffset."${deps."crossbeam_epoch"."0.7.2"."memoffset" or ""}" deps else {})
    (if deps."crossbeam_epoch"."0.7.2" ? "scopeguard" then features_.scopeguard."${deps."crossbeam_epoch"."0.7.2"."scopeguard" or ""}" deps else {})
  ];


# end
# crossbeam-queue-0.1.2

  crates.crossbeam_queue."0.1.2" = deps: { features?(features_."crossbeam_queue"."0.1.2" deps {}) }: buildRustCrate {
    crateName = "crossbeam-queue";
    version = "0.1.2";
    description = "Concurrent queues";
    homepage = "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-utils";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1hannzr5w6j5061kg5iba4fzi6f2xpqv7bkcspfq17y1i8g0mzjj";
    dependencies = mapFeatures features ([
      (crates."crossbeam_utils"."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils"}" deps)
    ]);
  };
  features_."crossbeam_queue"."0.1.2" = deps: f: updateFeatures f (rec {
    crossbeam_queue."0.1.2".default = (f.crossbeam_queue."0.1.2".default or true);
    crossbeam_utils."${deps.crossbeam_queue."0.1.2".crossbeam_utils}".default = true;
  }) [
    (if deps."crossbeam_queue"."0.1.2" ? "crossbeam_utils" then features_.crossbeam_utils."${deps."crossbeam_queue"."0.1.2"."crossbeam_utils" or ""}" deps else {})
  ];


# end
# crossbeam-utils-0.6.6

  crates.crossbeam_utils."0.6.6" = deps: { features?(features_."crossbeam_utils"."0.6.6" deps {}) }: buildRustCrate {
    crateName = "crossbeam-utils";
    version = "0.6.6";
    description = "Utilities for concurrent programming";
    homepage = "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-utils";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "01gxccmrjkkcavdh8fc01kj3b5fmk10f0lkx66jmnv69kcssry72";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam_utils"."0.6.6"."cfg_if"}" deps)
    ]
      ++ (if features.crossbeam_utils."0.6.6".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_utils"."0.6.6".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_utils"."0.6.6" or {});
  };
  features_."crossbeam_utils"."0.6.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam_utils."0.6.6".cfg_if}".default = true;
    crossbeam_utils = fold recursiveUpdate {} [
      { "0.6.6"."lazy_static" =
        (f.crossbeam_utils."0.6.6"."lazy_static" or false) ||
        (f.crossbeam_utils."0.6.6"."std" or false) ||
        (crossbeam_utils."0.6.6"."std" or false); }
      { "0.6.6"."std" =
        (f.crossbeam_utils."0.6.6"."std" or false) ||
        (f.crossbeam_utils."0.6.6"."default" or false) ||
        (crossbeam_utils."0.6.6"."default" or false); }
      { "0.6.6".default = (f.crossbeam_utils."0.6.6".default or true); }
    ];
  }) [
    (f: if deps."crossbeam_utils"."0.6.6" ? "lazy_static" then recursiveUpdate f { lazy_static."${deps."crossbeam_utils"."0.6.6"."lazy_static"}"."default" = true; } else f)
    (if deps."crossbeam_utils"."0.6.6" ? "cfg_if" then features_.cfg_if."${deps."crossbeam_utils"."0.6.6"."cfg_if" or ""}" deps else {})
    (if deps."crossbeam_utils"."0.6.6" ? "lazy_static" then features_.lazy_static."${deps."crossbeam_utils"."0.6.6"."lazy_static" or ""}" deps else {})
  ];


# end
# derive-new-0.5.7

  crates.derive_new."0.5.7" = deps: { features?(features_."derive_new"."0.5.7" deps {}) }: buildRustCrate {
    crateName = "derive-new";
    version = "0.5.7";
    description = "`#[derive(new)]` implements simple constructor functions for structs and enums.";
    authors = [ "Nick Cameron <ncameron@mozilla.com>" ];
    sha256 = "12g6bwjldv577a1n4rfw2i79shyahy6csjmx4lyglq5f83gik41p";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."derive_new"."0.5.7"."proc_macro2"}" deps)
      (crates."quote"."${deps."derive_new"."0.5.7"."quote"}" deps)
      (crates."syn"."${deps."derive_new"."0.5.7"."syn"}" deps)
    ]);
    features = mkFeatures (features."derive_new"."0.5.7" or {});
  };
  features_."derive_new"."0.5.7" = deps: f: updateFeatures f (rec {
    derive_new = fold recursiveUpdate {} [
      { "0.5.7"."std" =
        (f.derive_new."0.5.7"."std" or false) ||
        (f.derive_new."0.5.7"."default" or false) ||
        (derive_new."0.5.7"."default" or false); }
      { "0.5.7".default = (f.derive_new."0.5.7".default or true); }
    ];
    proc_macro2."${deps.derive_new."0.5.7".proc_macro2}".default = true;
    quote."${deps.derive_new."0.5.7".quote}".default = true;
    syn."${deps.derive_new."0.5.7".syn}".default = true;
  }) [
    (if deps."derive_new"."0.5.7" ? "proc_macro2" then features_.proc_macro2."${deps."derive_new"."0.5.7"."proc_macro2" or ""}" deps else {})
    (if deps."derive_new"."0.5.7" ? "quote" then features_.quote."${deps."derive_new"."0.5.7"."quote" or ""}" deps else {})
    (if deps."derive_new"."0.5.7" ? "syn" then features_.syn."${deps."derive_new"."0.5.7"."syn" or ""}" deps else {})
  ];


# end
# either-1.5.2

  crates.either."1.5.2" = deps: { features?(features_."either"."1.5.2" deps {}) }: buildRustCrate {
    crateName = "either";
    version = "1.5.2";
    description = "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.
";
    authors = [ "bluss" ];
    sha256 = "1zqq1057c51f53ga4p9l4dd8ax6md27h1xjrjp2plkvml5iymks5";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."either"."1.5.2" or {});
  };
  features_."either"."1.5.2" = deps: f: updateFeatures f (rec {
    either = fold recursiveUpdate {} [
      { "1.5.2"."use_std" =
        (f.either."1.5.2"."use_std" or false) ||
        (f.either."1.5.2"."default" or false) ||
        (either."1.5.2"."default" or false); }
      { "1.5.2".default = (f.either."1.5.2".default or true); }
    ];
  }) [];


# end
# env_logger-0.6.2

  crates.env_logger."0.6.2" = deps: { features?(features_."env_logger"."0.6.2" deps {}) }: buildRustCrate {
    crateName = "env_logger";
    version = "0.6.2";
    description = "A logging implementation for `log` which is configured via an environment
variable.
";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ws1zrbycvqhs18jyymy0d62v394j368060swgnn7500xrfdnl25";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."env_logger"."0.6.2"."log"}" deps)
    ]
      ++ (if features.env_logger."0.6.2".atty or false then [ (crates.atty."${deps."env_logger"."0.6.2".atty}" deps) ] else [])
      ++ (if features.env_logger."0.6.2".humantime or false then [ (crates.humantime."${deps."env_logger"."0.6.2".humantime}" deps) ] else [])
      ++ (if features.env_logger."0.6.2".regex or false then [ (crates.regex."${deps."env_logger"."0.6.2".regex}" deps) ] else [])
      ++ (if features.env_logger."0.6.2".termcolor or false then [ (crates.termcolor."${deps."env_logger"."0.6.2".termcolor}" deps) ] else []));
    features = mkFeatures (features."env_logger"."0.6.2" or {});
  };
  features_."env_logger"."0.6.2" = deps: f: updateFeatures f (rec {
    env_logger = fold recursiveUpdate {} [
      { "0.6.2"."atty" =
        (f.env_logger."0.6.2"."atty" or false) ||
        (f.env_logger."0.6.2"."default" or false) ||
        (env_logger."0.6.2"."default" or false); }
      { "0.6.2"."humantime" =
        (f.env_logger."0.6.2"."humantime" or false) ||
        (f.env_logger."0.6.2"."default" or false) ||
        (env_logger."0.6.2"."default" or false); }
      { "0.6.2"."regex" =
        (f.env_logger."0.6.2"."regex" or false) ||
        (f.env_logger."0.6.2"."default" or false) ||
        (env_logger."0.6.2"."default" or false); }
      { "0.6.2"."termcolor" =
        (f.env_logger."0.6.2"."termcolor" or false) ||
        (f.env_logger."0.6.2"."default" or false) ||
        (env_logger."0.6.2"."default" or false); }
      { "0.6.2".default = (f.env_logger."0.6.2".default or true); }
    ];
    log = fold recursiveUpdate {} [
      { "${deps.env_logger."0.6.2".log}"."std" = true; }
      { "${deps.env_logger."0.6.2".log}".default = true; }
    ];
  }) [
    (f: if deps."env_logger"."0.6.2" ? "atty" then recursiveUpdate f { atty."${deps."env_logger"."0.6.2"."atty"}"."default" = true; } else f)
    (f: if deps."env_logger"."0.6.2" ? "humantime" then recursiveUpdate f { humantime."${deps."env_logger"."0.6.2"."humantime"}"."default" = true; } else f)
    (f: if deps."env_logger"."0.6.2" ? "regex" then recursiveUpdate f { regex."${deps."env_logger"."0.6.2"."regex"}"."default" = true; } else f)
    (f: if deps."env_logger"."0.6.2" ? "termcolor" then recursiveUpdate f { termcolor."${deps."env_logger"."0.6.2"."termcolor"}"."default" = true; } else f)
    (if deps."env_logger"."0.6.2" ? "atty" then features_.atty."${deps."env_logger"."0.6.2"."atty" or ""}" deps else {})
    (if deps."env_logger"."0.6.2" ? "humantime" then features_.humantime."${deps."env_logger"."0.6.2"."humantime" or ""}" deps else {})
    (if deps."env_logger"."0.6.2" ? "log" then features_.log."${deps."env_logger"."0.6.2"."log" or ""}" deps else {})
    (if deps."env_logger"."0.6.2" ? "regex" then features_.regex."${deps."env_logger"."0.6.2"."regex" or ""}" deps else {})
    (if deps."env_logger"."0.6.2" ? "termcolor" then features_.termcolor."${deps."env_logger"."0.6.2"."termcolor" or ""}" deps else {})
  ];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_."failure"."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    description = "Experimental error handling abstraction.";
    homepage = "https://rust-lang-nursery.github.io/failure/";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else [])
      ++ (if features.failure."0.1.5".failure_derive or false then [ (crates.failure_derive."${deps."failure"."0.1.5".failure_derive}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_."failure"."0.1.5" = deps: f: updateFeatures f (rec {
    failure = fold recursiveUpdate {} [
      { "0.1.5"."backtrace" =
        (f.failure."0.1.5"."backtrace" or false) ||
        (f.failure."0.1.5"."std" or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5"."derive" =
        (f.failure."0.1.5"."derive" or false) ||
        (f.failure."0.1.5"."default" or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5"."failure_derive" =
        (f.failure."0.1.5"."failure_derive" or false) ||
        (f.failure."0.1.5"."derive" or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5"."std" =
        (f.failure."0.1.5"."std" or false) ||
        (f.failure."0.1.5"."default" or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
    ];
  }) [
    (f: if deps."failure"."0.1.5" ? "backtrace" then recursiveUpdate f { backtrace."${deps."failure"."0.1.5"."backtrace"}"."default" = true; } else f)
    (f: if deps."failure"."0.1.5" ? "failure_derive" then recursiveUpdate f { failure_derive."${deps."failure"."0.1.5"."failure_derive"}"."default" = true; } else f)
    (if deps."failure"."0.1.5" ? "backtrace" then features_.backtrace."${deps."failure"."0.1.5"."backtrace" or ""}" deps else {})
    (if deps."failure"."0.1.5" ? "failure_derive" then features_.failure_derive."${deps."failure"."0.1.5"."failure_derive" or ""}" deps else {})
  ];


# end
# failure_derive-0.1.5

  crates.failure_derive."0.1.5" = deps: { features?(features_."failure_derive"."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure_derive";
    version = "0.1.5";
    description = "derives for the failure crate";
    homepage = "https://rust-lang-nursery.github.io/failure/";
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
  features_."failure_derive"."0.1.5" = deps: f: updateFeatures f (rec {
    failure_derive."0.1.5".default = (f.failure_derive."0.1.5".default or true);
    proc_macro2."${deps.failure_derive."0.1.5".proc_macro2}".default = true;
    quote."${deps.failure_derive."0.1.5".quote}".default = true;
    syn."${deps.failure_derive."0.1.5".syn}".default = true;
    synstructure."${deps.failure_derive."0.1.5".synstructure}".default = true;
  }) [
    (if deps."failure_derive"."0.1.5" ? "proc_macro2" then features_.proc_macro2."${deps."failure_derive"."0.1.5"."proc_macro2" or ""}" deps else {})
    (if deps."failure_derive"."0.1.5" ? "quote" then features_.quote."${deps."failure_derive"."0.1.5"."quote" or ""}" deps else {})
    (if deps."failure_derive"."0.1.5" ? "syn" then features_.syn."${deps."failure_derive"."0.1.5"."syn" or ""}" deps else {})
    (if deps."failure_derive"."0.1.5" ? "synstructure" then features_.synstructure."${deps."failure_derive"."0.1.5"."synstructure" or ""}" deps else {})
  ];


# end
# finalfusion-0.8.1

  crates.finalfusion."0.8.1" = deps: { features?(features_."finalfusion"."0.8.1" deps {}) }: buildRustCrate {
    crateName = "finalfusion";
    version = "0.8.1";
    description = "Reader and writer for common word embedding formats";
    homepage = "https://github.com/finalfusion/finalfusion-rust";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "1j73wv5dqp61nk9ndzxjpia40lyf4g757v87d26r06qyzrad3pqx";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."finalfusion"."0.8.1"."byteorder"}" deps)
      (crates."fnv"."${deps."finalfusion"."0.8.1"."fnv"}" deps)
      (crates."itertools"."${deps."finalfusion"."0.8.1"."itertools"}" deps)
      (crates."memmap"."${deps."finalfusion"."0.8.1"."memmap"}" deps)
      (crates."ndarray"."${deps."finalfusion"."0.8.1"."ndarray"}" deps)
      (crates."ordered_float"."${deps."finalfusion"."0.8.1"."ordered_float"}" deps)
      (crates."rand"."${deps."finalfusion"."0.8.1"."rand"}" deps)
      (crates."rand_xorshift"."${deps."finalfusion"."0.8.1"."rand_xorshift"}" deps)
      (crates."reductive"."${deps."finalfusion"."0.8.1"."reductive"}" deps)
      (crates."serde"."${deps."finalfusion"."0.8.1"."serde"}" deps)
      (crates."toml"."${deps."finalfusion"."0.8.1"."toml"}" deps)
    ]);
  };
  features_."finalfusion"."0.8.1" = deps: f: updateFeatures f (rec {
    byteorder."${deps.finalfusion."0.8.1".byteorder}".default = true;
    finalfusion."0.8.1".default = (f.finalfusion."0.8.1".default or true);
    fnv."${deps.finalfusion."0.8.1".fnv}".default = true;
    itertools."${deps.finalfusion."0.8.1".itertools}".default = true;
    memmap."${deps.finalfusion."0.8.1".memmap}".default = true;
    ndarray."${deps.finalfusion."0.8.1".ndarray}".default = true;
    ordered_float."${deps.finalfusion."0.8.1".ordered_float}".default = true;
    rand."${deps.finalfusion."0.8.1".rand}".default = true;
    rand_xorshift."${deps.finalfusion."0.8.1".rand_xorshift}".default = true;
    reductive."${deps.finalfusion."0.8.1".reductive}".default = true;
    serde = fold recursiveUpdate {} [
      { "${deps.finalfusion."0.8.1".serde}"."derive" = true; }
      { "${deps.finalfusion."0.8.1".serde}".default = true; }
    ];
    toml."${deps.finalfusion."0.8.1".toml}".default = true;
  }) [
    (if deps."finalfusion"."0.8.1" ? "byteorder" then features_.byteorder."${deps."finalfusion"."0.8.1"."byteorder" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "fnv" then features_.fnv."${deps."finalfusion"."0.8.1"."fnv" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "itertools" then features_.itertools."${deps."finalfusion"."0.8.1"."itertools" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "memmap" then features_.memmap."${deps."finalfusion"."0.8.1"."memmap" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "ndarray" then features_.ndarray."${deps."finalfusion"."0.8.1"."ndarray" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "ordered_float" then features_.ordered_float."${deps."finalfusion"."0.8.1"."ordered_float" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "rand" then features_.rand."${deps."finalfusion"."0.8.1"."rand" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "rand_xorshift" then features_.rand_xorshift."${deps."finalfusion"."0.8.1"."rand_xorshift" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "reductive" then features_.reductive."${deps."finalfusion"."0.8.1"."reductive" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "serde" then features_.serde."${deps."finalfusion"."0.8.1"."serde" or ""}" deps else {})
    (if deps."finalfusion"."0.8.1" ? "toml" then features_.toml."${deps."finalfusion"."0.8.1"."toml" or ""}" deps else {})
  ];


# end
# fnv-1.0.6

  crates.fnv."1.0.6" = deps: { features?(features_."fnv"."1.0.6" deps {}) }: buildRustCrate {
    crateName = "fnv";
    version = "1.0.6";
    description = "Fowler–Noll–Vo hash function";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "128mlh23y3gg6ag5h8iiqlcbl59smisdzraqy88ldrf75kbw27ip";
    libPath = "lib.rs";
  };
  features_."fnv"."1.0.6" = deps: f: updateFeatures f (rec {
    fnv."1.0.6".default = (f.fnv."1.0.6".default or true);
  }) [];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_."fuchsia_cprng"."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    description = "Rust crate for the Fuchsia cryptographically secure pseudorandom number generator";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_."fuchsia_cprng"."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# getopts-0.2.19

  crates.getopts."0.2.19" = deps: { features?(features_."getopts"."0.2.19" deps {}) }: buildRustCrate {
    crateName = "getopts";
    version = "0.2.19";
    description = "getopts-like option parsing.
";
    homepage = "https://github.com/rust-lang/getopts";
    authors = [ "The Rust Project Developers" ];
    sha256 = "01wcnfvhza4pr4g31v3mvq0f83fmnj0walyv82rvaiqbl5srgyg6";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."getopts"."0.2.19"."unicode_width"}" deps)
    ]);
  };
  features_."getopts"."0.2.19" = deps: f: updateFeatures f (rec {
    getopts."0.2.19".default = (f.getopts."0.2.19".default or true);
    unicode_width."${deps.getopts."0.2.19".unicode_width}".default = true;
  }) [
    (if deps."getopts"."0.2.19" ? "unicode_width" then features_.unicode_width."${deps."getopts"."0.2.19"."unicode_width" or ""}" deps else {})
  ];


# end
# humantime-1.2.0

  crates.humantime."1.2.0" = deps: { features?(features_."humantime"."1.2.0" deps {}) }: buildRustCrate {
    crateName = "humantime";
    version = "1.2.0";
    description = "    A parser and formatter for std::time::{Duration, SystemTime}
";
    homepage = "https://github.com/tailhook/humantime";
    authors = [ "Paul Colomiets <paul@colomiets.name>" ];
    sha256 = "0wlcxzz2mhq0brkfbjb12hc6jm17bgm8m6pdgblw4qjwmf26aw28";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."quick_error"."${deps."humantime"."1.2.0"."quick_error"}" deps)
    ]);
  };
  features_."humantime"."1.2.0" = deps: f: updateFeatures f (rec {
    humantime."1.2.0".default = (f.humantime."1.2.0".default or true);
    quick_error."${deps.humantime."1.2.0".quick_error}".default = true;
  }) [
    (if deps."humantime"."1.2.0" ? "quick_error" then features_.quick_error."${deps."humantime"."1.2.0"."quick_error" or ""}" deps else {})
  ];


# end
# itertools-0.7.11

  crates.itertools."0.7.11" = deps: { features?(features_."itertools"."0.7.11" deps {}) }: buildRustCrate {
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
  features_."itertools"."0.7.11" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.7.11".either}".default = (f.either."${deps.itertools."0.7.11".either}".default or false);
    itertools = fold recursiveUpdate {} [
      { "0.7.11"."use_std" =
        (f.itertools."0.7.11"."use_std" or false) ||
        (f.itertools."0.7.11"."default" or false) ||
        (itertools."0.7.11"."default" or false); }
      { "0.7.11".default = (f.itertools."0.7.11".default or true); }
    ];
  }) [
    (if deps."itertools"."0.7.11" ? "either" then features_.either."${deps."itertools"."0.7.11"."either" or ""}" deps else {})
  ];


# end
# itertools-0.8.0

  crates.itertools."0.8.0" = deps: { features?(features_."itertools"."0.8.0" deps {}) }: buildRustCrate {
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
  features_."itertools"."0.8.0" = deps: f: updateFeatures f (rec {
    either."${deps.itertools."0.8.0".either}".default = (f.either."${deps.itertools."0.8.0".either}".default or false);
    itertools = fold recursiveUpdate {} [
      { "0.8.0"."use_std" =
        (f.itertools."0.8.0"."use_std" or false) ||
        (f.itertools."0.8.0"."default" or false) ||
        (itertools."0.8.0"."default" or false); }
      { "0.8.0".default = (f.itertools."0.8.0".default or true); }
    ];
  }) [
    (if deps."itertools"."0.8.0" ? "either" then features_.either."${deps."itertools"."0.8.0"."either" or ""}" deps else {})
  ];


# end
# lapacke-0.2.0

  crates.lapacke."0.2.0" = deps: { features?(features_."lapacke"."0.2.0" deps {}) }: buildRustCrate {
    crateName = "lapacke";
    version = "0.2.0";
    description = "The package provides wrappers for LAPACKE (C).";
    homepage = "https://github.com/blas-lapack-rs/lapacke";
    authors = [ "Ivan Ukhov <ivan.ukhov@gmail.com>" ];
    sha256 = "0dwc4n7m7pi3i3jiis7ajkl4sjax57lvgvajhq30m59bzyhxzlid";
    dependencies = mapFeatures features ([
      (crates."lapacke_sys"."${deps."lapacke"."0.2.0"."lapacke_sys"}" deps)
      (crates."libc"."${deps."lapacke"."0.2.0"."libc"}" deps)
      (crates."num_complex"."${deps."lapacke"."0.2.0"."num_complex"}" deps)
    ]);
  };
  features_."lapacke"."0.2.0" = deps: f: updateFeatures f (rec {
    lapacke."0.2.0".default = (f.lapacke."0.2.0".default or true);
    lapacke_sys."${deps.lapacke."0.2.0".lapacke_sys}".default = true;
    libc."${deps.lapacke."0.2.0".libc}".default = true;
    num_complex."${deps.lapacke."0.2.0".num_complex}".default = (f.num_complex."${deps.lapacke."0.2.0".num_complex}".default or false);
  }) [
    (if deps."lapacke"."0.2.0" ? "lapacke_sys" then features_.lapacke_sys."${deps."lapacke"."0.2.0"."lapacke_sys" or ""}" deps else {})
    (if deps."lapacke"."0.2.0" ? "libc" then features_.libc."${deps."lapacke"."0.2.0"."libc" or ""}" deps else {})
    (if deps."lapacke"."0.2.0" ? "num_complex" then features_.num_complex."${deps."lapacke"."0.2.0"."num_complex" or ""}" deps else {})
  ];


# end
# lapacke-sys-0.1.4

  crates.lapacke_sys."0.1.4" = deps: { features?(features_."lapacke_sys"."0.1.4" deps {}) }: buildRustCrate {
    crateName = "lapacke-sys";
    version = "0.1.4";
    description = "The package provides bindings to LAPACKE (C).";
    homepage = "https://github.com/blas-lapack-rs/lapacke-sys";
    authors = [ "Ivan Ukhov <ivan.ukhov@gmail.com>" ];
    sha256 = "0xqdqqy745g2ryidqhqqvbic0qkv1jisl7f2b8zv94xjyxlp7x4f";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."lapacke_sys"."0.1.4"."libc"}" deps)
    ]);
  };
  features_."lapacke_sys"."0.1.4" = deps: f: updateFeatures f (rec {
    lapacke_sys."0.1.4".default = (f.lapacke_sys."0.1.4".default or true);
    libc."${deps.lapacke_sys."0.1.4".libc}".default = true;
  }) [
    (if deps."lapacke_sys"."0.1.4" ? "libc" then features_.libc."${deps."lapacke_sys"."0.1.4"."libc" or ""}" deps else {})
  ];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_."lazy_static"."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    description = "A macro for declaring lazily evaluated statics in Rust.";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_."lazy_static"."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0"."spin" =
        (f.lazy_static."1.3.0"."spin" or false) ||
        (f.lazy_static."1.3.0"."spin_no_std" or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
    ];
  }) [];


# end
# libc-0.2.60

  crates.libc."0.2.60" = deps: { features?(features_."libc"."0.2.60" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.60";
    description = "Raw FFI bindings to platform libraries like libc.
";
    homepage = "https://github.com/rust-lang/libc";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1zklw10b6lwz6ldamxvdxr8gsxbqhphxhn8n5n5dndl7avafx49b";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.60" or {});
  };
  features_."libc"."0.2.60" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.60"."align" =
        (f.libc."0.2.60"."align" or false) ||
        (f.libc."0.2.60"."rustc-dep-of-std" or false) ||
        (libc."0.2.60"."rustc-dep-of-std" or false); }
      { "0.2.60"."rustc-std-workspace-core" =
        (f.libc."0.2.60"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.60"."rustc-dep-of-std" or false) ||
        (libc."0.2.60"."rustc-dep-of-std" or false); }
      { "0.2.60"."std" =
        (f.libc."0.2.60"."std" or false) ||
        (f.libc."0.2.60"."default" or false) ||
        (libc."0.2.60"."default" or false) ||
        (f.libc."0.2.60"."use_std" or false) ||
        (libc."0.2.60"."use_std" or false); }
      { "0.2.60".default = (f.libc."0.2.60".default or true); }
    ];
  }) [];


# end
# log-0.4.8

  crates.log."0.4.8" = deps: { features?(features_."log"."0.4.8" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.8";
    description = "A lightweight logging facade for Rust
";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0wvzzzcn89dai172rrqcyz06pzldyyy0lf0w71csmn206rdpnb15";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.8"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.8" or {});
  };
  features_."log"."0.4.8" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.8".cfg_if}".default = true;
    log = fold recursiveUpdate {} [
      { "0.4.8"."kv_unstable" =
        (f.log."0.4.8"."kv_unstable" or false) ||
        (f.log."0.4.8"."kv_unstable_sval" or false) ||
        (log."0.4.8"."kv_unstable_sval" or false); }
      { "0.4.8".default = (f.log."0.4.8".default or true); }
    ];
  }) [
    (if deps."log"."0.4.8" ? "cfg_if" then features_.cfg_if."${deps."log"."0.4.8"."cfg_if" or ""}" deps else {})
  ];


# end
# matrixmultiply-0.1.15

  crates.matrixmultiply."0.1.15" = deps: { features?(features_."matrixmultiply"."0.1.15" deps {}) }: buildRustCrate {
    crateName = "matrixmultiply";
    version = "0.1.15";
    description = "General matrix multiplication of f32 and f64 matrices in Rust. Supports matrices with general strides. Uses a microkernel strategy, so that the implementation is easy to parallelize and optimize. `RUSTFLAGS=\\\"-C target-cpu=native\\\"` is your friend here.";
    authors = [ "bluss" ];
    sha256 = "0ix1i4lnkfqnzv8f9wr34bf0mlr1sx5hr7yr70k4npxmwxscvdj5";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rawpointer"."${deps."matrixmultiply"."0.1.15"."rawpointer"}" deps)
    ]);
  };
  features_."matrixmultiply"."0.1.15" = deps: f: updateFeatures f (rec {
    matrixmultiply."0.1.15".default = (f.matrixmultiply."0.1.15".default or true);
    rawpointer."${deps.matrixmultiply."0.1.15".rawpointer}".default = true;
  }) [
    (if deps."matrixmultiply"."0.1.15" ? "rawpointer" then features_.rawpointer."${deps."matrixmultiply"."0.1.15"."rawpointer" or ""}" deps else {})
  ];


# end
# memchr-2.2.1

  crates.memchr."2.2.1" = deps: { features?(features_."memchr"."2.2.1" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.1";
    description = "Safe interface to memchr.";
    homepage = "https://github.com/BurntSushi/rust-memchr";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "1mj5z8lhz6jbapslpq8a39pwcsl1p0jmgp7wgcj7nv4pcqhya7a0";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.1" or {});
  };
  features_."memchr"."2.2.1" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.1"."use_std" =
        (f.memchr."2.2.1"."use_std" or false) ||
        (f.memchr."2.2.1"."default" or false) ||
        (memchr."2.2.1"."default" or false); }
      { "2.2.1".default = (f.memchr."2.2.1".default or true); }
    ];
  }) [];


# end
# memmap-0.7.0

  crates.memmap."0.7.0" = deps: { features?(features_."memmap"."0.7.0" deps {}) }: buildRustCrate {
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
  features_."memmap"."0.7.0" = deps: f: updateFeatures f (rec {
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
    (if deps."memmap"."0.7.0" ? "libc" then features_.libc."${deps."memmap"."0.7.0"."libc" or ""}" deps else {})
    (if deps."memmap"."0.7.0" ? "winapi" then features_.winapi."${deps."memmap"."0.7.0"."winapi" or ""}" deps else {})
  ];


# end
# memoffset-0.5.1

  crates.memoffset."0.5.1" = deps: { features?(features_."memoffset"."0.5.1" deps {}) }: buildRustCrate {
    crateName = "memoffset";
    version = "0.5.1";
    description = "offset_of functionality for Rust structs.";
    authors = [ "Gilad Naaman <gilad.naaman@gmail.com>" ];
    sha256 = "0fsk7kfk193f1aamafl45vvcp7j6p7c14ss7d583fijw3w5kj69k";

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."memoffset"."0.5.1"."rustc_version"}" deps)
    ]);
  };
  features_."memoffset"."0.5.1" = deps: f: updateFeatures f (rec {
    memoffset."0.5.1".default = (f.memoffset."0.5.1".default or true);
    rustc_version."${deps.memoffset."0.5.1".rustc_version}".default = true;
  }) [
    (if deps."memoffset"."0.5.1" ? "rustc_version" then features_.rustc_version."${deps."memoffset"."0.5.1"."rustc_version" or ""}" deps else {})
  ];


# end
# ndarray-0.12.1

  crates.ndarray."0.12.1" = deps: { features?(features_."ndarray"."0.12.1" deps {}) }: buildRustCrate {
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
    ]
      ++ (if features.ndarray."0.12.1".blas-src or false then [ (crates.blas_src."${deps."ndarray"."0.12.1".blas_src}" deps) ] else [])
      ++ (if features.ndarray."0.12.1".cblas-sys or false then [ (crates.cblas_sys."${deps."ndarray"."0.12.1".cblas_sys}" deps) ] else []));
    features = mkFeatures (features."ndarray"."0.12.1" or {});
  };
  features_."ndarray"."0.12.1" = deps: f: updateFeatures f (rec {
    itertools."${deps.ndarray."0.12.1".itertools}".default = (f.itertools."${deps.ndarray."0.12.1".itertools}".default or false);
    matrixmultiply."${deps.ndarray."0.12.1".matrixmultiply}".default = true;
    ndarray = fold recursiveUpdate {} [
      { "0.12.1"."blas" =
        (f.ndarray."0.12.1"."blas" or false) ||
        (f.ndarray."0.12.1"."test-blas-openblas-sys" or false) ||
        (ndarray."0.12.1"."test-blas-openblas-sys" or false); }
      { "0.12.1"."blas-src" =
        (f.ndarray."0.12.1"."blas-src" or false) ||
        (f.ndarray."0.12.1"."blas" or false) ||
        (ndarray."0.12.1"."blas" or false); }
      { "0.12.1"."cblas-sys" =
        (f.ndarray."0.12.1"."cblas-sys" or false) ||
        (f.ndarray."0.12.1"."blas" or false) ||
        (ndarray."0.12.1"."blas" or false); }
      { "0.12.1"."rustc-serialize" =
        (f.ndarray."0.12.1"."rustc-serialize" or false) ||
        (f.ndarray."0.12.1"."docs" or false) ||
        (ndarray."0.12.1"."docs" or false); }
      { "0.12.1"."serde" =
        (f.ndarray."0.12.1"."serde" or false) ||
        (f.ndarray."0.12.1"."serde-1" or false) ||
        (ndarray."0.12.1"."serde-1" or false); }
      { "0.12.1"."serde-1" =
        (f.ndarray."0.12.1"."serde-1" or false) ||
        (f.ndarray."0.12.1"."docs" or false) ||
        (ndarray."0.12.1"."docs" or false); }
      { "0.12.1"."test-blas-openblas-sys" =
        (f.ndarray."0.12.1"."test-blas-openblas-sys" or false) ||
        (f.ndarray."0.12.1"."test" or false) ||
        (ndarray."0.12.1"."test" or false); }
      { "0.12.1".default = (f.ndarray."0.12.1".default or true); }
    ];
    num_complex."${deps.ndarray."0.12.1".num_complex}".default = true;
    num_traits."${deps.ndarray."0.12.1".num_traits}".default = true;
  }) [
    (f: if deps."ndarray"."0.12.1" ? "blas_src" then recursiveUpdate f { blas_src."${deps."ndarray"."0.12.1"."blas_src"}"."default" = false; } else f)
    (f: if deps."ndarray"."0.12.1" ? "cblas_sys" then recursiveUpdate f { cblas_sys."${deps."ndarray"."0.12.1"."cblas_sys"}"."default" = false; } else f)
    (if deps."ndarray"."0.12.1" ? "blas_src" then features_.blas_src."${deps."ndarray"."0.12.1"."blas_src" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "cblas_sys" then features_.cblas_sys."${deps."ndarray"."0.12.1"."cblas_sys" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "itertools" then features_.itertools."${deps."ndarray"."0.12.1"."itertools" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "matrixmultiply" then features_.matrixmultiply."${deps."ndarray"."0.12.1"."matrixmultiply" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "num_complex" then features_.num_complex."${deps."ndarray"."0.12.1"."num_complex" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "num_traits" then features_.num_traits."${deps."ndarray"."0.12.1"."num_traits" or ""}" deps else {})
  ];


# end
# ndarray-linalg-0.10.0

  crates.ndarray_linalg."0.10.0" = deps: { features?(features_."ndarray_linalg"."0.10.0" deps {}) }: buildRustCrate {
    crateName = "ndarray-linalg";
    version = "0.10.0";
    description = "Linear algebra package for rust-ndarray using LAPACK";
    authors = [ "Toshiki Teramura <toshiki.teramura@gmail.com>" ];
    sha256 = "189mphp9ydixsmi8bhn8jibh8f76g62a4c6iamwbsakf1w5cdg09";
    dependencies = mapFeatures features ([
      (crates."derive_new"."${deps."ndarray_linalg"."0.10.0"."derive_new"}" deps)
      (crates."lapacke"."${deps."ndarray_linalg"."0.10.0"."lapacke"}" deps)
      (crates."ndarray"."${deps."ndarray_linalg"."0.10.0"."ndarray"}" deps)
      (crates."num_complex"."${deps."ndarray_linalg"."0.10.0"."num_complex"}" deps)
      (crates."num_traits"."${deps."ndarray_linalg"."0.10.0"."num_traits"}" deps)
      (crates."procedurals"."${deps."ndarray_linalg"."0.10.0"."procedurals"}" deps)
      (crates."rand"."${deps."ndarray_linalg"."0.10.0"."rand"}" deps)
    ]);
    features = mkFeatures (features."ndarray_linalg"."0.10.0" or {});
  };
  features_."ndarray_linalg"."0.10.0" = deps: f: updateFeatures f (rec {
    derive_new."${deps.ndarray_linalg."0.10.0".derive_new}".default = true;
    lapacke."${deps.ndarray_linalg."0.10.0".lapacke}".default = true;
    ndarray = fold recursiveUpdate {} [
      { "${deps.ndarray_linalg."0.10.0".ndarray}"."blas" = true; }
      { "${deps.ndarray_linalg."0.10.0".ndarray}"."serde-1" =
        (f.ndarray."${deps.ndarray_linalg."0.10.0".ndarray}"."serde-1" or false) ||
        (ndarray_linalg."0.10.0"."serde-1" or false) ||
        (f."ndarray_linalg"."0.10.0"."serde-1" or false); }
      { "${deps.ndarray_linalg."0.10.0".ndarray}".default = (f.ndarray."${deps.ndarray_linalg."0.10.0".ndarray}".default or false); }
    ];
    ndarray_linalg = fold recursiveUpdate {} [
      { "0.10.0"."netlib-src" =
        (f.ndarray_linalg."0.10.0"."netlib-src" or false) ||
        (f.ndarray_linalg."0.10.0"."netlib" or false) ||
        (ndarray_linalg."0.10.0"."netlib" or false); }
      { "0.10.0"."openblas-src" =
        (f.ndarray_linalg."0.10.0"."openblas-src" or false) ||
        (f.ndarray_linalg."0.10.0"."openblas" or false) ||
        (ndarray_linalg."0.10.0"."openblas" or false); }
      { "0.10.0".default = (f.ndarray_linalg."0.10.0".default or true); }
    ];
    num_complex = fold recursiveUpdate {} [
      { "${deps.ndarray_linalg."0.10.0".num_complex}"."serde" =
        (f.num_complex."${deps.ndarray_linalg."0.10.0".num_complex}"."serde" or false) ||
        (ndarray_linalg."0.10.0"."serde-1" or false) ||
        (f."ndarray_linalg"."0.10.0"."serde-1" or false); }
      { "${deps.ndarray_linalg."0.10.0".num_complex}".default = (f.num_complex."${deps.ndarray_linalg."0.10.0".num_complex}".default or false); }
    ];
    num_traits."${deps.ndarray_linalg."0.10.0".num_traits}".default = true;
    procedurals."${deps.ndarray_linalg."0.10.0".procedurals}".default = true;
    rand."${deps.ndarray_linalg."0.10.0".rand}".default = true;
  }) [
    (if deps."ndarray_linalg"."0.10.0" ? "derive_new" then features_.derive_new."${deps."ndarray_linalg"."0.10.0"."derive_new" or ""}" deps else {})
    (if deps."ndarray_linalg"."0.10.0" ? "lapacke" then features_.lapacke."${deps."ndarray_linalg"."0.10.0"."lapacke" or ""}" deps else {})
    (if deps."ndarray_linalg"."0.10.0" ? "ndarray" then features_.ndarray."${deps."ndarray_linalg"."0.10.0"."ndarray" or ""}" deps else {})
    (if deps."ndarray_linalg"."0.10.0" ? "num_complex" then features_.num_complex."${deps."ndarray_linalg"."0.10.0"."num_complex" or ""}" deps else {})
    (if deps."ndarray_linalg"."0.10.0" ? "num_traits" then features_.num_traits."${deps."ndarray_linalg"."0.10.0"."num_traits" or ""}" deps else {})
    (if deps."ndarray_linalg"."0.10.0" ? "procedurals" then features_.procedurals."${deps."ndarray_linalg"."0.10.0"."procedurals" or ""}" deps else {})
    (if deps."ndarray_linalg"."0.10.0" ? "rand" then features_.rand."${deps."ndarray_linalg"."0.10.0"."rand" or ""}" deps else {})
  ];


# end
# ndarray-parallel-0.9.0

  crates.ndarray_parallel."0.9.0" = deps: { features?(features_."ndarray_parallel"."0.9.0" deps {}) }: buildRustCrate {
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
  features_."ndarray_parallel"."0.9.0" = deps: f: updateFeatures f (rec {
    ndarray."${deps.ndarray_parallel."0.9.0".ndarray}".default = true;
    ndarray_parallel."0.9.0".default = (f.ndarray_parallel."0.9.0".default or true);
    rayon."${deps.ndarray_parallel."0.9.0".rayon}".default = true;
  }) [
    (if deps."ndarray_parallel"."0.9.0" ? "ndarray" then features_.ndarray."${deps."ndarray_parallel"."0.9.0"."ndarray" or ""}" deps else {})
    (if deps."ndarray_parallel"."0.9.0" ? "rayon" then features_.rayon."${deps."ndarray_parallel"."0.9.0"."rayon" or ""}" deps else {})
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_."nodrop"."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    description = "A wrapper type to inhibit drop (destructor). Use std::mem::ManuallyDrop instead!";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_."nodrop"."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13"."nodrop-union" =
        (f.nodrop."0.1.13"."nodrop-union" or false) ||
        (f.nodrop."0.1.13"."use_union" or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13"."std" =
        (f.nodrop."0.1.13"."std" or false) ||
        (f.nodrop."0.1.13"."default" or false) ||
        (nodrop."0.1.13"."default" or false); }
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
    ];
  }) [];


# end
# num-complex-0.2.3

  crates.num_complex."0.2.3" = deps: { features?(features_."num_complex"."0.2.3" deps {}) }: buildRustCrate {
    crateName = "num-complex";
    version = "0.2.3";
    description = "Complex numbers implementation for Rust";
    homepage = "https://github.com/rust-num/num-complex";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1l8gwn4cqhx77wzhzslwxhryrr5h4vsv19ys8wr5xb1g332805m9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."num_complex"."0.2.3"."num_traits"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_complex"."0.2.3"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_complex"."0.2.3" or {});
  };
  features_."num_complex"."0.2.3" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_complex."0.2.3".autocfg}".default = true;
    num_complex = fold recursiveUpdate {} [
      { "0.2.3"."std" =
        (f.num_complex."0.2.3"."std" or false) ||
        (f.num_complex."0.2.3"."default" or false) ||
        (num_complex."0.2.3"."default" or false); }
      { "0.2.3".default = (f.num_complex."0.2.3".default or true); }
    ];
    num_traits = fold recursiveUpdate {} [
      { "${deps.num_complex."0.2.3".num_traits}"."i128" =
        (f.num_traits."${deps.num_complex."0.2.3".num_traits}"."i128" or false) ||
        (num_complex."0.2.3"."i128" or false) ||
        (f."num_complex"."0.2.3"."i128" or false); }
      { "${deps.num_complex."0.2.3".num_traits}"."std" =
        (f.num_traits."${deps.num_complex."0.2.3".num_traits}"."std" or false) ||
        (num_complex."0.2.3"."std" or false) ||
        (f."num_complex"."0.2.3"."std" or false); }
      { "${deps.num_complex."0.2.3".num_traits}".default = (f.num_traits."${deps.num_complex."0.2.3".num_traits}".default or false); }
    ];
  }) [
    (if deps."num_complex"."0.2.3" ? "num_traits" then features_.num_traits."${deps."num_complex"."0.2.3"."num_traits" or ""}" deps else {})
    (if deps."num_complex"."0.2.3" ? "autocfg" then features_.autocfg."${deps."num_complex"."0.2.3"."autocfg" or ""}" deps else {})
  ];


# end
# num-traits-0.2.8

  crates.num_traits."0.2.8" = deps: { features?(features_."num_traits"."0.2.8" deps {}) }: buildRustCrate {
    crateName = "num-traits";
    version = "0.2.8";
    description = "Numeric traits for generic mathematics";
    homepage = "https://github.com/rust-num/num-traits";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1mnlmy35n734n9xlq0qkfbgzz33x09a1s4rfj30p1976p09b862v";
    build = "build.rs";

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."num_traits"."0.2.8"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."num_traits"."0.2.8" or {});
  };
  features_."num_traits"."0.2.8" = deps: f: updateFeatures f (rec {
    autocfg."${deps.num_traits."0.2.8".autocfg}".default = true;
    num_traits = fold recursiveUpdate {} [
      { "0.2.8"."std" =
        (f.num_traits."0.2.8"."std" or false) ||
        (f.num_traits."0.2.8"."default" or false) ||
        (num_traits."0.2.8"."default" or false); }
      { "0.2.8".default = (f.num_traits."0.2.8".default or true); }
    ];
  }) [
    (if deps."num_traits"."0.2.8" ? "autocfg" then features_.autocfg."${deps."num_traits"."0.2.8"."autocfg" or ""}" deps else {})
  ];


# end
# num_cpus-1.10.1

  crates.num_cpus."1.10.1" = deps: { features?(features_."num_cpus"."1.10.1" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.1";
    description = "Get the number of CPUs on a machine.";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1zi5s2cbnqqb0k0kdd6gqn2x97f9bssv44430h6w28awwzppyh8i";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.1"."libc"}" deps)
    ]);
  };
  features_."num_cpus"."1.10.1" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.1".libc}".default = true;
    num_cpus."1.10.1".default = (f.num_cpus."1.10.1".default or true);
  }) [
    (if deps."num_cpus"."1.10.1" ? "libc" then features_.libc."${deps."num_cpus"."1.10.1"."libc" or ""}" deps else {})
  ];


# end
# ordered-float-1.0.2

  crates.ordered_float."1.0.2" = deps: { features?(features_."ordered_float"."1.0.2" deps {}) }: buildRustCrate {
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
  features_."ordered_float"."1.0.2" = deps: f: updateFeatures f (rec {
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
        (f.ordered_float."1.0.2"."default" or false) ||
        (ordered_float."1.0.2"."default" or false); }
      { "1.0.2".default = (f.ordered_float."1.0.2".default or true); }
    ];
  }) [
    (if deps."ordered_float"."1.0.2" ? "num_traits" then features_.num_traits."${deps."ordered_float"."1.0.2"."num_traits" or ""}" deps else {})
  ];


# end
# proc-macro2-0.4.30

  crates.proc_macro2."0.4.30" = deps: { features?(features_."proc_macro2"."0.4.30" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.30";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an
option, off by default, to also reimplement itself in terms of the upstream
unstable API.
";
    homepage = "https://github.com/alexcrichton/proc-macro2";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0iifv51wrm6r4r2gghw6rray3nv53zcap355bbz1nsmbhj5s09b9";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.30"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.30" or {});
  };
  features_."proc_macro2"."0.4.30" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.30"."proc-macro" =
        (f.proc_macro2."0.4.30"."proc-macro" or false) ||
        (f.proc_macro2."0.4.30"."default" or false) ||
        (proc_macro2."0.4.30"."default" or false); }
      { "0.4.30".default = (f.proc_macro2."0.4.30".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.30".unicode_xid}".default = true;
  }) [
    (if deps."proc_macro2"."0.4.30" ? "unicode_xid" then features_.unicode_xid."${deps."proc_macro2"."0.4.30"."unicode_xid" or ""}" deps else {})
  ];


# end
# procedurals-0.3.1

  crates.procedurals."0.3.1" = deps: { features?(features_."procedurals"."0.3.1" deps {}) }: buildRustCrate {
    crateName = "procedurals";
    version = "0.3.1";
    description = "Collection of proc-macros";
    authors = [ "Toshiki Teramura <toshiki.teramura@gmail.com>" ];
    sha256 = "1kgn46difa9r4vgpg610brx4hazm226d5wph088h7m5v4yc7j9iy";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."quote"."${deps."procedurals"."0.3.1"."quote"}" deps)
      (crates."syn"."${deps."procedurals"."0.3.1"."syn"}" deps)
    ]);
  };
  features_."procedurals"."0.3.1" = deps: f: updateFeatures f (rec {
    procedurals."0.3.1".default = (f.procedurals."0.3.1".default or true);
    quote."${deps.procedurals."0.3.1".quote}".default = true;
    syn."${deps.procedurals."0.3.1".syn}".default = true;
  }) [
    (if deps."procedurals"."0.3.1" ? "quote" then features_.quote."${deps."procedurals"."0.3.1"."quote" or ""}" deps else {})
    (if deps."procedurals"."0.3.1" ? "syn" then features_.syn."${deps."procedurals"."0.3.1"."syn" or ""}" deps else {})
  ];


# end
# quick-error-1.2.2

  crates.quick_error."1.2.2" = deps: { features?(features_."quick_error"."1.2.2" deps {}) }: buildRustCrate {
    crateName = "quick-error";
    version = "1.2.2";
    description = "    A macro which makes error types pleasant to write.
";
    homepage = "http://github.com/tailhook/quick-error";
    authors = [ "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" ];
    sha256 = "192a3adc5phgpibgqblsdx1b421l5yg9bjbmv552qqq9f37h60k5";
  };
  features_."quick_error"."1.2.2" = deps: f: updateFeatures f (rec {
    quick_error."1.2.2".default = (f.quick_error."1.2.2".default or true);
  }) [];


# end
# quote-0.6.13

  crates.quote."0.6.13" = deps: { features?(features_."quote"."0.6.13" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.13";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1hrvsin40i4q8swrhlj9057g7nsp0lg02h8zbzmgz14av9mzv8g8";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.13"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.13" or {});
  };
  features_."quote"."0.6.13" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.13".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.13".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.13"."proc-macro" or false) ||
        (f."quote"."0.6.13"."proc-macro" or false); }
      { "${deps.quote."0.6.13".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.13".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.13"."proc-macro" =
        (f.quote."0.6.13"."proc-macro" or false) ||
        (f.quote."0.6.13"."default" or false) ||
        (quote."0.6.13"."default" or false); }
      { "0.6.13".default = (f.quote."0.6.13".default or true); }
    ];
  }) [
    (if deps."quote"."0.6.13" ? "proc_macro2" then features_.proc_macro2."${deps."quote"."0.6.13"."proc_macro2" or ""}" deps else {})
  ];


# end
# rand-0.5.6

  crates.rand."0.5.6" = deps: { features?(features_."rand"."0.5.6" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.5.6";
    description = "Random number generators and other randomness functionality.
";
    homepage = "https://crates.io/crates/rand";
    authors = [ "The Rust Project Developers" ];
    sha256 = "04f1gydiia347cx24n5cw4v21fhh9yga7dw739z4jsxzls2ss8w8";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.5.6"."rand_core"}" deps)
    ])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".cloudabi or false then [ (crates.cloudabi."${deps."rand"."0.5.6".cloudabi}" deps) ] else [])) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".fuchsia-cprng or false then [ (crates.fuchsia_cprng."${deps."rand"."0.5.6".fuchsia_cprng}" deps) ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".libc or false then [ (crates.libc."${deps."rand"."0.5.6".libc}" deps) ] else [])) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
    ]
      ++ (if features.rand."0.5.6".winapi or false then [ (crates.winapi."${deps."rand"."0.5.6".winapi}" deps) ] else [])) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."rand"."0.5.6" or {});
  };
  features_."rand"."0.5.6" = deps: f: updateFeatures f (rec {
    rand = fold recursiveUpdate {} [
      { "0.5.6"."alloc" =
        (f.rand."0.5.6"."alloc" or false) ||
        (f.rand."0.5.6"."std" or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."cloudabi" =
        (f.rand."0.5.6"."cloudabi" or false) ||
        (f.rand."0.5.6"."std" or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."fuchsia-cprng" =
        (f.rand."0.5.6"."fuchsia-cprng" or false) ||
        (f.rand."0.5.6"."std" or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."i128_support" =
        (f.rand."0.5.6"."i128_support" or false) ||
        (f.rand."0.5.6"."nightly" or false) ||
        (rand."0.5.6"."nightly" or false); }
      { "0.5.6"."libc" =
        (f.rand."0.5.6"."libc" or false) ||
        (f.rand."0.5.6"."std" or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6"."serde" =
        (f.rand."0.5.6"."serde" or false) ||
        (f.rand."0.5.6"."serde1" or false) ||
        (rand."0.5.6"."serde1" or false); }
      { "0.5.6"."serde_derive" =
        (f.rand."0.5.6"."serde_derive" or false) ||
        (f.rand."0.5.6"."serde1" or false) ||
        (rand."0.5.6"."serde1" or false); }
      { "0.5.6"."std" =
        (f.rand."0.5.6"."std" or false) ||
        (f.rand."0.5.6"."default" or false) ||
        (rand."0.5.6"."default" or false); }
      { "0.5.6"."winapi" =
        (f.rand."0.5.6"."winapi" or false) ||
        (f.rand."0.5.6"."std" or false) ||
        (rand."0.5.6"."std" or false); }
      { "0.5.6".default = (f.rand."0.5.6".default or true); }
    ];
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.5.6".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.5.6".rand_core}"."alloc" or false) ||
        (rand."0.5.6"."alloc" or false) ||
        (f."rand"."0.5.6"."alloc" or false); }
      { "${deps.rand."0.5.6".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.5.6".rand_core}"."serde1" or false) ||
        (rand."0.5.6"."serde1" or false) ||
        (f."rand"."0.5.6"."serde1" or false); }
      { "${deps.rand."0.5.6".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.5.6".rand_core}"."std" or false) ||
        (rand."0.5.6"."std" or false) ||
        (f."rand"."0.5.6"."std" or false); }
      { "${deps.rand."0.5.6".rand_core}".default = (f.rand_core."${deps.rand."0.5.6".rand_core}".default or false); }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.5.6".winapi}"."minwindef" = true; }
      { "${deps.rand."0.5.6".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.5.6".winapi}"."profileapi" = true; }
      { "${deps.rand."0.5.6".winapi}"."winnt" = true; }
    ];
  }) [
    (f: if deps."rand"."0.5.6" ? "cloudabi" then recursiveUpdate f { cloudabi."${deps."rand"."0.5.6"."cloudabi"}"."default" = true; } else f)
    (f: if deps."rand"."0.5.6" ? "fuchsia_cprng" then recursiveUpdate f { fuchsia_cprng."${deps."rand"."0.5.6"."fuchsia_cprng"}"."default" = true; } else f)
    (f: if deps."rand"."0.5.6" ? "libc" then recursiveUpdate f { libc."${deps."rand"."0.5.6"."libc"}"."default" = true; } else f)
    (f: if deps."rand"."0.5.6" ? "winapi" then recursiveUpdate f { winapi."${deps."rand"."0.5.6"."winapi"}"."default" = true; } else f)
    (if deps."rand"."0.5.6" ? "rand_core" then features_.rand_core."${deps."rand"."0.5.6"."rand_core" or ""}" deps else {})
    (if deps."rand"."0.5.6" ? "cloudabi" then features_.cloudabi."${deps."rand"."0.5.6"."cloudabi" or ""}" deps else {})
    (if deps."rand"."0.5.6" ? "fuchsia_cprng" then features_.fuchsia_cprng."${deps."rand"."0.5.6"."fuchsia_cprng" or ""}" deps else {})
    (if deps."rand"."0.5.6" ? "libc" then features_.libc."${deps."rand"."0.5.6"."libc" or ""}" deps else {})
    (if deps."rand"."0.5.6" ? "winapi" then features_.winapi."${deps."rand"."0.5.6"."winapi" or ""}" deps else {})
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_."rand"."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    description = "Random number generators and other randomness functionality.
";
    homepage = "https://crates.io/crates/rand";
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
  features_."rand"."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5"."alloc" =
        (f.rand."0.6.5"."alloc" or false) ||
        (f.rand."0.6.5"."std" or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."packed_simd" =
        (f.rand."0.6.5"."packed_simd" or false) ||
        (f.rand."0.6.5"."simd_support" or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5"."rand_os" =
        (f.rand."0.6.5"."rand_os" or false) ||
        (f.rand."0.6.5"."std" or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5"."simd_support" =
        (f.rand."0.6.5"."simd_support" or false) ||
        (f.rand."0.6.5"."nightly" or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5"."std" =
        (f.rand."0.6.5"."std" or false) ||
        (f.rand."0.6.5"."default" or false) ||
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
    (f: if deps."rand"."0.6.5" ? "rand_os" then recursiveUpdate f { rand_os."${deps."rand"."0.6.5"."rand_os"}"."default" = true; } else f)
    (if deps."rand"."0.6.5" ? "rand_chacha" then features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "rand_core" then features_.rand_core."${deps."rand"."0.6.5"."rand_core" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "rand_hc" then features_.rand_hc."${deps."rand"."0.6.5"."rand_hc" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "rand_isaac" then features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "rand_jitter" then features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "rand_os" then features_.rand_os."${deps."rand"."0.6.5"."rand_os" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "rand_pcg" then features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "rand_xorshift" then features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "autocfg" then features_.autocfg."${deps."rand"."0.6.5"."autocfg" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "libc" then features_.libc."${deps."rand"."0.6.5"."libc" or ""}" deps else {})
    (if deps."rand"."0.6.5" ? "winapi" then features_.winapi."${deps."rand"."0.6.5"."winapi" or ""}" deps else {})
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_."rand_chacha"."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    description = "ChaCha random number generator
";
    homepage = "https://crates.io/crates/rand_chacha";
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
  features_."rand_chacha"."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (if deps."rand_chacha"."0.1.1" ? "rand_core" then features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core" or ""}" deps else {})
    (if deps."rand_chacha"."0.1.1" ? "autocfg" then features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg" or ""}" deps else {})
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_."rand_core"."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    description = "Core random number generator traits and tools for implementation.
";
    homepage = "https://crates.io/crates/rand_core";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_."rand_core"."0.3.1" = deps: f: updateFeatures f (rec {
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
        (f.rand_core."0.3.1"."default" or false) ||
        (rand_core."0.3.1"."default" or false); }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
    ];
  }) [
    (if deps."rand_core"."0.3.1" ? "rand_core" then features_.rand_core."${deps."rand_core"."0.3.1"."rand_core" or ""}" deps else {})
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_."rand_core"."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    description = "Core random number generator traits and tools for implementation.
";
    homepage = "https://crates.io/crates/rand_core";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_."rand_core"."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0"."alloc" =
        (f.rand_core."0.4.0"."alloc" or false) ||
        (f.rand_core."0.4.0"."std" or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0"."serde" =
        (f.rand_core."0.4.0"."serde" or false) ||
        (f.rand_core."0.4.0"."serde1" or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0"."serde_derive" =
        (f.rand_core."0.4.0"."serde_derive" or false) ||
        (f.rand_core."0.4.0"."serde1" or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_."rand_hc"."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    description = "HC128 random number generator
";
    homepage = "https://crates.io/crates/rand_hc";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_."rand_hc"."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (if deps."rand_hc"."0.1.0" ? "rand_core" then features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core" or ""}" deps else {})
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_."rand_isaac"."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    description = "ISAAC random number generator
";
    homepage = "https://crates.io/crates/rand_isaac";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_."rand_isaac"."0.1.1" = deps: f: updateFeatures f (rec {
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
        (f.rand_isaac."0.1.1"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_isaac."0.1.1"."serde_derive" or false) ||
        (f.rand_isaac."0.1.1"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
    ];
  }) [
    (if deps."rand_isaac"."0.1.1" ? "rand_core" then features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core" or ""}" deps else {})
  ];


# end
# rand_jitter-0.1.4

  crates.rand_jitter."0.1.4" = deps: { features?(features_."rand_jitter"."0.1.4" deps {}) }: buildRustCrate {
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
  features_."rand_jitter"."0.1.4" = deps: f: updateFeatures f (rec {
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
    (if deps."rand_jitter"."0.1.4" ? "rand_core" then features_.rand_core."${deps."rand_jitter"."0.1.4"."rand_core" or ""}" deps else {})
    (if deps."rand_jitter"."0.1.4" ? "libc" then features_.libc."${deps."rand_jitter"."0.1.4"."libc" or ""}" deps else {})
    (if deps."rand_jitter"."0.1.4" ? "winapi" then features_.winapi."${deps."rand_jitter"."0.1.4"."winapi" or ""}" deps else {})
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_."rand_os"."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    description = "OS backed Random Number Generator";
    homepage = "https://crates.io/crates/rand_os";
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
  features_."rand_os"."0.1.3" = deps: f: updateFeatures f (rec {
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
    (if deps."rand_os"."0.1.3" ? "rand_core" then features_.rand_core."${deps."rand_os"."0.1.3"."rand_core" or ""}" deps else {})
    (if deps."rand_os"."0.1.3" ? "rdrand" then features_.rdrand."${deps."rand_os"."0.1.3"."rdrand" or ""}" deps else {})
    (if deps."rand_os"."0.1.3" ? "cloudabi" then features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi" or ""}" deps else {})
    (if deps."rand_os"."0.1.3" ? "fuchsia_cprng" then features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng" or ""}" deps else {})
    (if deps."rand_os"."0.1.3" ? "libc" then features_.libc."${deps."rand_os"."0.1.3"."libc" or ""}" deps else {})
    (if deps."rand_os"."0.1.3" ? "winapi" then features_.winapi."${deps."rand_os"."0.1.3"."winapi" or ""}" deps else {})
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_."rand_pcg"."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    description = "Selected PCG random number generators
";
    homepage = "https://crates.io/crates/rand_pcg";
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
  features_."rand_pcg"."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2"."serde" =
        (f.rand_pcg."0.1.2"."serde" or false) ||
        (f.rand_pcg."0.1.2"."serde1" or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2"."serde_derive" =
        (f.rand_pcg."0.1.2"."serde_derive" or false) ||
        (f.rand_pcg."0.1.2"."serde1" or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
    ];
  }) [
    (if deps."rand_pcg"."0.1.2" ? "rand_core" then features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core" or ""}" deps else {})
    (if deps."rand_pcg"."0.1.2" ? "autocfg" then features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg" or ""}" deps else {})
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_."rand_xorshift"."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    description = "Xorshift random number generator
";
    homepage = "https://crates.io/crates/rand_xorshift";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_."rand_xorshift"."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1"."serde" =
        (f.rand_xorshift."0.1.1"."serde" or false) ||
        (f.rand_xorshift."0.1.1"."serde1" or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1"."serde_derive" =
        (f.rand_xorshift."0.1.1"."serde_derive" or false) ||
        (f.rand_xorshift."0.1.1"."serde1" or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
    ];
  }) [
    (if deps."rand_xorshift"."0.1.1" ? "rand_core" then features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core" or ""}" deps else {})
  ];


# end
# rawpointer-0.1.0

  crates.rawpointer."0.1.0" = deps: { features?(features_."rawpointer"."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rawpointer";
    version = "0.1.0";
    description = "Extra methods for raw pointers.

For example `.post_inc()` and `.pre_dec()` (c.f. `ptr++` and `--ptr`) and
`ptrdistance`.
";
    authors = [ "bluss" ];
    sha256 = "0hblv2cv310ixf5f1jw4nk9w5pb95wh4dwqyjv07g2xrshbw6j04";
  };
  features_."rawpointer"."0.1.0" = deps: f: updateFeatures f (rec {
    rawpointer."0.1.0".default = (f.rawpointer."0.1.0".default or true);
  }) [];


# end
# rayon-1.1.0

  crates.rayon."1.1.0" = deps: { features?(features_."rayon"."1.1.0" deps {}) }: buildRustCrate {
    crateName = "rayon";
    version = "1.1.0";
    description = "Simple work-stealing parallelism for Rust";
    authors = [ "Niko Matsakis <niko@alum.mit.edu>" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "07984mgfdkv8zfg8b9wvjssfhm8wz1x9ls2lc9dfmbjv7kmfag4l";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."rayon"."1.1.0"."crossbeam_deque"}" deps)
      (crates."either"."${deps."rayon"."1.1.0"."either"}" deps)
      (crates."rayon_core"."${deps."rayon"."1.1.0"."rayon_core"}" deps)
    ]);
  };
  features_."rayon"."1.1.0" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.rayon."1.1.0".crossbeam_deque}".default = true;
    either."${deps.rayon."1.1.0".either}".default = (f.either."${deps.rayon."1.1.0".either}".default or false);
    rayon."1.1.0".default = (f.rayon."1.1.0".default or true);
    rayon_core."${deps.rayon."1.1.0".rayon_core}".default = true;
  }) [
    (if deps."rayon"."1.1.0" ? "crossbeam_deque" then features_.crossbeam_deque."${deps."rayon"."1.1.0"."crossbeam_deque" or ""}" deps else {})
    (if deps."rayon"."1.1.0" ? "either" then features_.either."${deps."rayon"."1.1.0"."either" or ""}" deps else {})
    (if deps."rayon"."1.1.0" ? "rayon_core" then features_.rayon_core."${deps."rayon"."1.1.0"."rayon_core" or ""}" deps else {})
  ];


# end
# rayon-core-1.5.0

  crates.rayon_core."1.5.0" = deps: { features?(features_."rayon_core"."1.5.0" deps {}) }: buildRustCrate {
    crateName = "rayon-core";
    version = "1.5.0";
    description = "Core APIs for Rayon";
    authors = [ "Niko Matsakis <niko@alum.mit.edu>" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "1aarjhj57dppxz3b2rvwdxvq47464sm84423vpwjm9yll8pc2ac7";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."rayon_core"."1.5.0"."crossbeam_deque"}" deps)
      (crates."crossbeam_queue"."${deps."rayon_core"."1.5.0"."crossbeam_queue"}" deps)
      (crates."crossbeam_utils"."${deps."rayon_core"."1.5.0"."crossbeam_utils"}" deps)
      (crates."lazy_static"."${deps."rayon_core"."1.5.0"."lazy_static"}" deps)
      (crates."num_cpus"."${deps."rayon_core"."1.5.0"."num_cpus"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
]) else []);
  };
  features_."rayon_core"."1.5.0" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.rayon_core."1.5.0".crossbeam_deque}".default = true;
    crossbeam_queue."${deps.rayon_core."1.5.0".crossbeam_queue}".default = true;
    crossbeam_utils."${deps.rayon_core."1.5.0".crossbeam_utils}".default = true;
    lazy_static."${deps.rayon_core."1.5.0".lazy_static}".default = true;
    num_cpus."${deps.rayon_core."1.5.0".num_cpus}".default = true;
    rayon_core."1.5.0".default = (f.rayon_core."1.5.0".default or true);
  }) [
    (if deps."rayon_core"."1.5.0" ? "crossbeam_deque" then features_.crossbeam_deque."${deps."rayon_core"."1.5.0"."crossbeam_deque" or ""}" deps else {})
    (if deps."rayon_core"."1.5.0" ? "crossbeam_queue" then features_.crossbeam_queue."${deps."rayon_core"."1.5.0"."crossbeam_queue" or ""}" deps else {})
    (if deps."rayon_core"."1.5.0" ? "crossbeam_utils" then features_.crossbeam_utils."${deps."rayon_core"."1.5.0"."crossbeam_utils" or ""}" deps else {})
    (if deps."rayon_core"."1.5.0" ? "lazy_static" then features_.lazy_static."${deps."rayon_core"."1.5.0"."lazy_static" or ""}" deps else {})
    (if deps."rayon_core"."1.5.0" ? "num_cpus" then features_.num_cpus."${deps."rayon_core"."1.5.0"."num_cpus" or ""}" deps else {})
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_."rdrand"."0.4.0" deps {}) }: buildRustCrate {
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
  features_."rdrand"."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0"."std" =
        (f.rdrand."0.4.0"."std" or false) ||
        (f.rdrand."0.4.0"."default" or false) ||
        (rdrand."0.4.0"."default" or false); }
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
    ];
  }) [
    (if deps."rdrand"."0.4.0" ? "rand_core" then features_.rand_core."${deps."rdrand"."0.4.0"."rand_core" or ""}" deps else {})
  ];


# end
# reductive-0.2.0

  crates.reductive."0.2.0" = deps: { features?(features_."reductive"."0.2.0" deps {}) }: buildRustCrate {
    crateName = "reductive";
    version = "0.2.0";
    description = "Optimized vector quantization for dense vectors";
    homepage = "https://git.sr.ht/~danieldk/reductive";
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
    ]
      ++ (if features.reductive."0.2.0".ndarray-linalg or false then [ (crates.ndarray_linalg."${deps."reductive"."0.2.0".ndarray_linalg}" deps) ] else []));
    features = mkFeatures (features."reductive"."0.2.0" or {});
  };
  features_."reductive"."0.2.0" = deps: f: updateFeatures f (rec {
    log."${deps.reductive."0.2.0".log}".default = true;
    ndarray."${deps.reductive."0.2.0".ndarray}".default = true;
    ndarray_linalg = fold recursiveUpdate {} [
      { "${deps.reductive."0.2.0".ndarray_linalg}"."accelerate" =
        (f.ndarray_linalg."${deps.reductive."0.2.0".ndarray_linalg}"."accelerate" or false) ||
        (reductive."0.2.0"."accelerate" or false) ||
        (f."reductive"."0.2.0"."accelerate" or false); }
      { "${deps.reductive."0.2.0".ndarray_linalg}"."intel-mkl" =
        (f.ndarray_linalg."${deps.reductive."0.2.0".ndarray_linalg}"."intel-mkl" or false) ||
        (reductive."0.2.0"."intel-mkl" or false) ||
        (f."reductive"."0.2.0"."intel-mkl" or false); }
      { "${deps.reductive."0.2.0".ndarray_linalg}"."netlib" =
        (f.ndarray_linalg."${deps.reductive."0.2.0".ndarray_linalg}"."netlib" or false) ||
        (reductive."0.2.0"."netlib" or false) ||
        (f."reductive"."0.2.0"."netlib" or false); }
      { "${deps.reductive."0.2.0".ndarray_linalg}"."openblas" =
        (f.ndarray_linalg."${deps.reductive."0.2.0".ndarray_linalg}"."openblas" or false) ||
        (reductive."0.2.0"."openblas" or false) ||
        (f."reductive"."0.2.0"."openblas" or false); }
    ];
    ndarray_parallel."${deps.reductive."0.2.0".ndarray_parallel}".default = true;
    num_traits."${deps.reductive."0.2.0".num_traits}".default = true;
    ordered_float."${deps.reductive."0.2.0".ordered_float}".default = true;
    rand."${deps.reductive."0.2.0".rand}".default = true;
    rand_xorshift."${deps.reductive."0.2.0".rand_xorshift}".default = true;
    rayon."${deps.reductive."0.2.0".rayon}".default = true;
    reductive = fold recursiveUpdate {} [
      { "0.2.0"."ndarray-linalg" =
        (f.reductive."0.2.0"."ndarray-linalg" or false) ||
        (f.reductive."0.2.0"."opq-train" or false) ||
        (reductive."0.2.0"."opq-train" or false); }
      { "0.2.0".default = (f.reductive."0.2.0".default or true); }
    ];
  }) [
    (f: if deps."reductive"."0.2.0" ? "ndarray_linalg" then recursiveUpdate f { ndarray_linalg."${deps."reductive"."0.2.0"."ndarray_linalg"}"."default" = true; } else f)
    (if deps."reductive"."0.2.0" ? "log" then features_.log."${deps."reductive"."0.2.0"."log" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "ndarray" then features_.ndarray."${deps."reductive"."0.2.0"."ndarray" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "ndarray_linalg" then features_.ndarray_linalg."${deps."reductive"."0.2.0"."ndarray_linalg" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "ndarray_parallel" then features_.ndarray_parallel."${deps."reductive"."0.2.0"."ndarray_parallel" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "num_traits" then features_.num_traits."${deps."reductive"."0.2.0"."num_traits" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "ordered_float" then features_.ordered_float."${deps."reductive"."0.2.0"."ordered_float" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "rand" then features_.rand."${deps."reductive"."0.2.0"."rand" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "rand_xorshift" then features_.rand_xorshift."${deps."reductive"."0.2.0"."rand_xorshift" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "rayon" then features_.rayon."${deps."reductive"."0.2.0"."rayon" or ""}" deps else {})
  ];


# end
# regex-1.2.1

  crates.regex."1.2.1" = deps: { features?(features_."regex"."1.2.1" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.2.1";
    description = "An implementation of regular expressions for Rust. This implementation uses
finite automata and guarantees linear time matching on all inputs.
";
    homepage = "https://github.com/rust-lang/regex";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0bshyi2rpv9jams2qj7krmjlrfsk1cddhin0kjqd18y9lbvrvvlp";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.2.1"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.2.1"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.2.1"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.2.1"."thread_local"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.2.1" or {});
  };
  features_."regex"."1.2.1" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.2.1".aho_corasick}".default = true;
    memchr."${deps.regex."1.2.1".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.2.1"."pattern" =
        (f.regex."1.2.1"."pattern" or false) ||
        (f.regex."1.2.1"."unstable" or false) ||
        (regex."1.2.1"."unstable" or false); }
      { "1.2.1"."use_std" =
        (f.regex."1.2.1"."use_std" or false) ||
        (f.regex."1.2.1"."default" or false) ||
        (regex."1.2.1"."default" or false); }
      { "1.2.1".default = (f.regex."1.2.1".default or true); }
    ];
    regex_syntax."${deps.regex."1.2.1".regex_syntax}".default = true;
    thread_local."${deps.regex."1.2.1".thread_local}".default = true;
  }) [
    (if deps."regex"."1.2.1" ? "aho_corasick" then features_.aho_corasick."${deps."regex"."1.2.1"."aho_corasick" or ""}" deps else {})
    (if deps."regex"."1.2.1" ? "memchr" then features_.memchr."${deps."regex"."1.2.1"."memchr" or ""}" deps else {})
    (if deps."regex"."1.2.1" ? "regex_syntax" then features_.regex_syntax."${deps."regex"."1.2.1"."regex_syntax" or ""}" deps else {})
    (if deps."regex"."1.2.1" ? "thread_local" then features_.thread_local."${deps."regex"."1.2.1"."thread_local" or ""}" deps else {})
  ];


# end
# regex-syntax-0.6.11

  crates.regex_syntax."0.6.11" = deps: { features?(features_."regex_syntax"."0.6.11" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.11";
    description = "A regular expression parser.";
    homepage = "https://github.com/rust-lang/regex";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1ynlyhjlcvhhqiaz6n649h4jmr45c1x6nwxzkfjdv7gazv94fdbh";
  };
  features_."regex_syntax"."0.6.11" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.11".default = (f.regex_syntax."0.6.11".default or true);
  }) [];


# end
# rustc-demangle-0.1.15

  crates.rustc_demangle."0.1.15" = deps: { features?(features_."rustc_demangle"."0.1.15" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.15";
    description = "Rust compiler symbol demangling.
";
    homepage = "https://github.com/alexcrichton/rustc-demangle";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "04rgsfzhz4k9s56vkczsdbvmvg9409xp0nw4cy99lb2i0aa0255s";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.15" or {});
  };
  features_."rustc_demangle"."0.1.15" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.15"."compiler_builtins" =
        (f.rustc_demangle."0.1.15"."compiler_builtins" or false) ||
        (f.rustc_demangle."0.1.15"."rustc-dep-of-std" or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15"."core" =
        (f.rustc_demangle."0.1.15"."core" or false) ||
        (f.rustc_demangle."0.1.15"."rustc-dep-of-std" or false) ||
        (rustc_demangle."0.1.15"."rustc-dep-of-std" or false); }
      { "0.1.15".default = (f.rustc_demangle."0.1.15".default or true); }
    ];
  }) [];


# end
# rustc_version-0.2.3

  crates.rustc_version."0.2.3" = deps: { features?(features_."rustc_version"."0.2.3" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.2.3";
    description = "A library for querying the version of a installed rustc compiler";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0rgwzbgs3i9fqjm1p4ra3n7frafmpwl29c8lw85kv1rxn7n2zaa7";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.2.3"."semver"}" deps)
    ]);
  };
  features_."rustc_version"."0.2.3" = deps: f: updateFeatures f (rec {
    rustc_version."0.2.3".default = (f.rustc_version."0.2.3".default or true);
    semver."${deps.rustc_version."0.2.3".semver}".default = true;
  }) [
    (if deps."rustc_version"."0.2.3" ? "semver" then features_.semver."${deps."rustc_version"."0.2.3"."semver" or ""}" deps else {})
  ];


# end
# scopeguard-1.0.0

  crates.scopeguard."1.0.0" = deps: { features?(features_."scopeguard"."1.0.0" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "1.0.0";
    description = "A RAII scope guard that will run a given closure when it goes out of scope,
even if the code between panics (assuming unwinding panic).

Defines the macros `defer!`, `defer_on_unwind!`, `defer_on_success!` as
shorthands for guards with one of the implemented strategies.
";
    authors = [ "bluss" ];
    sha256 = "15vrix0jx3i4naqnjswddzn4m036krrv71a8vkh3b1zq4hxmrb0q";
    features = mkFeatures (features."scopeguard"."1.0.0" or {});
  };
  features_."scopeguard"."1.0.0" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "1.0.0"."use_std" =
        (f.scopeguard."1.0.0"."use_std" or false) ||
        (f.scopeguard."1.0.0"."default" or false) ||
        (scopeguard."1.0.0"."default" or false); }
      { "1.0.0".default = (f.scopeguard."1.0.0".default or true); }
    ];
  }) [];


# end
# semver-0.9.0

  crates.semver."0.9.0" = deps: { features?(features_."semver"."0.9.0" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.9.0";
    description = "Semantic version parsing and comparison.
";
    homepage = "https://docs.rs/crate/semver/";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" "The Rust Project Developers" ];
    sha256 = "0azak2lb2wc36s3x15az886kck7rpnksrw14lalm157rg9sc9z63";
    dependencies = mapFeatures features ([
      (crates."semver_parser"."${deps."semver"."0.9.0"."semver_parser"}" deps)
    ]);
    features = mkFeatures (features."semver"."0.9.0" or {});
  };
  features_."semver"."0.9.0" = deps: f: updateFeatures f (rec {
    semver = fold recursiveUpdate {} [
      { "0.9.0"."serde" =
        (f.semver."0.9.0"."serde" or false) ||
        (f.semver."0.9.0"."ci" or false) ||
        (semver."0.9.0"."ci" or false); }
      { "0.9.0".default = (f.semver."0.9.0".default or true); }
    ];
    semver_parser."${deps.semver."0.9.0".semver_parser}".default = true;
  }) [
    (if deps."semver"."0.9.0" ? "semver_parser" then features_.semver_parser."${deps."semver"."0.9.0"."semver_parser" or ""}" deps else {})
  ];


# end
# semver-parser-0.7.0

  crates.semver_parser."0.7.0" = deps: { features?(features_."semver_parser"."0.7.0" deps {}) }: buildRustCrate {
    crateName = "semver-parser";
    version = "0.7.0";
    description = "Parsing of the semver spec.
";
    homepage = "https://github.com/steveklabnik/semver-parser";
    authors = [ "Steve Klabnik <steve@steveklabnik.com>" ];
    sha256 = "1da66c8413yakx0y15k8c055yna5lyb6fr0fw9318kdwkrk5k12h";
  };
  features_."semver_parser"."0.7.0" = deps: f: updateFeatures f (rec {
    semver_parser."0.7.0".default = (f.semver_parser."0.7.0".default or true);
  }) [];


# end
# serde-1.0.98

  crates.serde."1.0.98" = deps: { features?(features_."serde"."1.0.98" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.98";
    description = "A generic serialization/deserialization framework";
    homepage = "https://serde.rs";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1mbbhkzfafx0ngaq28janqhrfjllhn9fhz0qr0hnbxx0j8h20wwg";
    build = "build.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.serde."1.0.98".serde_derive or false then [ (crates.serde_derive."${deps."serde"."1.0.98".serde_derive}" deps) ] else []));
    features = mkFeatures (features."serde"."1.0.98" or {});
  };
  features_."serde"."1.0.98" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.98"."serde_derive" =
        (f.serde."1.0.98"."serde_derive" or false) ||
        (f.serde."1.0.98"."derive" or false) ||
        (serde."1.0.98"."derive" or false); }
      { "1.0.98"."std" =
        (f.serde."1.0.98"."std" or false) ||
        (f.serde."1.0.98"."default" or false) ||
        (serde."1.0.98"."default" or false); }
      { "1.0.98".default = (f.serde."1.0.98".default or true); }
    ];
  }) [
    (f: if deps."serde"."1.0.98" ? "serde_derive" then recursiveUpdate f { serde_derive."${deps."serde"."1.0.98"."serde_derive"}"."default" = true; } else f)
    (if deps."serde"."1.0.98" ? "serde_derive" then features_.serde_derive."${deps."serde"."1.0.98"."serde_derive" or ""}" deps else {})
  ];


# end
# serde_derive-1.0.98

  crates.serde_derive."1.0.98" = deps: { features?(features_."serde_derive"."1.0.98" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.98";
    description = "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]";
    homepage = "https://serde.rs";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0yk3850f0rbsaqrv0a4x7mqsfkpfipbxas45vv03sfdmxvpwcrvg";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.98"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.98"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.98"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.98" or {});
  };
  features_."serde_derive"."1.0.98" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.98".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.98".quote}".default = true;
    serde_derive."1.0.98".default = (f.serde_derive."1.0.98".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.98".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.98".syn}".default = true; }
    ];
  }) [
    (if deps."serde_derive"."1.0.98" ? "proc_macro2" then features_.proc_macro2."${deps."serde_derive"."1.0.98"."proc_macro2" or ""}" deps else {})
    (if deps."serde_derive"."1.0.98" ? "quote" then features_.quote."${deps."serde_derive"."1.0.98"."quote" or ""}" deps else {})
    (if deps."serde_derive"."1.0.98" ? "syn" then features_.syn."${deps."serde_derive"."1.0.98"."syn" or ""}" deps else {})
  ];


# end
# stdinout-0.4.0

  crates.stdinout."0.4.0" = deps: { features?(features_."stdinout"."0.4.0" deps {}) }: buildRustCrate {
    crateName = "stdinout";
    version = "0.4.0";
    description = "Simple wrapper for files or stdin/stdout.";
    homepage = "https://github.com/danieldk/stdinout";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    sha256 = "197vgpiml8img4n1dgpa4gx7qi8kf87y3gbhlndqp72rifhk7jdd";
  };
  features_."stdinout"."0.4.0" = deps: f: updateFeatures f (rec {
    stdinout."0.4.0".default = (f.stdinout."0.4.0".default or true);
  }) [];


# end
# strsim-0.8.0

  crates.strsim."0.8.0" = deps: { features?(features_."strsim"."0.8.0" deps {}) }: buildRustCrate {
    crateName = "strsim";
    version = "0.8.0";
    description = "Implementations of string similarity metrics.
Includes Hamming, Levenshtein, OSA, Damerau-Levenshtein, Jaro, and Jaro-Winkler.
";
    homepage = "https://github.com/dguo/strsim-rs";
    authors = [ "Danny Guo <dannyguo91@gmail.com>" ];
    sha256 = "0d3jsdz22wgjyxdakqnvdgmwjdvkximz50d9zfk4qlalw635qcvy";
  };
  features_."strsim"."0.8.0" = deps: f: updateFeatures f (rec {
    strsim."0.8.0".default = (f.strsim."0.8.0".default or true);
  }) [];


# end
# syn-0.14.9

  crates.syn."0.14.9" = deps: { features?(features_."syn"."0.14.9" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.14.9";
    description = "Nom parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1ia0qbrnqz40s8886b2jpcjiqfbziigd96lqjfin06xk6i28vr7b";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.14.9"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.14.9"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.14.9".quote or false then [ (crates.quote."${deps."syn"."0.14.9".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.14.9" or {});
  };
  features_."syn"."0.14.9" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.14.9".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.14.9".proc_macro2}"."proc-macro" or false) ||
        (syn."0.14.9"."proc-macro" or false) ||
        (f."syn"."0.14.9"."proc-macro" or false); }
      { "${deps.syn."0.14.9".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.14.9".proc_macro2}".default or false); }
    ];
    quote."${deps.syn."0.14.9".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.14.9".quote}"."proc-macro" or false) ||
        (syn."0.14.9"."proc-macro" or false) ||
        (f."syn"."0.14.9"."proc-macro" or false);
    syn = fold recursiveUpdate {} [
      { "0.14.9"."clone-impls" =
        (f.syn."0.14.9"."clone-impls" or false) ||
        (f.syn."0.14.9"."default" or false) ||
        (syn."0.14.9"."default" or false); }
      { "0.14.9"."derive" =
        (f.syn."0.14.9"."derive" or false) ||
        (f.syn."0.14.9"."default" or false) ||
        (syn."0.14.9"."default" or false); }
      { "0.14.9"."parsing" =
        (f.syn."0.14.9"."parsing" or false) ||
        (f.syn."0.14.9"."default" or false) ||
        (syn."0.14.9"."default" or false); }
      { "0.14.9"."printing" =
        (f.syn."0.14.9"."printing" or false) ||
        (f.syn."0.14.9"."default" or false) ||
        (syn."0.14.9"."default" or false); }
      { "0.14.9"."proc-macro" =
        (f.syn."0.14.9"."proc-macro" or false) ||
        (f.syn."0.14.9"."default" or false) ||
        (syn."0.14.9"."default" or false); }
      { "0.14.9"."quote" =
        (f.syn."0.14.9"."quote" or false) ||
        (f.syn."0.14.9"."printing" or false) ||
        (syn."0.14.9"."printing" or false); }
      { "0.14.9".default = (f.syn."0.14.9".default or true); }
    ];
    unicode_xid."${deps.syn."0.14.9".unicode_xid}".default = true;
  }) [
    (f: if deps."syn"."0.14.9" ? "quote" then recursiveUpdate f { quote."${deps."syn"."0.14.9"."quote"}"."default" = false; } else f)
    (if deps."syn"."0.14.9" ? "proc_macro2" then features_.proc_macro2."${deps."syn"."0.14.9"."proc_macro2" or ""}" deps else {})
    (if deps."syn"."0.14.9" ? "quote" then features_.quote."${deps."syn"."0.14.9"."quote" or ""}" deps else {})
    (if deps."syn"."0.14.9" ? "unicode_xid" then features_.unicode_xid."${deps."syn"."0.14.9"."unicode_xid" or ""}" deps else {})
  ];


# end
# syn-0.15.42

  crates.syn."0.15.42" = deps: { features?(features_."syn"."0.15.42" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.42";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0yjvq4izrsp6pvpahr86m1mq09nbq6a27fizkmg76xh8fhwfpd79";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.42"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.42"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.42".quote or false then [ (crates.quote."${deps."syn"."0.15.42".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.42" or {});
  };
  features_."syn"."0.15.42" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.42".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.42".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.42"."proc-macro" or false) ||
        (f."syn"."0.15.42"."proc-macro" or false); }
      { "${deps.syn."0.15.42".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.42".proc_macro2}".default or false); }
    ];
    quote."${deps.syn."0.15.42".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.42".quote}"."proc-macro" or false) ||
        (syn."0.15.42"."proc-macro" or false) ||
        (f."syn"."0.15.42"."proc-macro" or false);
    syn = fold recursiveUpdate {} [
      { "0.15.42"."clone-impls" =
        (f.syn."0.15.42"."clone-impls" or false) ||
        (f.syn."0.15.42"."default" or false) ||
        (syn."0.15.42"."default" or false); }
      { "0.15.42"."derive" =
        (f.syn."0.15.42"."derive" or false) ||
        (f.syn."0.15.42"."default" or false) ||
        (syn."0.15.42"."default" or false); }
      { "0.15.42"."parsing" =
        (f.syn."0.15.42"."parsing" or false) ||
        (f.syn."0.15.42"."default" or false) ||
        (syn."0.15.42"."default" or false); }
      { "0.15.42"."printing" =
        (f.syn."0.15.42"."printing" or false) ||
        (f.syn."0.15.42"."default" or false) ||
        (syn."0.15.42"."default" or false); }
      { "0.15.42"."proc-macro" =
        (f.syn."0.15.42"."proc-macro" or false) ||
        (f.syn."0.15.42"."default" or false) ||
        (syn."0.15.42"."default" or false); }
      { "0.15.42"."quote" =
        (f.syn."0.15.42"."quote" or false) ||
        (f.syn."0.15.42"."printing" or false) ||
        (syn."0.15.42"."printing" or false); }
      { "0.15.42".default = (f.syn."0.15.42".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.42".unicode_xid}".default = true;
  }) [
    (f: if deps."syn"."0.15.42" ? "quote" then recursiveUpdate f { quote."${deps."syn"."0.15.42"."quote"}"."default" = false; } else f)
    (if deps."syn"."0.15.42" ? "proc_macro2" then features_.proc_macro2."${deps."syn"."0.15.42"."proc_macro2" or ""}" deps else {})
    (if deps."syn"."0.15.42" ? "quote" then features_.quote."${deps."syn"."0.15.42"."quote" or ""}" deps else {})
    (if deps."syn"."0.15.42" ? "unicode_xid" then features_.unicode_xid."${deps."syn"."0.15.42"."unicode_xid" or ""}" deps else {})
  ];


# end
# synstructure-0.10.2

  crates.synstructure."0.10.2" = deps: { features?(features_."synstructure"."0.10.2" deps {}) }: buildRustCrate {
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
  features_."synstructure"."0.10.2" = deps: f: updateFeatures f (rec {
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
    (if deps."synstructure"."0.10.2" ? "proc_macro2" then features_.proc_macro2."${deps."synstructure"."0.10.2"."proc_macro2" or ""}" deps else {})
    (if deps."synstructure"."0.10.2" ? "quote" then features_.quote."${deps."synstructure"."0.10.2"."quote" or ""}" deps else {})
    (if deps."synstructure"."0.10.2" ? "syn" then features_.syn."${deps."synstructure"."0.10.2"."syn" or ""}" deps else {})
    (if deps."synstructure"."0.10.2" ? "unicode_xid" then features_.unicode_xid."${deps."synstructure"."0.10.2"."unicode_xid" or ""}" deps else {})
  ];


# end
# termcolor-1.0.5

  crates.termcolor."1.0.5" = deps: { features?(features_."termcolor"."1.0.5" deps {}) }: buildRustCrate {
    crateName = "termcolor";
    version = "1.0.5";
    description = "A simple cross platform library for writing colored text to a terminal.
";
    homepage = "https://github.com/BurntSushi/termcolor";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "16266x431hbkmvyh0pv4yn7wm2kagicqaq6hy4fabn93c08sx0gp";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."wincolor"."${deps."termcolor"."1.0.5"."wincolor"}" deps)
    ]) else []);
  };
  features_."termcolor"."1.0.5" = deps: f: updateFeatures f (rec {
    termcolor."1.0.5".default = (f.termcolor."1.0.5".default or true);
    wincolor."${deps.termcolor."1.0.5".wincolor}".default = true;
  }) [
    (if deps."termcolor"."1.0.5" ? "wincolor" then features_.wincolor."${deps."termcolor"."1.0.5"."wincolor" or ""}" deps else {})
  ];


# end
# textwrap-0.11.0

  crates.textwrap."0.11.0" = deps: { features?(features_."textwrap"."0.11.0" deps {}) }: buildRustCrate {
    crateName = "textwrap";
    version = "0.11.0";
    description = "Textwrap is a small library for word wrapping, indenting, and
dedenting strings.

You can use it to format strings (such as help and error messages) for
display in commandline applications. It is designed to be efficient
and handle Unicode characters correctly.
";
    authors = [ "Martin Geisler <martin@geisler.net>" ];
    sha256 = "0s25qh49n7kjayrdj4q3v0jk0jc6vy88rdw0bvgfxqlscpqpxi7d";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."textwrap"."0.11.0"."unicode_width"}" deps)
    ]);
  };
  features_."textwrap"."0.11.0" = deps: f: updateFeatures f (rec {
    textwrap."0.11.0".default = (f.textwrap."0.11.0".default or true);
    unicode_width."${deps.textwrap."0.11.0".unicode_width}".default = true;
  }) [
    (if deps."textwrap"."0.11.0" ? "unicode_width" then features_.unicode_width."${deps."textwrap"."0.11.0"."unicode_width" or ""}" deps else {})
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_."thread_local"."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    description = "Per-object thread-local storage";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_."thread_local"."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (if deps."thread_local"."0.3.6" ? "lazy_static" then features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static" or ""}" deps else {})
  ];


# end
# toml-0.5.1

  crates.toml."0.5.1" = deps: { features?(features_."toml"."0.5.1" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.5.1";
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides
implementations of the standard Serialize/Deserialize traits for TOML data to
facilitate deserializing and serializing Rust structures.
";
    homepage = "https://github.com/alexcrichton/toml-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1878ifdh576viwqg80vnhm51bng96vhyfi20jk8fv6wcifhgl4dg";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.5.1"."serde"}" deps)
    ]);
    features = mkFeatures (features."toml"."0.5.1" or {});
  };
  features_."toml"."0.5.1" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.5.1".serde}".default = true;
    toml = fold recursiveUpdate {} [
      { "0.5.1"."linked-hash-map" =
        (f.toml."0.5.1"."linked-hash-map" or false) ||
        (f.toml."0.5.1"."preserve_order" or false) ||
        (toml."0.5.1"."preserve_order" or false); }
      { "0.5.1".default = (f.toml."0.5.1".default or true); }
    ];
  }) [
    (if deps."toml"."0.5.1" ? "serde" then features_.serde."${deps."toml"."0.5.1"."serde" or ""}" deps else {})
  ];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_."unicode_width"."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    description = "Determine displayed width of `char` and `str` types
according to Unicode Standard Annex #11 rules.
";
    homepage = "https://github.com/unicode-rs/unicode-width";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_."unicode_width"."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_."unicode_xid"."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    description = "Determine whether characters have the XID_Start
or XID_Continue properties according to
Unicode Standard Annex #31.
";
    homepage = "https://github.com/unicode-rs/unicode-xid";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_."unicode_xid"."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# vec_map-0.8.1

  crates.vec_map."0.8.1" = deps: { features?(features_."vec_map"."0.8.1" deps {}) }: buildRustCrate {
    crateName = "vec_map";
    version = "0.8.1";
    description = "A simple map based on a vector for small integer keys";
    homepage = "https://github.com/contain-rs/vec-map";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Jorge Aparicio <japaricious@gmail.com>" "Alexis Beingessner <a.beingessner@gmail.com>" "Brian Anderson <>" "tbu- <>" "Manish Goregaokar <>" "Aaron Turon <aturon@mozilla.com>" "Adolfo Ochagavía <>" "Niko Matsakis <>" "Steven Fackler <>" "Chase Southwood <csouth3@illinois.edu>" "Eduard Burtescu <>" "Florian Wilkens <>" "Félix Raimundo <>" "Tibor Benke <>" "Markus Siemens <markus@m-siemens.de>" "Josh Branchaud <jbranchaud@gmail.com>" "Huon Wilson <dbau.pp@gmail.com>" "Corey Farwell <coref@rwell.org>" "Aaron Liblong <>" "Nick Cameron <nrc@ncameron.org>" "Patrick Walton <pcwalton@mimiga.net>" "Felix S Klock II <>" "Andrew Paseltiner <apaseltiner@gmail.com>" "Sean McArthur <sean.monstar@gmail.com>" "Vadim Petrochenkov <>" ];
    sha256 = "1jj2nrg8h3l53d43rwkpkikq5a5x15ms4rf1rw92hp5lrqhi8mpi";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."vec_map"."0.8.1" or {});
  };
  features_."vec_map"."0.8.1" = deps: f: updateFeatures f (rec {
    vec_map = fold recursiveUpdate {} [
      { "0.8.1"."serde" =
        (f.vec_map."0.8.1"."serde" or false) ||
        (f.vec_map."0.8.1"."eders" or false) ||
        (vec_map."0.8.1"."eders" or false); }
      { "0.8.1".default = (f.vec_map."0.8.1".default or true); }
    ];
  }) [];


# end
# winapi-0.3.7

  crates.winapi."0.3.7" = deps: { features?(features_."winapi"."0.3.7" deps {}) }: buildRustCrate {
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
  features_."winapi"."0.3.7" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "0.3.7"."impl-debug" =
        (f.winapi."0.3.7"."impl-debug" or false) ||
        (f.winapi."0.3.7"."debug" or false) ||
        (winapi."0.3.7"."debug" or false); }
      { "0.3.7".default = (f.winapi."0.3.7".default or true); }
    ];
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.7".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.7".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (if deps."winapi"."0.3.7" ? "winapi_i686_pc_windows_gnu" then features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_i686_pc_windows_gnu" or ""}" deps else {})
    (if deps."winapi"."0.3.7" ? "winapi_x86_64_pc_windows_gnu" then features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.7"."winapi_x86_64_pc_windows_gnu" or ""}" deps else {})
  ];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_."winapi_i686_pc_windows_gnu"."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the i686-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_."winapi_i686_pc_windows_gnu"."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-util-0.1.2

  crates.winapi_util."0.1.2" = deps: { features?(features_."winapi_util"."0.1.2" deps {}) }: buildRustCrate {
    crateName = "winapi-util";
    version = "0.1.2";
    description = "A dumping ground for high level safe wrappers over winapi.";
    homepage = "https://github.com/BurntSushi/winapi-util";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "07jj7rg7nndd7bqhjin1xphbv8kb5clvhzpqpxkvm3wl84r3mj1h";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winapi_util"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_."winapi_util"."0.1.2" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winapi_util."0.1.2".winapi}"."consoleapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."errhandlingapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."fileapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."processenv" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."std" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winbase" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."wincon" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winerror" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winnt" = true; }
      { "${deps.winapi_util."0.1.2".winapi}".default = true; }
    ];
    winapi_util."0.1.2".default = (f.winapi_util."0.1.2".default or true);
  }) [
    (if deps."winapi_util"."0.1.2" ? "winapi" then features_.winapi."${deps."winapi_util"."0.1.2"."winapi" or ""}" deps else {})
  ];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_."winapi_x86_64_pc_windows_gnu"."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    description = "Import libraries for the x86_64-pc-windows-gnu target. Please don't use this crate directly, depend on winapi instead.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_."winapi_x86_64_pc_windows_gnu"."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# wincolor-1.0.1

  crates.wincolor."1.0.1" = deps: { features?(features_."wincolor"."1.0.1" deps {}) }: buildRustCrate {
    crateName = "wincolor";
    version = "1.0.1";
    description = "A simple Windows specific API for controlling text color in a Windows console.
";
    homepage = "https://github.com/BurntSushi/termcolor/tree/master/wincolor";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0gr7v4krmjba7yq16071rfacz42qbapas7mxk5nphjwb042a8gvz";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."wincolor"."1.0.1"."winapi"}" deps)
      (crates."winapi_util"."${deps."wincolor"."1.0.1"."winapi_util"}" deps)
    ]);
  };
  features_."wincolor"."1.0.1" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.wincolor."1.0.1".winapi}"."minwindef" = true; }
      { "${deps.wincolor."1.0.1".winapi}"."wincon" = true; }
      { "${deps.wincolor."1.0.1".winapi}".default = true; }
    ];
    winapi_util."${deps.wincolor."1.0.1".winapi_util}".default = true;
    wincolor."1.0.1".default = (f.wincolor."1.0.1".default or true);
  }) [
    (if deps."wincolor"."1.0.1" ? "winapi" then features_.winapi."${deps."wincolor"."1.0.1"."winapi" or ""}" deps else {})
    (if deps."wincolor"."1.0.1" ? "winapi_util" then features_.winapi_util."${deps."wincolor"."1.0.1"."winapi_util" or ""}" deps else {})
  ];


# end
}
