{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# adler32-1.0.3

  crates.adler32."1.0.3" = deps: { features?(features_."adler32"."1.0.3" deps {}) }: buildRustCrate {
    crateName = "adler32";
    version = "1.0.3";
    description = "Minimal Adler32 implementation for Rust.";
    authors = [ "Remi Rampin <remirampin@gmail.com>" ];
    sha256 = "1z3mvjgw02mbqk98kizzibrca01d5wfkpazsrp3vkkv3i56pn6fb";
  };
  features_."adler32"."1.0.3" = deps: f: updateFeatures f (rec {
    adler32."1.0.3".default = (f.adler32."1.0.3".default or true);
  }) [];


# end
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
# aligned_alloc-0.1.3

  crates.aligned_alloc."0.1.3" = deps: { features?(features_."aligned_alloc"."0.1.3" deps {}) }: buildRustCrate {
    crateName = "aligned_alloc";
    version = "0.1.3";
    description = "Provides cross-platform primitives for aligned memory allocation
";
    authors = [ "Jonas Schievink <jonasschievink@gmail.com>" ];
    sha256 = "1dii2ksw5jaiwps8n3r5hm1b5f1bx9qkj7rfk49b3bhc6s15023w";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."aligned_alloc"."0.1.3"."kernel32_sys"}" deps)
      (crates."libc"."${deps."aligned_alloc"."0.1.3"."libc"}" deps)
      (crates."winapi"."${deps."aligned_alloc"."0.1.3"."winapi"}" deps)
    ]);
  };
  features_."aligned_alloc"."0.1.3" = deps: f: updateFeatures f (rec {
    aligned_alloc."0.1.3".default = (f.aligned_alloc."0.1.3".default or true);
    kernel32_sys."${deps.aligned_alloc."0.1.3".kernel32_sys}".default = true;
    libc."${deps.aligned_alloc."0.1.3".libc}".default = true;
    winapi."${deps.aligned_alloc."0.1.3".winapi}".default = true;
  }) [
    (if deps."aligned_alloc"."0.1.3" ? "kernel32_sys" then features_.kernel32_sys."${deps."aligned_alloc"."0.1.3"."kernel32_sys" or ""}" deps else {})
    (if deps."aligned_alloc"."0.1.3" ? "libc" then features_.libc."${deps."aligned_alloc"."0.1.3"."libc" or ""}" deps else {})
    (if deps."aligned_alloc"."0.1.3" ? "winapi" then features_.winapi."${deps."aligned_alloc"."0.1.3"."winapi" or ""}" deps else {})
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
# approx-0.3.2

  crates.approx."0.3.2" = deps: { features?(features_."approx"."0.3.2" deps {}) }: buildRustCrate {
    crateName = "approx";
    version = "0.3.2";
    description = "Approximate floating point equality comparisons and assertions.";
    homepage = "https://github.com/brendanzab/approx";
    authors = [ "Brendan Zabarauskas <bjzaba@yahoo.com.au>" ];
    sha256 = "1sziapqxz6qk1m3bv4pay1bfqv887pf6045qfg913ip4jmyv8fcb";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."approx"."0.3.2"."num_traits"}" deps)
    ]);
    features = mkFeatures (features."approx"."0.3.2" or {});
  };
  features_."approx"."0.3.2" = deps: f: updateFeatures f (rec {
    approx = fold recursiveUpdate {} [
      { "0.3.2"."std" =
        (f.approx."0.3.2"."std" or false) ||
        (f.approx."0.3.2"."default" or false) ||
        (approx."0.3.2"."default" or false); }
      { "0.3.2".default = (f.approx."0.3.2".default or true); }
    ];
    num_traits."${deps.approx."0.3.2".num_traits}".default = true;
  }) [
    (if deps."approx"."0.3.2" ? "num_traits" then features_.num_traits."${deps."approx"."0.3.2"."num_traits" or ""}" deps else {})
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
# build_const-0.2.1

  crates.build_const."0.2.1" = deps: { features?(features_."build_const"."0.2.1" deps {}) }: buildRustCrate {
    crateName = "build_const";
    version = "0.2.1";
    description = "library for creating importable constants from build.rs or a script";
    authors = [ "Garrett Berg <vitiral@gmail.com>" ];
    sha256 = "15249xzi3qlm72p4glxgavwyq70fx2sp4df6ii0sdlrixrrp77pl";
    features = mkFeatures (features."build_const"."0.2.1" or {});
  };
  features_."build_const"."0.2.1" = deps: f: updateFeatures f (rec {
    build_const = fold recursiveUpdate {} [
      { "0.2.1"."std" =
        (f.build_const."0.2.1"."std" or false) ||
        (f.build_const."0.2.1"."default" or false) ||
        (build_const."0.2.1"."default" or false); }
      { "0.2.1".default = (f.build_const."0.2.1".default or true); }
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
# c2-chacha-0.2.2

  crates.c2_chacha."0.2.2" = deps: { features?(features_."c2_chacha"."0.2.2" deps {}) }: buildRustCrate {
    crateName = "c2-chacha";
    version = "0.2.2";
    description = "The ChaCha family of stream ciphers";
    authors = [ "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "1lcfazshbiw8kdpcgphlmls0mz5j4wnvsq1diaz4b2bcvgm3r2cn";
    dependencies = mapFeatures features ([
      (crates."ppv_lite86"."${deps."c2_chacha"."0.2.2"."ppv_lite86"}" deps)
    ]
      ++ (if features.c2_chacha."0.2.2".lazy_static or false then [ (crates.lazy_static."${deps."c2_chacha"."0.2.2".lazy_static}" deps) ] else []));
    features = mkFeatures (features."c2_chacha"."0.2.2" or {});
  };
  features_."c2_chacha"."0.2.2" = deps: f: updateFeatures f (rec {
    c2_chacha = fold recursiveUpdate {} [
      { "0.2.2"."byteorder" =
        (f.c2_chacha."0.2.2"."byteorder" or false) ||
        (f.c2_chacha."0.2.2"."rustcrypto_api" or false) ||
        (c2_chacha."0.2.2"."rustcrypto_api" or false); }
      { "0.2.2"."lazy_static" =
        (f.c2_chacha."0.2.2"."lazy_static" or false) ||
        (f.c2_chacha."0.2.2"."std" or false) ||
        (c2_chacha."0.2.2"."std" or false); }
      { "0.2.2"."rustcrypto_api" =
        (f.c2_chacha."0.2.2"."rustcrypto_api" or false) ||
        (f.c2_chacha."0.2.2"."default" or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2"."simd" =
        (f.c2_chacha."0.2.2"."simd" or false) ||
        (f.c2_chacha."0.2.2"."default" or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2"."std" =
        (f.c2_chacha."0.2.2"."std" or false) ||
        (f.c2_chacha."0.2.2"."default" or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2"."stream-cipher" =
        (f.c2_chacha."0.2.2"."stream-cipher" or false) ||
        (f.c2_chacha."0.2.2"."rustcrypto_api" or false) ||
        (c2_chacha."0.2.2"."rustcrypto_api" or false); }
      { "0.2.2".default = (f.c2_chacha."0.2.2".default or true); }
    ];
    ppv_lite86 = fold recursiveUpdate {} [
      { "${deps.c2_chacha."0.2.2".ppv_lite86}"."simd" =
        (f.ppv_lite86."${deps.c2_chacha."0.2.2".ppv_lite86}"."simd" or false) ||
        (c2_chacha."0.2.2"."simd" or false) ||
        (f."c2_chacha"."0.2.2"."simd" or false); }
      { "${deps.c2_chacha."0.2.2".ppv_lite86}".default = true; }
    ];
  }) [
    (f: if deps."c2_chacha"."0.2.2" ? "lazy_static" then recursiveUpdate f { lazy_static."${deps."c2_chacha"."0.2.2"."lazy_static"}"."default" = true; } else f)
    (if deps."c2_chacha"."0.2.2" ? "lazy_static" then features_.lazy_static."${deps."c2_chacha"."0.2.2"."lazy_static" or ""}" deps else {})
    (if deps."c2_chacha"."0.2.2" ? "ppv_lite86" then features_.ppv_lite86."${deps."c2_chacha"."0.2.2"."ppv_lite86" or ""}" deps else {})
  ];


# end
# cc-1.0.40

  crates.cc."1.0.40" = deps: { features?(features_."cc"."1.0.40" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.40";
    description = "A build-time dependency for Cargo build scripts to assist in invoking the native
C compiler to compile native C code into a static archive to be linked into Rust
code.
";
    homepage = "https://github.com/alexcrichton/cc-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0qxbqlrj4l5r3jg5x19ykp13rl1xv65vb18yxps9pkraw3qfl2q6";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."cc"."1.0.40" or {});
  };
  features_."cc"."1.0.40" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.40"."rayon" =
        (f.cc."1.0.40"."rayon" or false) ||
        (f.cc."1.0.40"."parallel" or false) ||
        (cc."1.0.40"."parallel" or false); }
      { "1.0.40".default = (f.cc."1.0.40".default or true); }
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
# clicolors-control-1.0.0

  crates.clicolors_control."1.0.0" = deps: { features?(features_."clicolors_control"."1.0.0" deps {}) }: buildRustCrate {
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
  features_."clicolors_control"."1.0.0" = deps: f: updateFeatures f (rec {
    atty."${deps.clicolors_control."1.0.0".atty}".default = true;
    clicolors_control = fold recursiveUpdate {} [
      { "1.0.0"."terminal_autoconfig" =
        (f.clicolors_control."1.0.0"."terminal_autoconfig" or false) ||
        (f.clicolors_control."1.0.0"."default" or false) ||
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
    (if deps."clicolors_control"."1.0.0" ? "lazy_static" then features_.lazy_static."${deps."clicolors_control"."1.0.0"."lazy_static" or ""}" deps else {})
    (if deps."clicolors_control"."1.0.0" ? "libc" then features_.libc."${deps."clicolors_control"."1.0.0"."libc" or ""}" deps else {})
    (if deps."clicolors_control"."1.0.0" ? "atty" then features_.atty."${deps."clicolors_control"."1.0.0"."atty" or ""}" deps else {})
    (if deps."clicolors_control"."1.0.0" ? "winapi" then features_.winapi."${deps."clicolors_control"."1.0.0"."winapi" or ""}" deps else {})
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
# conllx-0.11.2

  crates.conllx."0.11.2" = deps: { features?(features_."conllx"."0.11.2" deps {}) }: buildRustCrate {
    crateName = "conllx";
    version = "0.11.2";
    description = "Readers/writers for the CoNLL-X dependency format";
    homepage = "https://github.com/danieldk/conllx-rs";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "0s34pzgamqps01xdfjs6q37g2wmvs97qxdlj314ksy5lhgssnfsl";
    dependencies = mapFeatures features ([
      (crates."failure"."${deps."conllx"."0.11.2"."failure"}" deps)
      (crates."itertools"."${deps."conllx"."0.11.2"."itertools"}" deps)
      (crates."lazy_init"."${deps."conllx"."0.11.2"."lazy_init"}" deps)
      (crates."petgraph"."${deps."conllx"."0.11.2"."petgraph"}" deps)
    ]);
  };
  features_."conllx"."0.11.2" = deps: f: updateFeatures f (rec {
    conllx."0.11.2".default = (f.conllx."0.11.2".default or true);
    failure."${deps.conllx."0.11.2".failure}".default = true;
    itertools."${deps.conllx."0.11.2".itertools}".default = true;
    lazy_init."${deps.conllx."0.11.2".lazy_init}".default = true;
    petgraph."${deps.conllx."0.11.2".petgraph}".default = true;
  }) [
    (if deps."conllx"."0.11.2" ? "failure" then features_.failure."${deps."conllx"."0.11.2"."failure" or ""}" deps else {})
    (if deps."conllx"."0.11.2" ? "itertools" then features_.itertools."${deps."conllx"."0.11.2"."itertools" or ""}" deps else {})
    (if deps."conllx"."0.11.2" ? "lazy_init" then features_.lazy_init."${deps."conllx"."0.11.2"."lazy_init" or ""}" deps else {})
    (if deps."conllx"."0.11.2" ? "petgraph" then features_.petgraph."${deps."conllx"."0.11.2"."petgraph" or ""}" deps else {})
  ];


# end
# console-0.7.7

  crates.console."0.7.7" = deps: { features?(features_."console"."0.7.7" deps {}) }: buildRustCrate {
    crateName = "console";
    version = "0.7.7";
    description = "A terminal and console abstraction for Rust";
    homepage = "https://github.com/mitsuhiko/console";
    authors = [ "Armin Ronacher <armin.ronacher@active-4.com>" ];
    sha256 = "0sh4gx811yai8r0n02pm6kyds501znc5762z0b50hk961j8psfij";
    dependencies = mapFeatures features ([
      (crates."atty"."${deps."console"."0.7.7"."atty"}" deps)
      (crates."clicolors_control"."${deps."console"."0.7.7"."clicolors_control"}" deps)
      (crates."lazy_static"."${deps."console"."0.7.7"."lazy_static"}" deps)
      (crates."libc"."${deps."console"."0.7.7"."libc"}" deps)
      (crates."parking_lot"."${deps."console"."0.7.7"."parking_lot"}" deps)
      (crates."regex"."${deps."console"."0.7.7"."regex"}" deps)
      (crates."unicode_width"."${deps."console"."0.7.7"."unicode_width"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."termios"."${deps."console"."0.7.7"."termios"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."encode_unicode"."${deps."console"."0.7.7"."encode_unicode"}" deps)
      (crates."winapi"."${deps."console"."0.7.7"."winapi"}" deps)
    ]) else []);
  };
  features_."console"."0.7.7" = deps: f: updateFeatures f (rec {
    atty."${deps.console."0.7.7".atty}".default = true;
    clicolors_control."${deps.console."0.7.7".clicolors_control}".default = true;
    console."0.7.7".default = (f.console."0.7.7".default or true);
    encode_unicode."${deps.console."0.7.7".encode_unicode}".default = true;
    lazy_static."${deps.console."0.7.7".lazy_static}".default = true;
    libc."${deps.console."0.7.7".libc}".default = true;
    parking_lot."${deps.console."0.7.7".parking_lot}".default = true;
    regex."${deps.console."0.7.7".regex}".default = true;
    termios."${deps.console."0.7.7".termios}".default = true;
    unicode_width."${deps.console."0.7.7".unicode_width}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.console."0.7.7".winapi}"."consoleapi" = true; }
      { "${deps.console."0.7.7".winapi}"."processenv" = true; }
      { "${deps.console."0.7.7".winapi}"."winbase" = true; }
      { "${deps.console."0.7.7".winapi}"."wincon" = true; }
      { "${deps.console."0.7.7".winapi}"."winuser" = true; }
      { "${deps.console."0.7.7".winapi}".default = true; }
    ];
  }) [
    (if deps."console"."0.7.7" ? "atty" then features_.atty."${deps."console"."0.7.7"."atty" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "clicolors_control" then features_.clicolors_control."${deps."console"."0.7.7"."clicolors_control" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "lazy_static" then features_.lazy_static."${deps."console"."0.7.7"."lazy_static" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "libc" then features_.libc."${deps."console"."0.7.7"."libc" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "parking_lot" then features_.parking_lot."${deps."console"."0.7.7"."parking_lot" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "regex" then features_.regex."${deps."console"."0.7.7"."regex" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "unicode_width" then features_.unicode_width."${deps."console"."0.7.7"."unicode_width" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "termios" then features_.termios."${deps."console"."0.7.7"."termios" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "encode_unicode" then features_.encode_unicode."${deps."console"."0.7.7"."encode_unicode" or ""}" deps else {})
    (if deps."console"."0.7.7" ? "winapi" then features_.winapi."${deps."console"."0.7.7"."winapi" or ""}" deps else {})
  ];


# end
# crc-1.8.1

  crates.crc."1.8.1" = deps: { features?(features_."crc"."1.8.1" deps {}) }: buildRustCrate {
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
  features_."crc"."1.8.1" = deps: f: updateFeatures f (rec {
    build_const."${deps.crc."1.8.1".build_const}".default = true;
    crc = fold recursiveUpdate {} [
      { "1.8.1"."std" =
        (f.crc."1.8.1"."std" or false) ||
        (f.crc."1.8.1"."default" or false) ||
        (crc."1.8.1"."default" or false); }
      { "1.8.1".default = (f.crc."1.8.1".default or true); }
    ];
  }) [
    (if deps."crc"."1.8.1" ? "build_const" then features_.build_const."${deps."crc"."1.8.1"."build_const" or ""}" deps else {})
  ];


# end
# crc32fast-1.2.0

  crates.crc32fast."1.2.0" = deps: { features?(features_."crc32fast"."1.2.0" deps {}) }: buildRustCrate {
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
  features_."crc32fast"."1.2.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crc32fast."1.2.0".cfg_if}".default = true;
    crc32fast = fold recursiveUpdate {} [
      { "1.2.0"."std" =
        (f.crc32fast."1.2.0"."std" or false) ||
        (f.crc32fast."1.2.0"."default" or false) ||
        (crc32fast."1.2.0"."default" or false); }
      { "1.2.0".default = (f.crc32fast."1.2.0".default or true); }
    ];
  }) [
    (if deps."crc32fast"."1.2.0" ? "cfg_if" then features_.cfg_if."${deps."crc32fast"."1.2.0"."cfg_if" or ""}" deps else {})
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
# curl-0.4.22

  crates.curl."0.4.22" = deps: { features?(features_."curl"."0.4.22" deps {}) }: buildRustCrate {
    crateName = "curl";
    version = "0.4.22";
    description = "Rust bindings to libcurl for making HTTP requests";
    homepage = "https://github.com/alexcrichton/curl-rust";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "103hypqdm78d3zyqjhivqnqyyjf0r9m6frzzfqxhhcvbm1cp6qll";
    dependencies = mapFeatures features ([
      (crates."curl_sys"."${deps."curl"."0.4.22"."curl_sys"}" deps)
      (crates."libc"."${deps."curl"."0.4.22"."libc"}" deps)
      (crates."socket2"."${deps."curl"."0.4.22"."socket2"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.curl."0.4.22".openssl-probe or false then [ (crates.openssl_probe."${deps."curl"."0.4.22".openssl_probe}" deps) ] else [])
      ++ (if features.curl."0.4.22".openssl-sys or false then [ (crates.openssl_sys."${deps."curl"."0.4.22".openssl_sys}" deps) ] else [])) else [])
      ++ (if abi == "msvc" then mapFeatures features ([
      (crates."kernel32_sys"."${deps."curl"."0.4.22"."kernel32_sys"}" deps)
      (crates."schannel"."${deps."curl"."0.4.22"."schannel"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."curl"."0.4.22"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."curl"."0.4.22" or {});
  };
  features_."curl"."0.4.22" = deps: f: updateFeatures f (rec {
    curl = fold recursiveUpdate {} [
      { "0.4.22"."openssl-probe" =
        (f.curl."0.4.22"."openssl-probe" or false) ||
        (f.curl."0.4.22"."ssl" or false) ||
        (curl."0.4.22"."ssl" or false); }
      { "0.4.22"."openssl-sys" =
        (f.curl."0.4.22"."openssl-sys" or false) ||
        (f.curl."0.4.22"."ssl" or false) ||
        (curl."0.4.22"."ssl" or false); }
      { "0.4.22"."ssl" =
        (f.curl."0.4.22"."ssl" or false) ||
        (f.curl."0.4.22"."default" or false) ||
        (curl."0.4.22"."default" or false); }
      { "0.4.22".default = (f.curl."0.4.22".default or true); }
    ];
    curl_sys = fold recursiveUpdate {} [
      { "${deps.curl."0.4.22".curl_sys}"."force-system-lib-on-osx" =
        (f.curl_sys."${deps.curl."0.4.22".curl_sys}"."force-system-lib-on-osx" or false) ||
        (curl."0.4.22"."force-system-lib-on-osx" or false) ||
        (f."curl"."0.4.22"."force-system-lib-on-osx" or false); }
      { "${deps.curl."0.4.22".curl_sys}"."http2" =
        (f.curl_sys."${deps.curl."0.4.22".curl_sys}"."http2" or false) ||
        (curl."0.4.22"."http2" or false) ||
        (f."curl"."0.4.22"."http2" or false); }
      { "${deps.curl."0.4.22".curl_sys}"."ssl" =
        (f.curl_sys."${deps.curl."0.4.22".curl_sys}"."ssl" or false) ||
        (curl."0.4.22"."ssl" or false) ||
        (f."curl"."0.4.22"."ssl" or false); }
      { "${deps.curl."0.4.22".curl_sys}"."static-curl" =
        (f.curl_sys."${deps.curl."0.4.22".curl_sys}"."static-curl" or false) ||
        (curl."0.4.22"."static-curl" or false) ||
        (f."curl"."0.4.22"."static-curl" or false); }
      { "${deps.curl."0.4.22".curl_sys}"."static-ssl" =
        (f.curl_sys."${deps.curl."0.4.22".curl_sys}"."static-ssl" or false) ||
        (curl."0.4.22"."static-ssl" or false) ||
        (f."curl"."0.4.22"."static-ssl" or false); }
      { "${deps.curl."0.4.22".curl_sys}".default = (f.curl_sys."${deps.curl."0.4.22".curl_sys}".default or false); }
    ];
    kernel32_sys."${deps.curl."0.4.22".kernel32_sys}".default = true;
    libc."${deps.curl."0.4.22".libc}".default = true;
    schannel."${deps.curl."0.4.22".schannel}".default = true;
    socket2."${deps.curl."0.4.22".socket2}".default = true;
    winapi."${deps.curl."0.4.22".winapi}".default = true;
  }) [
    (f: if deps."curl"."0.4.22" ? "openssl_probe" then recursiveUpdate f { openssl_probe."${deps."curl"."0.4.22"."openssl_probe"}"."default" = true; } else f)
    (f: if deps."curl"."0.4.22" ? "openssl_sys" then recursiveUpdate f { openssl_sys."${deps."curl"."0.4.22"."openssl_sys"}"."default" = true; } else f)
    (if deps."curl"."0.4.22" ? "curl_sys" then features_.curl_sys."${deps."curl"."0.4.22"."curl_sys" or ""}" deps else {})
    (if deps."curl"."0.4.22" ? "libc" then features_.libc."${deps."curl"."0.4.22"."libc" or ""}" deps else {})
    (if deps."curl"."0.4.22" ? "socket2" then features_.socket2."${deps."curl"."0.4.22"."socket2" or ""}" deps else {})
    (if deps."curl"."0.4.22" ? "openssl_probe" then features_.openssl_probe."${deps."curl"."0.4.22"."openssl_probe" or ""}" deps else {})
    (if deps."curl"."0.4.22" ? "openssl_sys" then features_.openssl_sys."${deps."curl"."0.4.22"."openssl_sys" or ""}" deps else {})
    (if deps."curl"."0.4.22" ? "kernel32_sys" then features_.kernel32_sys."${deps."curl"."0.4.22"."kernel32_sys" or ""}" deps else {})
    (if deps."curl"."0.4.22" ? "schannel" then features_.schannel."${deps."curl"."0.4.22"."schannel" or ""}" deps else {})
    (if deps."curl"."0.4.22" ? "winapi" then features_.winapi."${deps."curl"."0.4.22"."winapi" or ""}" deps else {})
  ];


# end
# curl-sys-0.4.20

  crates.curl_sys."0.4.20" = deps: { features?(features_."curl_sys"."0.4.20" deps {}) }: buildRustCrate {
    crateName = "curl-sys";
    version = "0.4.20";
    description = "Native bindings to the libcurl library";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1k72bc7nafbd3s11vnfsgzrzv2wdfjprbxizmv7wxpl3h94ayv22";
    libPath = "lib.rs";
    libName = "curl_sys";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."curl_sys"."0.4.20"."libc"}" deps)
      (crates."libz_sys"."${deps."curl_sys"."0.4.20"."libz_sys"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "darwin") then mapFeatures features ([
    ]
      ++ (if features.curl_sys."0.4.20".openssl-sys or false then [ (crates.openssl_sys."${deps."curl_sys"."0.4.20".openssl_sys}" deps) ] else [])) else [])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."curl_sys"."0.4.20"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."curl_sys"."0.4.20"."cc"}" deps)
      (crates."pkg_config"."${deps."curl_sys"."0.4.20"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."curl_sys"."0.4.20" or {});
  };
  features_."curl_sys"."0.4.20" = deps: f: updateFeatures f (rec {
    cc."${deps.curl_sys."0.4.20".cc}".default = true;
    curl_sys = fold recursiveUpdate {} [
      { "0.4.20"."libnghttp2-sys" =
        (f.curl_sys."0.4.20"."libnghttp2-sys" or false) ||
        (f.curl_sys."0.4.20"."http2" or false) ||
        (curl_sys."0.4.20"."http2" or false); }
      { "0.4.20"."openssl-sys" =
        (f.curl_sys."0.4.20"."openssl-sys" or false) ||
        (f.curl_sys."0.4.20"."ssl" or false) ||
        (curl_sys."0.4.20"."ssl" or false); }
      { "0.4.20"."ssl" =
        (f.curl_sys."0.4.20"."ssl" or false) ||
        (f.curl_sys."0.4.20"."default" or false) ||
        (curl_sys."0.4.20"."default" or false); }
      { "0.4.20".default = (f.curl_sys."0.4.20".default or true); }
    ];
    libc."${deps.curl_sys."0.4.20".libc}".default = true;
    libz_sys."${deps.curl_sys."0.4.20".libz_sys}".default = true;
    pkg_config."${deps.curl_sys."0.4.20".pkg_config}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.curl_sys."0.4.20".winapi}"."winsock2" = true; }
      { "${deps.curl_sys."0.4.20".winapi}"."ws2def" = true; }
      { "${deps.curl_sys."0.4.20".winapi}".default = true; }
    ];
  }) [
    (f: if deps."curl_sys"."0.4.20" ? "openssl_sys" then recursiveUpdate f { openssl_sys."${deps."curl_sys"."0.4.20"."openssl_sys"}"."default" = true; } else f)
    (if deps."curl_sys"."0.4.20" ? "libc" then features_.libc."${deps."curl_sys"."0.4.20"."libc" or ""}" deps else {})
    (if deps."curl_sys"."0.4.20" ? "libz_sys" then features_.libz_sys."${deps."curl_sys"."0.4.20"."libz_sys" or ""}" deps else {})
    (if deps."curl_sys"."0.4.20" ? "cc" then features_.cc."${deps."curl_sys"."0.4.20"."cc" or ""}" deps else {})
    (if deps."curl_sys"."0.4.20" ? "pkg_config" then features_.pkg_config."${deps."curl_sys"."0.4.20"."pkg_config" or ""}" deps else {})
    (if deps."curl_sys"."0.4.20" ? "openssl_sys" then features_.openssl_sys."${deps."curl_sys"."0.4.20"."openssl_sys" or ""}" deps else {})
    (if deps."curl_sys"."0.4.20" ? "winapi" then features_.winapi."${deps."curl_sys"."0.4.20"."winapi" or ""}" deps else {})
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
# encode_unicode-0.3.5

  crates.encode_unicode."0.3.5" = deps: { features?(features_."encode_unicode"."0.3.5" deps {}) }: buildRustCrate {
    crateName = "encode_unicode";
    version = "0.3.5";
    description = "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.
";
    authors = [ "Torbjørn Birch Moltu <t.b.moltu@lyse.net>" ];
    sha256 = "01qvydmk3mbq19carzbmzbds5ck0hskb60sm7ab474vzm5ws0i02";
    dependencies = mapFeatures features ([
])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
]) else []);
    features = mkFeatures (features."encode_unicode"."0.3.5" or {});
  };
  features_."encode_unicode"."0.3.5" = deps: f: updateFeatures f (rec {
    encode_unicode = fold recursiveUpdate {} [
      { "0.3.5"."std" =
        (f.encode_unicode."0.3.5"."std" or false) ||
        (f.encode_unicode."0.3.5"."default" or false) ||
        (encode_unicode."0.3.5"."default" or false); }
      { "0.3.5".default = (f.encode_unicode."0.3.5".default or true); }
    ];
  }) [];


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
# filetime-0.2.7

  crates.filetime."0.2.7" = deps: { features?(features_."filetime"."0.2.7" deps {}) }: buildRustCrate {
    crateName = "filetime";
    version = "0.2.7";
    description = "Platform-agnostic accessors of timestamps in File metadata
";
    homepage = "https://github.com/alexcrichton/filetime";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "10rd6xpgjmcjnlhi02g0awirwn537andfq79jgz7p0cc64gc5mny";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."filetime"."0.2.7"."cfg_if"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."filetime"."0.2.7"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."filetime"."0.2.7"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."filetime"."0.2.7"."winapi"}" deps)
    ]) else []);
  };
  features_."filetime"."0.2.7" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.filetime."0.2.7".cfg_if}".default = true;
    filetime."0.2.7".default = (f.filetime."0.2.7".default or true);
    libc."${deps.filetime."0.2.7".libc}".default = true;
    redox_syscall."${deps.filetime."0.2.7".redox_syscall}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.filetime."0.2.7".winapi}"."fileapi" = true; }
      { "${deps.filetime."0.2.7".winapi}"."minwindef" = true; }
      { "${deps.filetime."0.2.7".winapi}"."winbase" = true; }
      { "${deps.filetime."0.2.7".winapi}".default = true; }
    ];
  }) [
    (if deps."filetime"."0.2.7" ? "cfg_if" then features_.cfg_if."${deps."filetime"."0.2.7"."cfg_if" or ""}" deps else {})
    (if deps."filetime"."0.2.7" ? "redox_syscall" then features_.redox_syscall."${deps."filetime"."0.2.7"."redox_syscall" or ""}" deps else {})
    (if deps."filetime"."0.2.7" ? "libc" then features_.libc."${deps."filetime"."0.2.7"."libc" or ""}" deps else {})
    (if deps."filetime"."0.2.7" ? "winapi" then features_.winapi."${deps."filetime"."0.2.7"."winapi" or ""}" deps else {})
  ];


# end
# finalfusion-0.7.1

  crates.finalfusion."0.7.1" = deps: { features?(features_."finalfusion"."0.7.1" deps {}) }: buildRustCrate {
    crateName = "finalfusion";
    version = "0.7.1";
    description = "Reader and writer for common word embedding formats";
    homepage = "https://github.com/finalfusion/finalfusion-rust";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "0c0zncikdwwdard991al38gyrq1hnw168jn55r5bfr15ykf8x564";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."finalfusion"."0.7.1"."byteorder"}" deps)
      (crates."failure"."${deps."finalfusion"."0.7.1"."failure"}" deps)
      (crates."fnv"."${deps."finalfusion"."0.7.1"."fnv"}" deps)
      (crates."itertools"."${deps."finalfusion"."0.7.1"."itertools"}" deps)
      (crates."memmap"."${deps."finalfusion"."0.7.1"."memmap"}" deps)
      (crates."ndarray"."${deps."finalfusion"."0.7.1"."ndarray"}" deps)
      (crates."ordered_float"."${deps."finalfusion"."0.7.1"."ordered_float"}" deps)
      (crates."rand"."${deps."finalfusion"."0.7.1"."rand"}" deps)
      (crates."rand_xorshift"."${deps."finalfusion"."0.7.1"."rand_xorshift"}" deps)
      (crates."reductive"."${deps."finalfusion"."0.7.1"."reductive"}" deps)
      (crates."toml"."${deps."finalfusion"."0.7.1"."toml"}" deps)
    ]);
  };
  features_."finalfusion"."0.7.1" = deps: f: updateFeatures f (rec {
    byteorder."${deps.finalfusion."0.7.1".byteorder}".default = true;
    failure."${deps.finalfusion."0.7.1".failure}".default = true;
    finalfusion."0.7.1".default = (f.finalfusion."0.7.1".default or true);
    fnv."${deps.finalfusion."0.7.1".fnv}".default = true;
    itertools."${deps.finalfusion."0.7.1".itertools}".default = true;
    memmap."${deps.finalfusion."0.7.1".memmap}".default = true;
    ndarray."${deps.finalfusion."0.7.1".ndarray}".default = true;
    ordered_float."${deps.finalfusion."0.7.1".ordered_float}".default = true;
    rand."${deps.finalfusion."0.7.1".rand}".default = true;
    rand_xorshift."${deps.finalfusion."0.7.1".rand_xorshift}".default = true;
    reductive."${deps.finalfusion."0.7.1".reductive}".default = true;
    toml."${deps.finalfusion."0.7.1".toml}".default = true;
  }) [
    (if deps."finalfusion"."0.7.1" ? "byteorder" then features_.byteorder."${deps."finalfusion"."0.7.1"."byteorder" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "failure" then features_.failure."${deps."finalfusion"."0.7.1"."failure" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "fnv" then features_.fnv."${deps."finalfusion"."0.7.1"."fnv" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "itertools" then features_.itertools."${deps."finalfusion"."0.7.1"."itertools" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "memmap" then features_.memmap."${deps."finalfusion"."0.7.1"."memmap" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "ndarray" then features_.ndarray."${deps."finalfusion"."0.7.1"."ndarray" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "ordered_float" then features_.ordered_float."${deps."finalfusion"."0.7.1"."ordered_float" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "rand" then features_.rand."${deps."finalfusion"."0.7.1"."rand" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "rand_xorshift" then features_.rand_xorshift."${deps."finalfusion"."0.7.1"."rand_xorshift" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "reductive" then features_.reductive."${deps."finalfusion"."0.7.1"."reductive" or ""}" deps else {})
    (if deps."finalfusion"."0.7.1" ? "toml" then features_.toml."${deps."finalfusion"."0.7.1"."toml" or ""}" deps else {})
  ];


# end
# fixedbitset-0.1.9

  crates.fixedbitset."0.1.9" = deps: { features?(features_."fixedbitset"."0.1.9" deps {}) }: buildRustCrate {
    crateName = "fixedbitset";
    version = "0.1.9";
    description = "FixedBitSet is a simple bitset collection";
    authors = [ "bluss" ];
    sha256 = "1bkb5aq7h9p4rzlgxagnda1f0dd11q0qz41bmdy11z18q1p8igy1";
  };
  features_."fixedbitset"."0.1.9" = deps: f: updateFeatures f (rec {
    fixedbitset."0.1.9".default = (f.fixedbitset."0.1.9".default or true);
  }) [];


# end
# flate2-1.0.9

  crates.flate2."1.0.9" = deps: { features?(features_."flate2"."1.0.9" deps {}) }: buildRustCrate {
    crateName = "flate2";
    version = "1.0.9";
    description = "Bindings to miniz.c for DEFLATE compression and decompression exposed as
Reader/Writer streams. Contains bindings for zlib, deflate, and gzip-based
streams.
";
    homepage = "https://github.com/alexcrichton/flate2-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1zvi7gxw201p9acgz0bcxlpiagqf26nd7qa57rqim7hgxbi4dpy4";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."flate2"."1.0.9"."crc32fast"}" deps)
      (crates."libc"."${deps."flate2"."1.0.9"."libc"}" deps)
    ]
      ++ (if features.flate2."1.0.9".miniz-sys or false then [ (crates.miniz_sys."${deps."flate2"."1.0.9".miniz_sys}" deps) ] else [])
      ++ (if features.flate2."1.0.9".miniz_oxide_c_api or false then [ (crates.miniz_oxide_c_api."${deps."flate2"."1.0.9".miniz_oxide_c_api}" deps) ] else []))
      ++ (if cpu == "wasm32" && !(kernel == "emscripten") then mapFeatures features ([
      (crates."miniz_oxide_c_api"."${deps."flate2"."1.0.9"."miniz_oxide_c_api"}" deps)
    ]) else []);
    features = mkFeatures (features."flate2"."1.0.9" or {});
  };
  features_."flate2"."1.0.9" = deps: f: updateFeatures f (rec {
    crc32fast."${deps.flate2."1.0.9".crc32fast}".default = true;
    flate2 = fold recursiveUpdate {} [
      { "1.0.9"."futures" =
        (f.flate2."1.0.9"."futures" or false) ||
        (f.flate2."1.0.9"."tokio" or false) ||
        (flate2."1.0.9"."tokio" or false); }
      { "1.0.9"."libz-sys" =
        (f.flate2."1.0.9"."libz-sys" or false) ||
        (f.flate2."1.0.9"."zlib" or false) ||
        (flate2."1.0.9"."zlib" or false); }
      { "1.0.9"."miniz-sys" =
        (f.flate2."1.0.9"."miniz-sys" or false) ||
        (f.flate2."1.0.9"."default" or false) ||
        (flate2."1.0.9"."default" or false); }
      { "1.0.9"."miniz_oxide_c_api" =
        (f.flate2."1.0.9"."miniz_oxide_c_api" or false) ||
        (f.flate2."1.0.9"."rust_backend" or false) ||
        (flate2."1.0.9"."rust_backend" or false); }
      { "1.0.9"."tokio-io" =
        (f.flate2."1.0.9"."tokio-io" or false) ||
        (f.flate2."1.0.9"."tokio" or false) ||
        (flate2."1.0.9"."tokio" or false); }
      { "1.0.9".default = (f.flate2."1.0.9".default or true); }
    ];
    libc."${deps.flate2."1.0.9".libc}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "${deps.flate2."1.0.9".miniz_oxide_c_api}"."no_c_export" =
        (f.miniz_oxide_c_api."${deps.flate2."1.0.9".miniz_oxide_c_api}"."no_c_export" or false) ||
        true ||
        true; }
      { "${deps.flate2."1.0.9".miniz_oxide_c_api}".default = true; }
    ];
  }) [
    (f: if deps."flate2"."1.0.9" ? "miniz_sys" then recursiveUpdate f { miniz_sys."${deps."flate2"."1.0.9"."miniz_sys"}"."default" = true; } else f)
    (if deps."flate2"."1.0.9" ? "crc32fast" then features_.crc32fast."${deps."flate2"."1.0.9"."crc32fast" or ""}" deps else {})
    (if deps."flate2"."1.0.9" ? "libc" then features_.libc."${deps."flate2"."1.0.9"."libc" or ""}" deps else {})
    (if deps."flate2"."1.0.9" ? "miniz_sys" then features_.miniz_sys."${deps."flate2"."1.0.9"."miniz_sys" or ""}" deps else {})
    (if deps."flate2"."1.0.9" ? "miniz_oxide_c_api" then features_.miniz_oxide_c_api."${deps."flate2"."1.0.9"."miniz_oxide_c_api" or ""}" deps else {})
    (if deps."flate2"."1.0.9" ? "miniz_oxide_c_api" then features_.miniz_oxide_c_api."${deps."flate2"."1.0.9"."miniz_oxide_c_api" or ""}" deps else {})
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
# getrandom-0.1.9

  crates.getrandom."0.1.9" = deps: { features?(features_."getrandom"."0.1.9" deps {}) }: buildRustCrate {
    crateName = "getrandom";
    version = "0.1.9";
    description = "A small cross-platform library for retrieving random data from system source";
    authors = [ "The Rand Project Developers" ];
    edition = "2018";
    sha256 = "0q725cvahpqa0b84g4mrv7g1a3r8ah5gq2axmxp6a6gkcf5kpf9q";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."getrandom"."0.1.9"."cfg_if"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" || kernel == "wasi" then mapFeatures features ([
      (crates."libc"."${deps."getrandom"."0.1.9"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "wasi" then mapFeatures features ([
      (crates."wasi"."${deps."getrandom"."0.1.9"."wasi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."getrandom"."0.1.9" or {});
  };
  features_."getrandom"."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.getrandom."0.1.9".cfg_if}".default = true;
    getrandom = fold recursiveUpdate {} [
      { "0.1.9"."compiler_builtins" =
        (f.getrandom."0.1.9"."compiler_builtins" or false) ||
        (f.getrandom."0.1.9"."rustc-dep-of-std" or false) ||
        (getrandom."0.1.9"."rustc-dep-of-std" or false); }
      { "0.1.9"."core" =
        (f.getrandom."0.1.9"."core" or false) ||
        (f.getrandom."0.1.9"."rustc-dep-of-std" or false) ||
        (getrandom."0.1.9"."rustc-dep-of-std" or false); }
      { "0.1.9".default = (f.getrandom."0.1.9".default or true); }
    ];
    libc."${deps.getrandom."0.1.9".libc}".default = (f.libc."${deps.getrandom."0.1.9".libc}".default or false);
    wasi."${deps.getrandom."0.1.9".wasi}".default = true;
  }) [
    (if deps."getrandom"."0.1.9" ? "cfg_if" then features_.cfg_if."${deps."getrandom"."0.1.9"."cfg_if" or ""}" deps else {})
    (if deps."getrandom"."0.1.9" ? "libc" then features_.libc."${deps."getrandom"."0.1.9"."libc" or ""}" deps else {})
    (if deps."getrandom"."0.1.9" ? "wasi" then features_.wasi."${deps."getrandom"."0.1.9"."wasi" or ""}" deps else {})
  ];


# end
# half-1.3.0

  crates.half."1.3.0" = deps: { features?(features_."half"."1.3.0" deps {}) }: buildRustCrate {
    crateName = "half";
    version = "1.3.0";
    description = "Half-precision floating point f16 type for Rust implementing the IEEE 754-2008 binary16 type.";
    authors = [ "Kathryn Long <squeeself@gmail.com>" ];
    sha256 = "1pyl4kf8bzgiq0i8bm98vpc0g99qp8ns5i2aq34mb21fnw6s7xrz";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."half"."1.3.0" or {});
  };
  features_."half"."1.3.0" = deps: f: updateFeatures f (rec {
    half = fold recursiveUpdate {} [
      { "1.3.0"."serde" =
        (f.half."1.3.0"."serde" or false) ||
        (f.half."1.3.0"."serialize" or false) ||
        (half."1.3.0"."serialize" or false); }
      { "1.3.0".default = (f.half."1.3.0".default or true); }
    ];
  }) [];


# end
# indicatif-0.11.0

  crates.indicatif."0.11.0" = deps: { features?(features_."indicatif"."0.11.0" deps {}) }: buildRustCrate {
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
  features_."indicatif"."0.11.0" = deps: f: updateFeatures f (rec {
    console."${deps.indicatif."0.11.0".console}".default = true;
    indicatif."0.11.0".default = (f.indicatif."0.11.0".default or true);
    lazy_static."${deps.indicatif."0.11.0".lazy_static}".default = true;
    number_prefix."${deps.indicatif."0.11.0".number_prefix}".default = true;
    parking_lot."${deps.indicatif."0.11.0".parking_lot}".default = true;
    regex."${deps.indicatif."0.11.0".regex}".default = true;
  }) [
    (if deps."indicatif"."0.11.0" ? "console" then features_.console."${deps."indicatif"."0.11.0"."console" or ""}" deps else {})
    (if deps."indicatif"."0.11.0" ? "lazy_static" then features_.lazy_static."${deps."indicatif"."0.11.0"."lazy_static" or ""}" deps else {})
    (if deps."indicatif"."0.11.0" ? "number_prefix" then features_.number_prefix."${deps."indicatif"."0.11.0"."number_prefix" or ""}" deps else {})
    (if deps."indicatif"."0.11.0" ? "parking_lot" then features_.parking_lot."${deps."indicatif"."0.11.0"."parking_lot" or ""}" deps else {})
    (if deps."indicatif"."0.11.0" ? "regex" then features_.regex."${deps."indicatif"."0.11.0"."regex" or ""}" deps else {})
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
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_."kernel32_sys"."0.2.2" deps {}) }: buildRustCrate {
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
  features_."kernel32_sys"."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (if deps."kernel32_sys"."0.2.2" ? "winapi" then features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi" or ""}" deps else {})
    (if deps."kernel32_sys"."0.2.2" ? "winapi_build" then features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build" or ""}" deps else {})
  ];


# end
# lazy-init-0.3.0

  crates.lazy_init."0.3.0" = deps: { features?(features_."lazy_init"."0.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy-init";
    version = "0.3.0";
    description = "Lazy initialization.";
    authors = [ "Kyle Huey <khuey@kylehuey.com>" ];
    sha256 = "1flvklamz5rkldpkqgjbxx7avq6fkpa0542988zggmr87r3x68fr";
  };
  features_."lazy_init"."0.3.0" = deps: f: updateFeatures f (rec {
    lazy_init."0.3.0".default = (f.lazy_init."0.3.0".default or true);
  }) [];


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
# libc-0.2.62

  crates.libc."0.2.62" = deps: { features?(features_."libc"."0.2.62" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.62";
    description = "Raw FFI bindings to platform libraries like libc.
";
    homepage = "https://github.com/rust-lang/libc";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1vsb4pyn6gl6sri6cv5hin5wjfgk7lk2bshzmxb1xnkckjhz4gbx";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.62" or {});
  };
  features_."libc"."0.2.62" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.62"."align" =
        (f.libc."0.2.62"."align" or false) ||
        (f.libc."0.2.62"."rustc-dep-of-std" or false) ||
        (libc."0.2.62"."rustc-dep-of-std" or false); }
      { "0.2.62"."rustc-std-workspace-core" =
        (f.libc."0.2.62"."rustc-std-workspace-core" or false) ||
        (f.libc."0.2.62"."rustc-dep-of-std" or false) ||
        (libc."0.2.62"."rustc-dep-of-std" or false); }
      { "0.2.62"."std" =
        (f.libc."0.2.62"."std" or false) ||
        (f.libc."0.2.62"."default" or false) ||
        (libc."0.2.62"."default" or false) ||
        (f.libc."0.2.62"."use_std" or false) ||
        (libc."0.2.62"."use_std" or false); }
      { "0.2.62".default = (f.libc."0.2.62".default or true); }
    ];
  }) [];


# end
# libz-sys-1.0.25

  crates.libz_sys."1.0.25" = deps: { features?(features_."libz_sys"."1.0.25" deps {}) }: buildRustCrate {
    crateName = "libz-sys";
    version = "1.0.25";
    description = "Bindings to the system libz library (also known as zlib).
";
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
  features_."libz_sys"."1.0.25" = deps: f: updateFeatures f (rec {
    cc."${deps.libz_sys."1.0.25".cc}".default = true;
    libc."${deps.libz_sys."1.0.25".libc}".default = true;
    libz_sys."1.0.25".default = (f.libz_sys."1.0.25".default or true);
    pkg_config."${deps.libz_sys."1.0.25".pkg_config}".default = true;
  }) [
    (if deps."libz_sys"."1.0.25" ? "libc" then features_.libc."${deps."libz_sys"."1.0.25"."libc" or ""}" deps else {})
    (if deps."libz_sys"."1.0.25" ? "cc" then features_.cc."${deps."libz_sys"."1.0.25"."cc" or ""}" deps else {})
    (if deps."libz_sys"."1.0.25" ? "pkg_config" then features_.pkg_config."${deps."libz_sys"."1.0.25"."pkg_config" or ""}" deps else {})
  ];


# end
# lock_api-0.3.1

  crates.lock_api."0.3.1" = deps: { features?(features_."lock_api"."0.3.1" deps {}) }: buildRustCrate {
    crateName = "lock_api";
    version = "0.3.1";
    description = "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    edition = "2018";
    sha256 = "0fnav5aq42dcw3z2v9lp8pfrgmf4nnyr3h9i7v5qj9xdzxkp6lry";
    dependencies = mapFeatures features ([
      (crates."scopeguard"."${deps."lock_api"."0.3.1"."scopeguard"}" deps)
    ]);
    features = mkFeatures (features."lock_api"."0.3.1" or {});
  };
  features_."lock_api"."0.3.1" = deps: f: updateFeatures f (rec {
    lock_api."0.3.1".default = (f.lock_api."0.3.1".default or true);
    scopeguard."${deps.lock_api."0.3.1".scopeguard}".default = (f.scopeguard."${deps.lock_api."0.3.1".scopeguard}".default or false);
  }) [
    (if deps."lock_api"."0.3.1" ? "scopeguard" then features_.scopeguard."${deps."lock_api"."0.3.1"."scopeguard" or ""}" deps else {})
  ];


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
# miniz-sys-0.1.12

  crates.miniz_sys."0.1.12" = deps: { features?(features_."miniz_sys"."0.1.12" deps {}) }: buildRustCrate {
    crateName = "miniz-sys";
    version = "0.1.12";
    description = "Bindings to the miniz.c library.
";
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
  features_."miniz_sys"."0.1.12" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_sys."0.1.12".cc}".default = true;
    libc."${deps.miniz_sys."0.1.12".libc}".default = true;
    miniz_sys."0.1.12".default = (f.miniz_sys."0.1.12".default or true);
  }) [
    (if deps."miniz_sys"."0.1.12" ? "libc" then features_.libc."${deps."miniz_sys"."0.1.12"."libc" or ""}" deps else {})
    (if deps."miniz_sys"."0.1.12" ? "cc" then features_.cc."${deps."miniz_sys"."0.1.12"."cc" or ""}" deps else {})
  ];


# end
# miniz_oxide-0.3.2

  crates.miniz_oxide."0.3.2" = deps: { features?(features_."miniz_oxide"."0.3.2" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide";
    version = "0.3.2";
    description = "DEFLATE compression and decompression library rewritten in Rust based on miniz";
    homepage = "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" "oyvindln <oyvindln@users.noreply.github.com>" ];
    edition = "2018";
    sha256 = "013d6pswvpnxq6i43i96m9ba2c5ljda1x96hxsc5c180zqvb3b08";
    dependencies = mapFeatures features ([
      (crates."adler32"."${deps."miniz_oxide"."0.3.2"."adler32"}" deps)
    ]);
  };
  features_."miniz_oxide"."0.3.2" = deps: f: updateFeatures f (rec {
    adler32."${deps.miniz_oxide."0.3.2".adler32}".default = true;
    miniz_oxide."0.3.2".default = (f.miniz_oxide."0.3.2".default or true);
  }) [
    (if deps."miniz_oxide"."0.3.2" ? "adler32" then features_.adler32."${deps."miniz_oxide"."0.3.2"."adler32" or ""}" deps else {})
  ];


# end
# miniz_oxide_c_api-0.2.3

  crates.miniz_oxide_c_api."0.2.3" = deps: { features?(features_."miniz_oxide_c_api"."0.2.3" deps {}) }: buildRustCrate {
    crateName = "miniz_oxide_c_api";
    version = "0.2.3";
    description = "DEFLATE compression and decompression API designed to be Rust drop-in replacement for miniz";
    homepage = "https://github.com/Frommi/miniz_oxide/";
    authors = [ "Frommi <daniil.liferenko@gmail.com>" ];
    sha256 = "0mlfmzhj01zzjh1psb1r0l1l1dfx272nzp7nwmjdnivjhw0f124m";
    build = "src/build.rs";
    dependencies = mapFeatures features ([
      (crates."crc32fast"."${deps."miniz_oxide_c_api"."0.2.3"."crc32fast"}" deps)
      (crates."libc"."${deps."miniz_oxide_c_api"."0.2.3"."libc"}" deps)
      (crates."miniz_oxide"."${deps."miniz_oxide_c_api"."0.2.3"."miniz_oxide"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."miniz_oxide_c_api"."0.2.3"."cc"}" deps)
    ]);
    features = mkFeatures (features."miniz_oxide_c_api"."0.2.3" or {});
  };
  features_."miniz_oxide_c_api"."0.2.3" = deps: f: updateFeatures f (rec {
    cc."${deps.miniz_oxide_c_api."0.2.3".cc}".default = true;
    crc32fast."${deps.miniz_oxide_c_api."0.2.3".crc32fast}".default = true;
    libc."${deps.miniz_oxide_c_api."0.2.3".libc}".default = true;
    miniz_oxide."${deps.miniz_oxide_c_api."0.2.3".miniz_oxide}".default = true;
    miniz_oxide_c_api = fold recursiveUpdate {} [
      { "0.2.3"."build_orig_miniz" =
        (f.miniz_oxide_c_api."0.2.3"."build_orig_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.3"."benching" or false) ||
        (miniz_oxide_c_api."0.2.3"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.3"."fuzzing" or false) ||
        (miniz_oxide_c_api."0.2.3"."fuzzing" or false); }
      { "0.2.3"."build_stub_miniz" =
        (f.miniz_oxide_c_api."0.2.3"."build_stub_miniz" or false) ||
        (f.miniz_oxide_c_api."0.2.3"."miniz_zip" or false) ||
        (miniz_oxide_c_api."0.2.3"."miniz_zip" or false); }
      { "0.2.3"."no_c_export" =
        (f.miniz_oxide_c_api."0.2.3"."no_c_export" or false) ||
        (f.miniz_oxide_c_api."0.2.3"."benching" or false) ||
        (miniz_oxide_c_api."0.2.3"."benching" or false) ||
        (f.miniz_oxide_c_api."0.2.3"."fuzzing" or false) ||
        (miniz_oxide_c_api."0.2.3"."fuzzing" or false); }
      { "0.2.3".default = (f.miniz_oxide_c_api."0.2.3".default or true); }
    ];
  }) [
    (if deps."miniz_oxide_c_api"."0.2.3" ? "crc32fast" then features_.crc32fast."${deps."miniz_oxide_c_api"."0.2.3"."crc32fast" or ""}" deps else {})
    (if deps."miniz_oxide_c_api"."0.2.3" ? "libc" then features_.libc."${deps."miniz_oxide_c_api"."0.2.3"."libc" or ""}" deps else {})
    (if deps."miniz_oxide_c_api"."0.2.3" ? "miniz_oxide" then features_.miniz_oxide."${deps."miniz_oxide_c_api"."0.2.3"."miniz_oxide" or ""}" deps else {})
    (if deps."miniz_oxide_c_api"."0.2.3" ? "cc" then features_.cc."${deps."miniz_oxide_c_api"."0.2.3"."cc" or ""}" deps else {})
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
    ]);
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
    (if deps."ndarray"."0.12.1" ? "itertools" then features_.itertools."${deps."ndarray"."0.12.1"."itertools" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "matrixmultiply" then features_.matrixmultiply."${deps."ndarray"."0.12.1"."matrixmultiply" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "num_complex" then features_.num_complex."${deps."ndarray"."0.12.1"."num_complex" or ""}" deps else {})
    (if deps."ndarray"."0.12.1" ? "num_traits" then features_.num_traits."${deps."ndarray"."0.12.1"."num_traits" or ""}" deps else {})
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
# ndarray-tensorflow-0.2.0

  crates.ndarray_tensorflow."0.2.0" = deps: { features?(features_."ndarray_tensorflow"."0.2.0" deps {}) }: buildRustCrate {
    crateName = "ndarray-tensorflow";
    version = "0.2.0";
    description = "Adapter for Tensorflow tensors to expose the ndarray API";
    homepage = "https://github.com/danieldk/ndarray-tensorflow";
    authors = [ "Daniël de Kok <me@danieldk.eu>" ];
    edition = "2018";
    sha256 = "1j0dzn6l0chcrmijmr9r6kfcdj9ylqn68zawraa2kjmnl6gcsb2s";
    dependencies = mapFeatures features ([
      (crates."ndarray"."${deps."ndarray_tensorflow"."0.2.0"."ndarray"}" deps)
      (crates."tensorflow"."${deps."ndarray_tensorflow"."0.2.0"."tensorflow"}" deps)
    ]);
  };
  features_."ndarray_tensorflow"."0.2.0" = deps: f: updateFeatures f (rec {
    ndarray."${deps.ndarray_tensorflow."0.2.0".ndarray}".default = true;
    ndarray_tensorflow."0.2.0".default = (f.ndarray_tensorflow."0.2.0".default or true);
    tensorflow."${deps.ndarray_tensorflow."0.2.0".tensorflow}".default = true;
  }) [
    (if deps."ndarray_tensorflow"."0.2.0" ? "ndarray" then features_.ndarray."${deps."ndarray_tensorflow"."0.2.0"."ndarray" or ""}" deps else {})
    (if deps."ndarray_tensorflow"."0.2.0" ? "tensorflow" then features_.tensorflow."${deps."ndarray_tensorflow"."0.2.0"."tensorflow" or ""}" deps else {})
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
# number_prefix-0.2.8

  crates.number_prefix."0.2.8" = deps: { features?(features_."number_prefix"."0.2.8" deps {}) }: buildRustCrate {
    crateName = "number_prefix";
    version = "0.2.8";
    description = "Library for formatting numeric prefixes: kilo, giga, kibi.";
    homepage = "https://github.com/ogham/rust-number-prefix";
    authors = [ "ogham@bsago.me" ];
    sha256 = "0qlm6kx5ynjlqjmc88nb8dlansanxr8ajh1b5sb398d0n59lcikf";
    dependencies = mapFeatures features ([
      (crates."num_traits"."${deps."number_prefix"."0.2.8"."num_traits"}" deps)
    ]);
  };
  features_."number_prefix"."0.2.8" = deps: f: updateFeatures f (rec {
    num_traits."${deps.number_prefix."0.2.8".num_traits}".default = true;
    number_prefix."0.2.8".default = (f.number_prefix."0.2.8".default or true);
  }) [
    (if deps."number_prefix"."0.2.8" ? "num_traits" then features_.num_traits."${deps."number_prefix"."0.2.8"."num_traits" or ""}" deps else {})
  ];


# end
# openssl-probe-0.1.2

  crates.openssl_probe."0.1.2" = deps: { features?(features_."openssl_probe"."0.1.2" deps {}) }: buildRustCrate {
    crateName = "openssl-probe";
    version = "0.1.2";
    description = "Tool for helping to find SSL certificate locations on the system for OpenSSL
";
    homepage = "https://github.com/alexcrichton/openssl-probe";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1a89fznx26vvaxyrxdvgf6iwai5xvs6xjvpjin68fgvrslv6n15a";
  };
  features_."openssl_probe"."0.1.2" = deps: f: updateFeatures f (rec {
    openssl_probe."0.1.2".default = (f.openssl_probe."0.1.2".default or true);
  }) [];


# end
# openssl-sys-0.9.49

  crates.openssl_sys."0.9.49" = deps: { features?(features_."openssl_sys"."0.9.49" deps {}) }: buildRustCrate {
    crateName = "openssl-sys";
    version = "0.9.49";
    description = "FFI bindings to OpenSSL";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Steven Fackler <sfackler@gmail.com>" ];
    sha256 = "0bjgw81f5ry05yrhqyby68g9acfsg6yadbzwm2yh3axd77c7zq8a";
    build = "build/main.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."openssl_sys"."0.9.49"."libc"}" deps)
    ])
      ++ (if abi == "msvc" then mapFeatures features ([
]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."openssl_sys"."0.9.49"."autocfg"}" deps)
      (crates."cc"."${deps."openssl_sys"."0.9.49"."cc"}" deps)
      (crates."pkg_config"."${deps."openssl_sys"."0.9.49"."pkg_config"}" deps)
    ]);
    features = mkFeatures (features."openssl_sys"."0.9.49" or {});
  };
  features_."openssl_sys"."0.9.49" = deps: f: updateFeatures f (rec {
    autocfg."${deps.openssl_sys."0.9.49".autocfg}".default = true;
    cc."${deps.openssl_sys."0.9.49".cc}".default = true;
    libc."${deps.openssl_sys."0.9.49".libc}".default = true;
    openssl_sys = fold recursiveUpdate {} [
      { "0.9.49"."openssl-src" =
        (f.openssl_sys."0.9.49"."openssl-src" or false) ||
        (f.openssl_sys."0.9.49"."vendored" or false) ||
        (openssl_sys."0.9.49"."vendored" or false); }
      { "0.9.49".default = (f.openssl_sys."0.9.49".default or true); }
    ];
    pkg_config."${deps.openssl_sys."0.9.49".pkg_config}".default = true;
  }) [
    (if deps."openssl_sys"."0.9.49" ? "libc" then features_.libc."${deps."openssl_sys"."0.9.49"."libc" or ""}" deps else {})
    (if deps."openssl_sys"."0.9.49" ? "autocfg" then features_.autocfg."${deps."openssl_sys"."0.9.49"."autocfg" or ""}" deps else {})
    (if deps."openssl_sys"."0.9.49" ? "cc" then features_.cc."${deps."openssl_sys"."0.9.49"."cc" or ""}" deps else {})
    (if deps."openssl_sys"."0.9.49" ? "pkg_config" then features_.pkg_config."${deps."openssl_sys"."0.9.49"."pkg_config" or ""}" deps else {})
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
    ]
      ++ (if features.ordered_float."1.0.2".serde or false then [ (crates.serde."${deps."ordered_float"."1.0.2".serde}" deps) ] else []));
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
    (f: if deps."ordered_float"."1.0.2" ? "serde" then recursiveUpdate f { serde."${deps."ordered_float"."1.0.2"."serde"}"."default" = false; } else f)
    (if deps."ordered_float"."1.0.2" ? "num_traits" then features_.num_traits."${deps."ordered_float"."1.0.2"."num_traits" or ""}" deps else {})
    (if deps."ordered_float"."1.0.2" ? "serde" then features_.serde."${deps."ordered_float"."1.0.2"."serde" or ""}" deps else {})
  ];


# end
# ordermap-0.3.5

  crates.ordermap."0.3.5" = deps: { features?(features_."ordermap"."0.3.5" deps {}) }: buildRustCrate {
    crateName = "ordermap";
    version = "0.3.5";
    description = "A hash table with consistent order and fast iteration.";
    authors = [ "bluss" ];
    sha256 = "0b6vxfyh627yqm6war3392g1hhi4dbn49ibx2qv6mv490jdhv7d3";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."ordermap"."0.3.5" or {});
  };
  features_."ordermap"."0.3.5" = deps: f: updateFeatures f (rec {
    ordermap = fold recursiveUpdate {} [
      { "0.3.5"."serde" =
        (f.ordermap."0.3.5"."serde" or false) ||
        (f.ordermap."0.3.5"."serde-1" or false) ||
        (ordermap."0.3.5"."serde-1" or false); }
      { "0.3.5".default = (f.ordermap."0.3.5".default or true); }
    ];
  }) [];


# end
# parking_lot-0.9.0

  crates.parking_lot."0.9.0" = deps: { features?(features_."parking_lot"."0.9.0" deps {}) }: buildRustCrate {
    crateName = "parking_lot";
    version = "0.9.0";
    description = "More compact and efficient implementations of the standard synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    edition = "2018";
    sha256 = "0h28hk9yggik2pdyp5rbq31klkms0f34mg3yj6rsd9639jf8hf69";
    dependencies = mapFeatures features ([
      (crates."lock_api"."${deps."parking_lot"."0.9.0"."lock_api"}" deps)
      (crates."parking_lot_core"."${deps."parking_lot"."0.9.0"."parking_lot_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot"."0.9.0"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot"."0.9.0" or {});
  };
  features_."parking_lot"."0.9.0" = deps: f: updateFeatures f (rec {
    lock_api = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.9.0".lock_api}"."nightly" =
        (f.lock_api."${deps.parking_lot."0.9.0".lock_api}"."nightly" or false) ||
        (parking_lot."0.9.0"."nightly" or false) ||
        (f."parking_lot"."0.9.0"."nightly" or false); }
      { "${deps.parking_lot."0.9.0".lock_api}"."owning_ref" =
        (f.lock_api."${deps.parking_lot."0.9.0".lock_api}"."owning_ref" or false) ||
        (parking_lot."0.9.0"."owning_ref" or false) ||
        (f."parking_lot"."0.9.0"."owning_ref" or false); }
      { "${deps.parking_lot."0.9.0".lock_api}"."serde" =
        (f.lock_api."${deps.parking_lot."0.9.0".lock_api}"."serde" or false) ||
        (parking_lot."0.9.0"."serde" or false) ||
        (f."parking_lot"."0.9.0"."serde" or false); }
      { "${deps.parking_lot."0.9.0".lock_api}".default = true; }
    ];
    parking_lot."0.9.0".default = (f.parking_lot."0.9.0".default or true);
    parking_lot_core = fold recursiveUpdate {} [
      { "${deps.parking_lot."0.9.0".parking_lot_core}"."deadlock_detection" =
        (f.parking_lot_core."${deps.parking_lot."0.9.0".parking_lot_core}"."deadlock_detection" or false) ||
        (parking_lot."0.9.0"."deadlock_detection" or false) ||
        (f."parking_lot"."0.9.0"."deadlock_detection" or false); }
      { "${deps.parking_lot."0.9.0".parking_lot_core}"."nightly" =
        (f.parking_lot_core."${deps.parking_lot."0.9.0".parking_lot_core}"."nightly" or false) ||
        (parking_lot."0.9.0"."nightly" or false) ||
        (f."parking_lot"."0.9.0"."nightly" or false); }
      { "${deps.parking_lot."0.9.0".parking_lot_core}".default = true; }
    ];
    rustc_version."${deps.parking_lot."0.9.0".rustc_version}".default = true;
  }) [
    (if deps."parking_lot"."0.9.0" ? "lock_api" then features_.lock_api."${deps."parking_lot"."0.9.0"."lock_api" or ""}" deps else {})
    (if deps."parking_lot"."0.9.0" ? "parking_lot_core" then features_.parking_lot_core."${deps."parking_lot"."0.9.0"."parking_lot_core" or ""}" deps else {})
    (if deps."parking_lot"."0.9.0" ? "rustc_version" then features_.rustc_version."${deps."parking_lot"."0.9.0"."rustc_version" or ""}" deps else {})
  ];


# end
# parking_lot_core-0.6.2

  crates.parking_lot_core."0.6.2" = deps: { features?(features_."parking_lot_core"."0.6.2" deps {}) }: buildRustCrate {
    crateName = "parking_lot_core";
    version = "0.6.2";
    description = "An advanced API for creating custom synchronization primitives.";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    edition = "2018";
    sha256 = "0mn0vnz3afgpjafqa9ca9j39fb2inpz1lym9sghgl535n18psi3s";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."parking_lot_core"."0.6.2"."cfg_if"}" deps)
      (crates."smallvec"."${deps."parking_lot_core"."0.6.2"."smallvec"}" deps)
    ])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."parking_lot_core"."0.6.2"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."parking_lot_core"."0.6.2"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."parking_lot_core"."0.6.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."parking_lot_core"."0.6.2"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."parking_lot_core"."0.6.2"."rustc_version"}" deps)
    ]);
    features = mkFeatures (features."parking_lot_core"."0.6.2" or {});
  };
  features_."parking_lot_core"."0.6.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.parking_lot_core."0.6.2".cfg_if}".default = true;
    cloudabi."${deps.parking_lot_core."0.6.2".cloudabi}".default = true;
    libc."${deps.parking_lot_core."0.6.2".libc}".default = true;
    parking_lot_core = fold recursiveUpdate {} [
      { "0.6.2"."backtrace" =
        (f.parking_lot_core."0.6.2"."backtrace" or false) ||
        (f.parking_lot_core."0.6.2"."deadlock_detection" or false) ||
        (parking_lot_core."0.6.2"."deadlock_detection" or false); }
      { "0.6.2"."petgraph" =
        (f.parking_lot_core."0.6.2"."petgraph" or false) ||
        (f.parking_lot_core."0.6.2"."deadlock_detection" or false) ||
        (parking_lot_core."0.6.2"."deadlock_detection" or false); }
      { "0.6.2"."thread-id" =
        (f.parking_lot_core."0.6.2"."thread-id" or false) ||
        (f.parking_lot_core."0.6.2"."deadlock_detection" or false) ||
        (parking_lot_core."0.6.2"."deadlock_detection" or false); }
      { "0.6.2".default = (f.parking_lot_core."0.6.2".default or true); }
    ];
    redox_syscall."${deps.parking_lot_core."0.6.2".redox_syscall}".default = true;
    rustc_version."${deps.parking_lot_core."0.6.2".rustc_version}".default = true;
    smallvec."${deps.parking_lot_core."0.6.2".smallvec}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.parking_lot_core."0.6.2".winapi}"."errhandlingapi" = true; }
      { "${deps.parking_lot_core."0.6.2".winapi}"."handleapi" = true; }
      { "${deps.parking_lot_core."0.6.2".winapi}"."minwindef" = true; }
      { "${deps.parking_lot_core."0.6.2".winapi}"."ntstatus" = true; }
      { "${deps.parking_lot_core."0.6.2".winapi}"."winbase" = true; }
      { "${deps.parking_lot_core."0.6.2".winapi}"."winerror" = true; }
      { "${deps.parking_lot_core."0.6.2".winapi}"."winnt" = true; }
      { "${deps.parking_lot_core."0.6.2".winapi}".default = true; }
    ];
  }) [
    (if deps."parking_lot_core"."0.6.2" ? "cfg_if" then features_.cfg_if."${deps."parking_lot_core"."0.6.2"."cfg_if" or ""}" deps else {})
    (if deps."parking_lot_core"."0.6.2" ? "smallvec" then features_.smallvec."${deps."parking_lot_core"."0.6.2"."smallvec" or ""}" deps else {})
    (if deps."parking_lot_core"."0.6.2" ? "rustc_version" then features_.rustc_version."${deps."parking_lot_core"."0.6.2"."rustc_version" or ""}" deps else {})
    (if deps."parking_lot_core"."0.6.2" ? "cloudabi" then features_.cloudabi."${deps."parking_lot_core"."0.6.2"."cloudabi" or ""}" deps else {})
    (if deps."parking_lot_core"."0.6.2" ? "redox_syscall" then features_.redox_syscall."${deps."parking_lot_core"."0.6.2"."redox_syscall" or ""}" deps else {})
    (if deps."parking_lot_core"."0.6.2" ? "libc" then features_.libc."${deps."parking_lot_core"."0.6.2"."libc" or ""}" deps else {})
    (if deps."parking_lot_core"."0.6.2" ? "winapi" then features_.winapi."${deps."parking_lot_core"."0.6.2"."winapi" or ""}" deps else {})
  ];


# end
# petgraph-0.4.13

  crates.petgraph."0.4.13" = deps: { features?(features_."petgraph"."0.4.13" deps {}) }: buildRustCrate {
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
  features_."petgraph"."0.4.13" = deps: f: updateFeatures f (rec {
    fixedbitset."${deps.petgraph."0.4.13".fixedbitset}".default = true;
    petgraph = fold recursiveUpdate {} [
      { "0.4.13"."generate" =
        (f.petgraph."0.4.13"."generate" or false) ||
        (f.petgraph."0.4.13"."unstable" or false) ||
        (petgraph."0.4.13"."unstable" or false); }
      { "0.4.13"."graphmap" =
        (f.petgraph."0.4.13"."graphmap" or false) ||
        (f.petgraph."0.4.13"."all" or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13"."default" or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13"."ordermap" =
        (f.petgraph."0.4.13"."ordermap" or false) ||
        (f.petgraph."0.4.13"."graphmap" or false) ||
        (petgraph."0.4.13"."graphmap" or false); }
      { "0.4.13"."quickcheck" =
        (f.petgraph."0.4.13"."quickcheck" or false) ||
        (f.petgraph."0.4.13"."all" or false) ||
        (petgraph."0.4.13"."all" or false); }
      { "0.4.13"."serde" =
        (f.petgraph."0.4.13"."serde" or false) ||
        (f.petgraph."0.4.13"."serde-1" or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13"."serde_derive" =
        (f.petgraph."0.4.13"."serde_derive" or false) ||
        (f.petgraph."0.4.13"."serde-1" or false) ||
        (petgraph."0.4.13"."serde-1" or false); }
      { "0.4.13"."stable_graph" =
        (f.petgraph."0.4.13"."stable_graph" or false) ||
        (f.petgraph."0.4.13"."all" or false) ||
        (petgraph."0.4.13"."all" or false) ||
        (f.petgraph."0.4.13"."default" or false) ||
        (petgraph."0.4.13"."default" or false); }
      { "0.4.13"."unstable" =
        (f.petgraph."0.4.13"."unstable" or false) ||
        (f.petgraph."0.4.13"."all" or false) ||
        (petgraph."0.4.13"."all" or false); }
      { "0.4.13".default = (f.petgraph."0.4.13".default or true); }
    ];
  }) [
    (f: if deps."petgraph"."0.4.13" ? "ordermap" then recursiveUpdate f { ordermap."${deps."petgraph"."0.4.13"."ordermap"}"."default" = true; } else f)
    (if deps."petgraph"."0.4.13" ? "fixedbitset" then features_.fixedbitset."${deps."petgraph"."0.4.13"."fixedbitset" or ""}" deps else {})
    (if deps."petgraph"."0.4.13" ? "ordermap" then features_.ordermap."${deps."petgraph"."0.4.13"."ordermap" or ""}" deps else {})
  ];


# end
# pkg-config-0.3.15

  crates.pkg_config."0.3.15" = deps: { features?(features_."pkg_config"."0.3.15" deps {}) }: buildRustCrate {
    crateName = "pkg-config";
    version = "0.3.15";
    description = "A library to run the pkg-config system tool at build time in order to be used in
Cargo build scripts.
";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "02yh110i3bh5v7b2lb7sj4l335w2zdlliqqd5i5qf28f94w1rry5";
  };
  features_."pkg_config"."0.3.15" = deps: f: updateFeatures f (rec {
    pkg_config."0.3.15".default = (f.pkg_config."0.3.15".default or true);
  }) [];


# end
# ppv-lite86-0.2.5

  crates.ppv_lite86."0.2.5" = deps: { features?(features_."ppv_lite86"."0.2.5" deps {}) }: buildRustCrate {
    crateName = "ppv-lite86";
    version = "0.2.5";
    description = "Implementation of the crypto-simd API for x86";
    authors = [ "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "1r3bhih75vhl8v7q0flmywl7hmfg902yf3jjzracsh0jlkldij6r";
    features = mkFeatures (features."ppv_lite86"."0.2.5" or {});
  };
  features_."ppv_lite86"."0.2.5" = deps: f: updateFeatures f (rec {
    ppv_lite86 = fold recursiveUpdate {} [
      { "0.2.5"."simd" =
        (f.ppv_lite86."0.2.5"."simd" or false) ||
        (f.ppv_lite86."0.2.5"."default" or false) ||
        (ppv_lite86."0.2.5"."default" or false); }
      { "0.2.5"."std" =
        (f.ppv_lite86."0.2.5"."std" or false) ||
        (f.ppv_lite86."0.2.5"."default" or false) ||
        (ppv_lite86."0.2.5"."default" or false); }
      { "0.2.5".default = (f.ppv_lite86."0.2.5".default or true); }
    ];
  }) [];


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
# proc-macro2-1.0.1

  crates.proc_macro2."1.0.1" = deps: { features?(features_."proc_macro2"."1.0.1" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "1.0.1";
    description = "A stable implementation of the upcoming new `proc_macro` API. Comes with an
option, off by default, to also reimplement itself in terms of the upstream
unstable API.
";
    homepage = "https://github.com/alexcrichton/proc-macro2";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "120c9z5y8zz6gfl9c593k6vjss3sqz5x4nxd4ckwk27zi95h35i8";
    libName = "proc_macro2";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."1.0.1"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."1.0.1" or {});
  };
  features_."proc_macro2"."1.0.1" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "1.0.1"."proc-macro" =
        (f.proc_macro2."1.0.1"."proc-macro" or false) ||
        (f.proc_macro2."1.0.1"."default" or false) ||
        (proc_macro2."1.0.1"."default" or false); }
      { "1.0.1".default = (f.proc_macro2."1.0.1".default or true); }
    ];
    unicode_xid."${deps.proc_macro2."1.0.1".unicode_xid}".default = true;
  }) [
    (if deps."proc_macro2"."1.0.1" ? "unicode_xid" then features_.unicode_xid."${deps."proc_macro2"."1.0.1"."unicode_xid" or ""}" deps else {})
  ];


# end
# protobuf-2.8.0

  crates.protobuf."2.8.0" = deps: { features?(features_."protobuf"."2.8.0" deps {}) }: buildRustCrate {
    crateName = "protobuf";
    version = "2.8.0";
    description = "Rust implementation of Google protocol buffers
";
    homepage = "https://github.com/stepancheg/rust-protobuf/";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "0qy62cl3g58dksgxfnqi78h4xd4qmfjc2kvsmr8m9andbqi7zbi6";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."protobuf"."2.8.0" or {});
  };
  features_."protobuf"."2.8.0" = deps: f: updateFeatures f (rec {
    protobuf = fold recursiveUpdate {} [
      { "2.8.0"."bytes" =
        (f.protobuf."2.8.0"."bytes" or false) ||
        (f.protobuf."2.8.0"."with-bytes" or false) ||
        (protobuf."2.8.0"."with-bytes" or false); }
      { "2.8.0"."serde" =
        (f.protobuf."2.8.0"."serde" or false) ||
        (f.protobuf."2.8.0"."with-serde" or false) ||
        (protobuf."2.8.0"."with-serde" or false); }
      { "2.8.0"."serde_derive" =
        (f.protobuf."2.8.0"."serde_derive" or false) ||
        (f.protobuf."2.8.0"."with-serde" or false) ||
        (protobuf."2.8.0"."with-serde" or false); }
      { "2.8.0".default = (f.protobuf."2.8.0".default or true); }
    ];
  }) [];


# end
# protobuf-codegen-2.8.0

  crates.protobuf_codegen."2.8.0" = deps: { features?(features_."protobuf_codegen"."2.8.0" deps {}) }: buildRustCrate {
    crateName = "protobuf-codegen";
    version = "2.8.0";
    description = "Code generator for rust-protobuf.

Includes a library and `protoc-gen-rust` binary.

See `protoc-rust` and `protobuf-codegen-pure` crates.
";
    homepage = "https://github.com/stepancheg/rust-protobuf/";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "0mhqy6sd86gf6cccdfkh3b26kw92z5bfg86xw1h8vaii7zhzc6f0";
    crateBin =
      [{  name = "protoc-gen-rust";  path = "src/bin/protoc-gen-rust.rs"; }] ++
      [{  name = "protobuf-bin-gen-rust-do-not-use";  path = "src/bin/protobuf-bin-gen-rust-do-not-use.rs"; }];
    dependencies = mapFeatures features ([
      (crates."protobuf"."${deps."protobuf_codegen"."2.8.0"."protobuf"}" deps)
    ]);
  };
  features_."protobuf_codegen"."2.8.0" = deps: f: updateFeatures f (rec {
    protobuf."${deps.protobuf_codegen."2.8.0".protobuf}".default = true;
    protobuf_codegen."2.8.0".default = (f.protobuf_codegen."2.8.0".default or true);
  }) [
    (if deps."protobuf_codegen"."2.8.0" ? "protobuf" then features_.protobuf."${deps."protobuf_codegen"."2.8.0"."protobuf" or ""}" deps else {})
  ];


# end
# protoc-2.8.0

  crates.protoc."2.8.0" = deps: { features?(features_."protoc"."2.8.0" deps {}) }: buildRustCrate {
    crateName = "protoc";
    version = "2.8.0";
    description = "Protobuf protoc command as API
";
    homepage = "https://github.com/stepancheg/rust-protobuf/tree/master/protoc/";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "06zdf4cp48135pg9qhjbi2h1sh0hbravxqh29f977z3p2b69s75q";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."protoc"."2.8.0"."log"}" deps)
    ]);
  };
  features_."protoc"."2.8.0" = deps: f: updateFeatures f (rec {
    log."${deps.protoc."2.8.0".log}".default = true;
    protoc."2.8.0".default = (f.protoc."2.8.0".default or true);
  }) [
    (if deps."protoc"."2.8.0" ? "log" then features_.log."${deps."protoc"."2.8.0"."log" or ""}" deps else {})
  ];


# end
# protoc-rust-2.8.0

  crates.protoc_rust."2.8.0" = deps: { features?(features_."protoc_rust"."2.8.0" deps {}) }: buildRustCrate {
    crateName = "protoc-rust";
    version = "2.8.0";
    description = "protoc --rust_out=... available as API. protoc needs to be in $PATH, protoc-gen-run does not.
";
    homepage = "https://github.com/stepancheg/rust-protobuf/tree/master/protoc-rust/";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" ];
    sha256 = "0064zq1rh4h1840hpgn687pqagkl2f28hp3hw76nlnn9ds903amb";
    dependencies = mapFeatures features ([
      (crates."protobuf"."${deps."protoc_rust"."2.8.0"."protobuf"}" deps)
      (crates."protobuf_codegen"."${deps."protoc_rust"."2.8.0"."protobuf_codegen"}" deps)
      (crates."protoc"."${deps."protoc_rust"."2.8.0"."protoc"}" deps)
      (crates."tempfile"."${deps."protoc_rust"."2.8.0"."tempfile"}" deps)
    ]);
  };
  features_."protoc_rust"."2.8.0" = deps: f: updateFeatures f (rec {
    protobuf."${deps.protoc_rust."2.8.0".protobuf}".default = true;
    protobuf_codegen."${deps.protoc_rust."2.8.0".protobuf_codegen}".default = true;
    protoc."${deps.protoc_rust."2.8.0".protoc}".default = true;
    protoc_rust."2.8.0".default = (f.protoc_rust."2.8.0".default or true);
    tempfile."${deps.protoc_rust."2.8.0".tempfile}".default = true;
  }) [
    (if deps."protoc_rust"."2.8.0" ? "protobuf" then features_.protobuf."${deps."protoc_rust"."2.8.0"."protobuf" or ""}" deps else {})
    (if deps."protoc_rust"."2.8.0" ? "protobuf_codegen" then features_.protobuf_codegen."${deps."protoc_rust"."2.8.0"."protobuf_codegen" or ""}" deps else {})
    (if deps."protoc_rust"."2.8.0" ? "protoc" then features_.protoc."${deps."protoc_rust"."2.8.0"."protoc" or ""}" deps else {})
    (if deps."protoc_rust"."2.8.0" ? "tempfile" then features_.tempfile."${deps."protoc_rust"."2.8.0"."tempfile" or ""}" deps else {})
  ];


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
# quote-1.0.1

  crates.quote."1.0.1" = deps: { features?(features_."quote"."1.0.1" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "1.0.1";
    description = "Quasi-quoting macro quote!(...)";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    edition = "2018";
    sha256 = "01vs3lyg9cxbnmj4wavdaqdzjv099q4wk1ynfzckbr7k53jia1xs";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."1.0.1"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."1.0.1" or {});
  };
  features_."quote"."1.0.1" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."1.0.1".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."1.0.1".proc_macro2}"."proc-macro" or false) ||
        (quote."1.0.1"."proc-macro" or false) ||
        (f."quote"."1.0.1"."proc-macro" or false); }
      { "${deps.quote."1.0.1".proc_macro2}".default = (f.proc_macro2."${deps.quote."1.0.1".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "1.0.1"."proc-macro" =
        (f.quote."1.0.1"."proc-macro" or false) ||
        (f.quote."1.0.1"."default" or false) ||
        (quote."1.0.1"."default" or false); }
      { "1.0.1".default = (f.quote."1.0.1".default or true); }
    ];
  }) [
    (if deps."quote"."1.0.1" ? "proc_macro2" then features_.proc_macro2."${deps."quote"."1.0.1"."proc_macro2" or ""}" deps else {})
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
# rand-0.7.0

  crates.rand."0.7.0" = deps: { features?(features_."rand"."0.7.0" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.7.0";
    description = "Random number generators and other randomness functionality.
";
    homepage = "https://crates.io/crates/rand";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    edition = "2018";
    sha256 = "00nfv8p95nf985sxdfd7j23br77v47sf9hp95qjna1zsz4fyjs8v";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.7.0"."rand_core"}" deps)
    ])
      ++ (if !(kernel == "emscripten") then mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.7.0"."rand_chacha"}" deps)
    ]) else [])
      ++ (if kernel == "emscripten" then mapFeatures features ([
      (crates."rand_hc"."${deps."rand"."0.7.0"."rand_hc"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.7.0"."libc"}" deps)
    ]) else []);
    features = mkFeatures (features."rand"."0.7.0" or {});
  };
  features_."rand"."0.7.0" = deps: f: updateFeatures f (rec {
    libc."${deps.rand."0.7.0".libc}".default = (f.libc."${deps.rand."0.7.0".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.7.0"."alloc" =
        (f.rand."0.7.0"."alloc" or false) ||
        (f.rand."0.7.0"."std" or false) ||
        (rand."0.7.0"."std" or false); }
      { "0.7.0"."getrandom" =
        (f.rand."0.7.0"."getrandom" or false) ||
        (f.rand."0.7.0"."std" or false) ||
        (rand."0.7.0"."std" or false); }
      { "0.7.0"."getrandom_package" =
        (f.rand."0.7.0"."getrandom_package" or false) ||
        (f.rand."0.7.0"."getrandom" or false) ||
        (rand."0.7.0"."getrandom" or false); }
      { "0.7.0"."packed_simd" =
        (f.rand."0.7.0"."packed_simd" or false) ||
        (f.rand."0.7.0"."simd_support" or false) ||
        (rand."0.7.0"."simd_support" or false); }
      { "0.7.0"."rand_pcg" =
        (f.rand."0.7.0"."rand_pcg" or false) ||
        (f.rand."0.7.0"."small_rng" or false) ||
        (rand."0.7.0"."small_rng" or false); }
      { "0.7.0"."simd_support" =
        (f.rand."0.7.0"."simd_support" or false) ||
        (f.rand."0.7.0"."nightly" or false) ||
        (rand."0.7.0"."nightly" or false); }
      { "0.7.0"."std" =
        (f.rand."0.7.0"."std" or false) ||
        (f.rand."0.7.0"."default" or false) ||
        (rand."0.7.0"."default" or false); }
      { "0.7.0".default = (f.rand."0.7.0".default or true); }
    ];
    rand_chacha."${deps.rand."0.7.0".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.7.0".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."alloc" or false) ||
        (rand."0.7.0"."alloc" or false) ||
        (f."rand"."0.7.0"."alloc" or false); }
      { "${deps.rand."0.7.0".rand_core}"."getrandom" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."getrandom" or false) ||
        (rand."0.7.0"."getrandom" or false) ||
        (f."rand"."0.7.0"."getrandom" or false); }
      { "${deps.rand."0.7.0".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."std" or false) ||
        (rand."0.7.0"."std" or false) ||
        (f."rand"."0.7.0"."std" or false); }
      { "${deps.rand."0.7.0".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.7.0".rand_hc}".default = true;
  }) [
    (if deps."rand"."0.7.0" ? "rand_core" then features_.rand_core."${deps."rand"."0.7.0"."rand_core" or ""}" deps else {})
    (if deps."rand"."0.7.0" ? "rand_chacha" then features_.rand_chacha."${deps."rand"."0.7.0"."rand_chacha" or ""}" deps else {})
    (if deps."rand"."0.7.0" ? "rand_hc" then features_.rand_hc."${deps."rand"."0.7.0"."rand_hc" or ""}" deps else {})
    (if deps."rand"."0.7.0" ? "libc" then features_.libc."${deps."rand"."0.7.0"."libc" or ""}" deps else {})
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
# rand_chacha-0.2.1

  crates.rand_chacha."0.2.1" = deps: { features?(features_."rand_chacha"."0.2.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.2.1";
    description = "ChaCha random number generator
";
    homepage = "https://crates.io/crates/rand_chacha";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "0zpp3wmxhhmripb6bywhzhx5rfwl4dfbny85hpalwdj0sncv0p0k";
    dependencies = mapFeatures features ([
      (crates."c2_chacha"."${deps."rand_chacha"."0.2.1"."c2_chacha"}" deps)
      (crates."rand_core"."${deps."rand_chacha"."0.2.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_chacha"."0.2.1" or {});
  };
  features_."rand_chacha"."0.2.1" = deps: f: updateFeatures f (rec {
    c2_chacha = fold recursiveUpdate {} [
      { "${deps.rand_chacha."0.2.1".c2_chacha}"."simd" = true; }
      { "${deps.rand_chacha."0.2.1".c2_chacha}"."std" =
        (f.c2_chacha."${deps.rand_chacha."0.2.1".c2_chacha}"."std" or false) ||
        (rand_chacha."0.2.1"."std" or false) ||
        (f."rand_chacha"."0.2.1"."std" or false); }
      { "${deps.rand_chacha."0.2.1".c2_chacha}".default = (f.c2_chacha."${deps.rand_chacha."0.2.1".c2_chacha}".default or false); }
    ];
    rand_chacha = fold recursiveUpdate {} [
      { "0.2.1"."simd" =
        (f.rand_chacha."0.2.1"."simd" or false) ||
        (f.rand_chacha."0.2.1"."default" or false) ||
        (rand_chacha."0.2.1"."default" or false); }
      { "0.2.1"."std" =
        (f.rand_chacha."0.2.1"."std" or false) ||
        (f.rand_chacha."0.2.1"."default" or false) ||
        (rand_chacha."0.2.1"."default" or false); }
      { "0.2.1".default = (f.rand_chacha."0.2.1".default or true); }
    ];
    rand_core."${deps.rand_chacha."0.2.1".rand_core}".default = true;
  }) [
    (if deps."rand_chacha"."0.2.1" ? "c2_chacha" then features_.c2_chacha."${deps."rand_chacha"."0.2.1"."c2_chacha" or ""}" deps else {})
    (if deps."rand_chacha"."0.2.1" ? "rand_core" then features_.rand_core."${deps."rand_chacha"."0.2.1"."rand_core" or ""}" deps else {})
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
# rand_core-0.4.2

  crates.rand_core."0.4.2" = deps: { features?(features_."rand_core"."0.4.2" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.2";
    description = "Core random number generator traits and tools for implementation.
";
    homepage = "https://crates.io/crates/rand_core";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "18zpzwn4bl7lp9f36iacy8mvdnfrhfmzsl35gmln98dcindff2ly";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.2" or {});
  };
  features_."rand_core"."0.4.2" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.2"."alloc" =
        (f.rand_core."0.4.2"."alloc" or false) ||
        (f.rand_core."0.4.2"."std" or false) ||
        (rand_core."0.4.2"."std" or false); }
      { "0.4.2"."serde" =
        (f.rand_core."0.4.2"."serde" or false) ||
        (f.rand_core."0.4.2"."serde1" or false) ||
        (rand_core."0.4.2"."serde1" or false); }
      { "0.4.2"."serde_derive" =
        (f.rand_core."0.4.2"."serde_derive" or false) ||
        (f.rand_core."0.4.2"."serde1" or false) ||
        (rand_core."0.4.2"."serde1" or false); }
      { "0.4.2".default = (f.rand_core."0.4.2".default or true); }
    ];
  }) [];


# end
# rand_core-0.5.0

  crates.rand_core."0.5.0" = deps: { features?(features_."rand_core"."0.5.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.5.0";
    description = "Core random number generator traits and tools for implementation.
";
    homepage = "https://crates.io/crates/rand_core";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "12xakgqlbi2j0mabap4p908kisw91wjvsp69jphq2mv9hxjqq0gr";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.rand_core."0.5.0".getrandom or false then [ (crates.getrandom."${deps."rand_core"."0.5.0".getrandom}" deps) ] else []));
    features = mkFeatures (features."rand_core"."0.5.0" or {});
  };
  features_."rand_core"."0.5.0" = deps: f: updateFeatures f (rec {
    getrandom."${deps.rand_core."0.5.0".getrandom}"."std" =
        (f.getrandom."${deps.rand_core."0.5.0".getrandom}"."std" or false) ||
        (rand_core."0.5.0"."std" or false) ||
        (f."rand_core"."0.5.0"."std" or false);
    rand_core = fold recursiveUpdate {} [
      { "0.5.0"."alloc" =
        (f.rand_core."0.5.0"."alloc" or false) ||
        (f.rand_core."0.5.0"."std" or false) ||
        (rand_core."0.5.0"."std" or false); }
      { "0.5.0"."getrandom" =
        (f.rand_core."0.5.0"."getrandom" or false) ||
        (f.rand_core."0.5.0"."std" or false) ||
        (rand_core."0.5.0"."std" or false); }
      { "0.5.0"."serde" =
        (f.rand_core."0.5.0"."serde" or false) ||
        (f.rand_core."0.5.0"."serde1" or false) ||
        (rand_core."0.5.0"."serde1" or false); }
      { "0.5.0"."serde_derive" =
        (f.rand_core."0.5.0"."serde_derive" or false) ||
        (f.rand_core."0.5.0"."serde1" or false) ||
        (rand_core."0.5.0"."serde1" or false); }
      { "0.5.0".default = (f.rand_core."0.5.0".default or true); }
    ];
  }) [
    (f: if deps."rand_core"."0.5.0" ? "getrandom" then recursiveUpdate f { getrandom."${deps."rand_core"."0.5.0"."getrandom"}"."default" = true; } else f)
    (if deps."rand_core"."0.5.0" ? "getrandom" then features_.getrandom."${deps."rand_core"."0.5.0"."getrandom" or ""}" deps else {})
  ];


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
# rand_hc-0.2.0

  crates.rand_hc."0.2.0" = deps: { features?(features_."rand_hc"."0.2.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.2.0";
    description = "HC128 random number generator
";
    homepage = "https://crates.io/crates/rand_hc";
    authors = [ "The Rand Project Developers" ];
    edition = "2018";
    sha256 = "0592q9kqcna9aiyzy6vp3fadxkkbpfkmi2cnkv48zhybr0v2yf01";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.2.0"."rand_core"}" deps)
    ]);
  };
  features_."rand_hc"."0.2.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.2.0".rand_core}".default = true;
    rand_hc."0.2.0".default = (f.rand_hc."0.2.0".default or true);
  }) [
    (if deps."rand_hc"."0.2.0" ? "rand_core" then features_.rand_core."${deps."rand_hc"."0.2.0"."rand_core" or ""}" deps else {})
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
# redox_syscall-0.1.56

  crates.redox_syscall."0.1.56" = deps: { features?(features_."redox_syscall"."0.1.56" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.56";
    description = "A Rust library to access raw Redox system calls";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "0jcp8nd947zcy938bz09pzlmi3vyxfdzg92pjxdvvk0699vwcc26";
    libName = "syscall";
  };
  features_."redox_syscall"."0.1.56" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.56".default = (f.redox_syscall."0.1.56".default or true);
  }) [];


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
    ]);
    features = mkFeatures (features."reductive"."0.2.0" or {});
  };
  features_."reductive"."0.2.0" = deps: f: updateFeatures f (rec {
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
        (f.reductive."0.2.0"."opq-train" or false) ||
        (reductive."0.2.0"."opq-train" or false); }
      { "0.2.0".default = (f.reductive."0.2.0".default or true); }
    ];
  }) [
    (if deps."reductive"."0.2.0" ? "log" then features_.log."${deps."reductive"."0.2.0"."log" or ""}" deps else {})
    (if deps."reductive"."0.2.0" ? "ndarray" then features_.ndarray."${deps."reductive"."0.2.0"."ndarray" or ""}" deps else {})
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
# remove_dir_all-0.5.2

  crates.remove_dir_all."0.5.2" = deps: { features?(features_."remove_dir_all"."0.5.2" deps {}) }: buildRustCrate {
    crateName = "remove_dir_all";
    version = "0.5.2";
    description = "A safe, reliable implementation of remove_dir_all for Windows";
    authors = [ "Aaronepower <theaaronepower@gmail.com>" ];
    sha256 = "04sxg2ppvxiljc2i13bwvpbi540rf9d2a89cq0wmqf9pjvr3a1wm";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."remove_dir_all"."0.5.2"."winapi"}" deps)
    ]) else []);
  };
  features_."remove_dir_all"."0.5.2" = deps: f: updateFeatures f (rec {
    remove_dir_all."0.5.2".default = (f.remove_dir_all."0.5.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.remove_dir_all."0.5.2".winapi}"."errhandlingapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."fileapi" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."std" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winbase" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}"."winerror" = true; }
      { "${deps.remove_dir_all."0.5.2".winapi}".default = true; }
    ];
  }) [
    (if deps."remove_dir_all"."0.5.2" ? "winapi" then features_.winapi."${deps."remove_dir_all"."0.5.2"."winapi" or ""}" deps else {})
  ];


# end
# rustc-demangle-0.1.16

  crates.rustc_demangle."0.1.16" = deps: { features?(features_."rustc_demangle"."0.1.16" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.16";
    description = "Rust compiler symbol demangling.
";
    homepage = "https://github.com/alexcrichton/rustc-demangle";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0zmn448d0f898ahfkz7cir0fi0vk84dabjpw84mk6a1r6nf9vzmi";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rustc_demangle"."0.1.16" or {});
  };
  features_."rustc_demangle"."0.1.16" = deps: f: updateFeatures f (rec {
    rustc_demangle = fold recursiveUpdate {} [
      { "0.1.16"."compiler_builtins" =
        (f.rustc_demangle."0.1.16"."compiler_builtins" or false) ||
        (f.rustc_demangle."0.1.16"."rustc-dep-of-std" or false) ||
        (rustc_demangle."0.1.16"."rustc-dep-of-std" or false); }
      { "0.1.16"."core" =
        (f.rustc_demangle."0.1.16"."core" or false) ||
        (f.rustc_demangle."0.1.16"."rustc-dep-of-std" or false) ||
        (rustc_demangle."0.1.16"."rustc-dep-of-std" or false); }
      { "0.1.16".default = (f.rustc_demangle."0.1.16".default or true); }
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
# schannel-0.1.15

  crates.schannel."0.1.15" = deps: { features?(features_."schannel"."0.1.15" deps {}) }: buildRustCrate {
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
  features_."schannel"."0.1.15" = deps: f: updateFeatures f (rec {
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
    (if deps."schannel"."0.1.15" ? "lazy_static" then features_.lazy_static."${deps."schannel"."0.1.15"."lazy_static" or ""}" deps else {})
    (if deps."schannel"."0.1.15" ? "winapi" then features_.winapi."${deps."schannel"."0.1.15"."winapi" or ""}" deps else {})
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
# serde-1.0.99

  crates.serde."1.0.99" = deps: { features?(features_."serde"."1.0.99" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.99";
    description = "A generic serialization/deserialization framework";
    homepage = "https://serde.rs";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "1wwj6rv8h7k1sc0s8b8jcwcr54ayg46zjfv8z9a59hgnzg17nr86";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.99" or {});
  };
  features_."serde"."1.0.99" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.99"."serde_derive" =
        (f.serde."1.0.99"."serde_derive" or false) ||
        (f.serde."1.0.99"."derive" or false) ||
        (serde."1.0.99"."derive" or false); }
      { "1.0.99"."std" =
        (f.serde."1.0.99"."std" or false) ||
        (f.serde."1.0.99"."default" or false) ||
        (serde."1.0.99"."default" or false); }
      { "1.0.99".default = (f.serde."1.0.99".default or true); }
    ];
  }) [];


# end
# serde_cbor-0.10.1

  crates.serde_cbor."0.10.1" = deps: { features?(features_."serde_cbor"."0.10.1" deps {}) }: buildRustCrate {
    crateName = "serde_cbor";
    version = "0.10.1";
    description = "CBOR support for serde.";
    authors = [ "Pyfisch <pyfisch@gmail.com>" "Steven Fackler <sfackler@gmail.com>" ];
    edition = "2018";
    sha256 = "021j80im0yli0w4v2d02261m6ly4gx9fmmlx0prq0d3b8hmavibj";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."serde_cbor"."0.10.1"."byteorder"}" deps)
      (crates."half"."${deps."serde_cbor"."0.10.1"."half"}" deps)
      (crates."serde"."${deps."serde_cbor"."0.10.1"."serde"}" deps)
    ]);
    features = mkFeatures (features."serde_cbor"."0.10.1" or {});
  };
  features_."serde_cbor"."0.10.1" = deps: f: updateFeatures f (rec {
    byteorder."${deps.serde_cbor."0.10.1".byteorder}".default = (f.byteorder."${deps.serde_cbor."0.10.1".byteorder}".default or false);
    half."${deps.serde_cbor."0.10.1".half}".default = true;
    serde = fold recursiveUpdate {} [
      { "${deps.serde_cbor."0.10.1".serde}"."std" =
        (f.serde."${deps.serde_cbor."0.10.1".serde}"."std" or false) ||
        (serde_cbor."0.10.1"."std" or false) ||
        (f."serde_cbor"."0.10.1"."std" or false); }
      { "${deps.serde_cbor."0.10.1".serde}".default = (f.serde."${deps.serde_cbor."0.10.1".serde}".default or false); }
    ];
    serde_cbor = fold recursiveUpdate {} [
      { "0.10.1"."std" =
        (f.serde_cbor."0.10.1"."std" or false) ||
        (f.serde_cbor."0.10.1"."default" or false) ||
        (serde_cbor."0.10.1"."default" or false); }
      { "0.10.1".default = (f.serde_cbor."0.10.1".default or true); }
    ];
  }) [
    (if deps."serde_cbor"."0.10.1" ? "byteorder" then features_.byteorder."${deps."serde_cbor"."0.10.1"."byteorder" or ""}" deps else {})
    (if deps."serde_cbor"."0.10.1" ? "half" then features_.half."${deps."serde_cbor"."0.10.1"."half" or ""}" deps else {})
    (if deps."serde_cbor"."0.10.1" ? "serde" then features_.serde."${deps."serde_cbor"."0.10.1"."serde" or ""}" deps else {})
  ];


# end
# serde_derive-1.0.99

  crates.serde_derive."1.0.99" = deps: { features?(features_."serde_derive"."1.0.99" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.99";
    description = "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]";
    homepage = "https://serde.rs";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "03isppdkcccmdynm7garjf7vmri7dmza3lzqb56jlffzy08i518g";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.99"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.99"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.99"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.99" or {});
  };
  features_."serde_derive"."1.0.99" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.99".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.99".quote}".default = true;
    serde_derive."1.0.99".default = (f.serde_derive."1.0.99".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.99".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.99".syn}".default = true; }
    ];
  }) [
    (if deps."serde_derive"."1.0.99" ? "proc_macro2" then features_.proc_macro2."${deps."serde_derive"."1.0.99"."proc_macro2" or ""}" deps else {})
    (if deps."serde_derive"."1.0.99" ? "quote" then features_.quote."${deps."serde_derive"."1.0.99"."quote" or ""}" deps else {})
    (if deps."serde_derive"."1.0.99" ? "syn" then features_.syn."${deps."serde_derive"."1.0.99"."syn" or ""}" deps else {})
  ];


# end
# smallvec-0.6.10

  crates.smallvec."0.6.10" = deps: { features?(features_."smallvec"."0.6.10" deps {}) }: buildRustCrate {
    crateName = "smallvec";
    version = "0.6.10";
    description = "'Small vector' optimization: store up to a small number of items on the stack";
    authors = [ "Simon Sapin <simon.sapin@exyr.org>" ];
    sha256 = "01w7xd79q0bwn683gk4ryw50ad1zzxkny10f7gkbaaj1ax6f4q4h";
    libPath = "lib.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."smallvec"."0.6.10" or {});
  };
  features_."smallvec"."0.6.10" = deps: f: updateFeatures f (rec {
    smallvec = fold recursiveUpdate {} [
      { "0.6.10"."std" =
        (f.smallvec."0.6.10"."std" or false) ||
        (f.smallvec."0.6.10"."default" or false) ||
        (smallvec."0.6.10"."default" or false); }
      { "0.6.10".default = (f.smallvec."0.6.10".default or true); }
    ];
  }) [];


# end
# socket2-0.3.11

  crates.socket2."0.3.11" = deps: { features?(features_."socket2"."0.3.11" deps {}) }: buildRustCrate {
    crateName = "socket2";
    version = "0.3.11";
    description = "Utilities for handling networking sockets with a maximal amount of configuration
possible intended.
";
    homepage = "https://github.com/alexcrichton/socket2-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "06v07j2i8miv484vdgbj0k6npk6115x756yi0x3gvd3424nj3yjx";
    dependencies = (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" then mapFeatures features ([
      (crates."cfg_if"."${deps."socket2"."0.3.11"."cfg_if"}" deps)
      (crates."libc"."${deps."socket2"."0.3.11"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."socket2"."0.3.11"."redox_syscall"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."socket2"."0.3.11"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."socket2"."0.3.11" or {});
  };
  features_."socket2"."0.3.11" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.socket2."0.3.11".cfg_if}".default = true;
    libc."${deps.socket2."0.3.11".libc}".default = true;
    redox_syscall."${deps.socket2."0.3.11".redox_syscall}".default = true;
    socket2."0.3.11".default = (f.socket2."0.3.11".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.socket2."0.3.11".winapi}"."handleapi" = true; }
      { "${deps.socket2."0.3.11".winapi}"."minwindef" = true; }
      { "${deps.socket2."0.3.11".winapi}"."ws2def" = true; }
      { "${deps.socket2."0.3.11".winapi}"."ws2ipdef" = true; }
      { "${deps.socket2."0.3.11".winapi}"."ws2tcpip" = true; }
      { "${deps.socket2."0.3.11".winapi}".default = true; }
    ];
  }) [
    (if deps."socket2"."0.3.11" ? "cfg_if" then features_.cfg_if."${deps."socket2"."0.3.11"."cfg_if" or ""}" deps else {})
    (if deps."socket2"."0.3.11" ? "libc" then features_.libc."${deps."socket2"."0.3.11"."libc" or ""}" deps else {})
    (if deps."socket2"."0.3.11" ? "redox_syscall" then features_.redox_syscall."${deps."socket2"."0.3.11"."redox_syscall" or ""}" deps else {})
    (if deps."socket2"."0.3.11" ? "winapi" then features_.winapi."${deps."socket2"."0.3.11"."winapi" or ""}" deps else {})
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
# syn-0.15.44

  crates.syn."0.15.44" = deps: { features?(features_."syn"."0.15.44" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.44";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "09v11h141grmsnamd5j14mn8vpnfng6p60kdmsm8akz9m0qn7s1n";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.44"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.44"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.44".quote or false then [ (crates.quote."${deps."syn"."0.15.44".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.44" or {});
  };
  features_."syn"."0.15.44" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.44".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.44".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.44"."proc-macro" or false) ||
        (f."syn"."0.15.44"."proc-macro" or false); }
      { "${deps.syn."0.15.44".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.44".proc_macro2}".default or false); }
    ];
    quote."${deps.syn."0.15.44".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.44".quote}"."proc-macro" or false) ||
        (syn."0.15.44"."proc-macro" or false) ||
        (f."syn"."0.15.44"."proc-macro" or false);
    syn = fold recursiveUpdate {} [
      { "0.15.44"."clone-impls" =
        (f.syn."0.15.44"."clone-impls" or false) ||
        (f.syn."0.15.44"."default" or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."derive" =
        (f.syn."0.15.44"."derive" or false) ||
        (f.syn."0.15.44"."default" or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."parsing" =
        (f.syn."0.15.44"."parsing" or false) ||
        (f.syn."0.15.44"."default" or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."printing" =
        (f.syn."0.15.44"."printing" or false) ||
        (f.syn."0.15.44"."default" or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."proc-macro" =
        (f.syn."0.15.44"."proc-macro" or false) ||
        (f.syn."0.15.44"."default" or false) ||
        (syn."0.15.44"."default" or false); }
      { "0.15.44"."quote" =
        (f.syn."0.15.44"."quote" or false) ||
        (f.syn."0.15.44"."printing" or false) ||
        (syn."0.15.44"."printing" or false); }
      { "0.15.44".default = (f.syn."0.15.44".default or true); }
    ];
    unicode_xid."${deps.syn."0.15.44".unicode_xid}".default = true;
  }) [
    (f: if deps."syn"."0.15.44" ? "quote" then recursiveUpdate f { quote."${deps."syn"."0.15.44"."quote"}"."default" = false; } else f)
    (if deps."syn"."0.15.44" ? "proc_macro2" then features_.proc_macro2."${deps."syn"."0.15.44"."proc_macro2" or ""}" deps else {})
    (if deps."syn"."0.15.44" ? "quote" then features_.quote."${deps."syn"."0.15.44"."quote" or ""}" deps else {})
    (if deps."syn"."0.15.44" ? "unicode_xid" then features_.unicode_xid."${deps."syn"."0.15.44"."unicode_xid" or ""}" deps else {})
  ];


# end
# syn-1.0.2

  crates.syn."1.0.2" = deps: { features?(features_."syn"."1.0.2" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "1.0.2";
    description = "Parser for Rust source code";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    edition = "2018";
    sha256 = "138hg93qsn1dlpbikfnjpn1wq2apw90svn1i1wmc23ghvp8bc7dj";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."1.0.2"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."1.0.2"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."1.0.2".quote or false then [ (crates.quote."${deps."syn"."1.0.2".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."1.0.2" or {});
  };
  features_."syn"."1.0.2" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."1.0.2".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."1.0.2".proc_macro2}"."proc-macro" or false) ||
        (syn."1.0.2"."proc-macro" or false) ||
        (f."syn"."1.0.2"."proc-macro" or false); }
      { "${deps.syn."1.0.2".proc_macro2}".default = (f.proc_macro2."${deps.syn."1.0.2".proc_macro2}".default or false); }
    ];
    quote."${deps.syn."1.0.2".quote}"."proc-macro" =
        (f.quote."${deps.syn."1.0.2".quote}"."proc-macro" or false) ||
        (syn."1.0.2"."proc-macro" or false) ||
        (f."syn"."1.0.2"."proc-macro" or false);
    syn = fold recursiveUpdate {} [
      { "1.0.2"."clone-impls" =
        (f.syn."1.0.2"."clone-impls" or false) ||
        (f.syn."1.0.2"."default" or false) ||
        (syn."1.0.2"."default" or false); }
      { "1.0.2"."derive" =
        (f.syn."1.0.2"."derive" or false) ||
        (f.syn."1.0.2"."default" or false) ||
        (syn."1.0.2"."default" or false); }
      { "1.0.2"."parsing" =
        (f.syn."1.0.2"."parsing" or false) ||
        (f.syn."1.0.2"."default" or false) ||
        (syn."1.0.2"."default" or false); }
      { "1.0.2"."printing" =
        (f.syn."1.0.2"."printing" or false) ||
        (f.syn."1.0.2"."default" or false) ||
        (syn."1.0.2"."default" or false); }
      { "1.0.2"."proc-macro" =
        (f.syn."1.0.2"."proc-macro" or false) ||
        (f.syn."1.0.2"."default" or false) ||
        (syn."1.0.2"."default" or false); }
      { "1.0.2"."quote" =
        (f.syn."1.0.2"."quote" or false) ||
        (f.syn."1.0.2"."printing" or false) ||
        (syn."1.0.2"."printing" or false); }
      { "1.0.2".default = (f.syn."1.0.2".default or true); }
    ];
    unicode_xid."${deps.syn."1.0.2".unicode_xid}".default = true;
  }) [
    (f: if deps."syn"."1.0.2" ? "quote" then recursiveUpdate f { quote."${deps."syn"."1.0.2"."quote"}"."default" = false; } else f)
    (if deps."syn"."1.0.2" ? "proc_macro2" then features_.proc_macro2."${deps."syn"."1.0.2"."proc_macro2" or ""}" deps else {})
    (if deps."syn"."1.0.2" ? "quote" then features_.quote."${deps."syn"."1.0.2"."quote" or ""}" deps else {})
    (if deps."syn"."1.0.2" ? "unicode_xid" then features_.unicode_xid."${deps."syn"."1.0.2"."unicode_xid" or ""}" deps else {})
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
# tar-0.4.26

  crates.tar."0.4.26" = deps: { features?(features_."tar"."0.4.26" deps {}) }: buildRustCrate {
    crateName = "tar";
    version = "0.4.26";
    description = "A Rust implementation of a TAR file reader and writer. This library does not
currently handle compression, but it is abstract over all I/O readers and
writers. Additionally, great lengths are taken to ensure that the entire
contents are never required to be entirely resident in memory all at once.
";
    homepage = "https://github.com/alexcrichton/tar-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "1rmv889ibi1zllqpib5ywa2gdqsx4qg2l9qxr7skk4j5spcsy7lp";
    dependencies = mapFeatures features ([
      (crates."filetime"."${deps."tar"."0.4.26"."filetime"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tar"."0.4.26"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tar"."0.4.26"."libc"}" deps)
    ]
      ++ (if features.tar."0.4.26".xattr or false then [ (crates.xattr."${deps."tar"."0.4.26".xattr}" deps) ] else [])) else []);
    features = mkFeatures (features."tar"."0.4.26" or {});
  };
  features_."tar"."0.4.26" = deps: f: updateFeatures f (rec {
    filetime."${deps.tar."0.4.26".filetime}".default = true;
    libc."${deps.tar."0.4.26".libc}".default = true;
    redox_syscall."${deps.tar."0.4.26".redox_syscall}".default = true;
    tar = fold recursiveUpdate {} [
      { "0.4.26"."xattr" =
        (f.tar."0.4.26"."xattr" or false) ||
        (f.tar."0.4.26"."default" or false) ||
        (tar."0.4.26"."default" or false); }
      { "0.4.26".default = (f.tar."0.4.26".default or true); }
    ];
  }) [
    (f: if deps."tar"."0.4.26" ? "xattr" then recursiveUpdate f { xattr."${deps."tar"."0.4.26"."xattr"}"."default" = true; } else f)
    (if deps."tar"."0.4.26" ? "filetime" then features_.filetime."${deps."tar"."0.4.26"."filetime" or ""}" deps else {})
    (if deps."tar"."0.4.26" ? "redox_syscall" then features_.redox_syscall."${deps."tar"."0.4.26"."redox_syscall" or ""}" deps else {})
    (if deps."tar"."0.4.26" ? "libc" then features_.libc."${deps."tar"."0.4.26"."libc" or ""}" deps else {})
    (if deps."tar"."0.4.26" ? "xattr" then features_.xattr."${deps."tar"."0.4.26"."xattr" or ""}" deps else {})
  ];


# end
# tempfile-3.1.0

  crates.tempfile."3.1.0" = deps: { features?(features_."tempfile"."3.1.0" deps {}) }: buildRustCrate {
    crateName = "tempfile";
    version = "3.1.0";
    description = "A library for managing temporary files and directories.";
    homepage = "http://stebalien.com/projects/tempfile-rs";
    authors = [ "Steven Allen <steven@stebalien.com>" "The Rust Project Developers" "Ashley Mannix <ashleymannix@live.com.au>" "Jason White <jasonaw0@gmail.com>" ];
    edition = "2018";
    sha256 = "1r7ykxw90p5hm1g46i8ia33j5iwl3q252kbb6b074qhdav3sqndk";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."tempfile"."3.1.0"."cfg_if"}" deps)
      (crates."rand"."${deps."tempfile"."3.1.0"."rand"}" deps)
      (crates."remove_dir_all"."${deps."tempfile"."3.1.0"."remove_dir_all"}" deps)
    ])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."tempfile"."3.1.0"."redox_syscall"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."tempfile"."3.1.0"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."tempfile"."3.1.0"."winapi"}" deps)
    ]) else []);
  };
  features_."tempfile"."3.1.0" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.tempfile."3.1.0".cfg_if}".default = true;
    libc."${deps.tempfile."3.1.0".libc}".default = true;
    rand."${deps.tempfile."3.1.0".rand}".default = true;
    redox_syscall."${deps.tempfile."3.1.0".redox_syscall}".default = true;
    remove_dir_all."${deps.tempfile."3.1.0".remove_dir_all}".default = true;
    tempfile."3.1.0".default = (f.tempfile."3.1.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.tempfile."3.1.0".winapi}"."fileapi" = true; }
      { "${deps.tempfile."3.1.0".winapi}"."handleapi" = true; }
      { "${deps.tempfile."3.1.0".winapi}"."winbase" = true; }
      { "${deps.tempfile."3.1.0".winapi}".default = true; }
    ];
  }) [
    (if deps."tempfile"."3.1.0" ? "cfg_if" then features_.cfg_if."${deps."tempfile"."3.1.0"."cfg_if" or ""}" deps else {})
    (if deps."tempfile"."3.1.0" ? "rand" then features_.rand."${deps."tempfile"."3.1.0"."rand" or ""}" deps else {})
    (if deps."tempfile"."3.1.0" ? "remove_dir_all" then features_.remove_dir_all."${deps."tempfile"."3.1.0"."remove_dir_all" or ""}" deps else {})
    (if deps."tempfile"."3.1.0" ? "redox_syscall" then features_.redox_syscall."${deps."tempfile"."3.1.0"."redox_syscall" or ""}" deps else {})
    (if deps."tempfile"."3.1.0" ? "libc" then features_.libc."${deps."tempfile"."3.1.0"."libc" or ""}" deps else {})
    (if deps."tempfile"."3.1.0" ? "winapi" then features_.winapi."${deps."tempfile"."3.1.0"."winapi" or ""}" deps else {})
  ];


# end
# tensorflow-0.13.0

  crates.tensorflow."0.13.0" = deps: { features?(features_."tensorflow"."0.13.0" deps {}) }: buildRustCrate {
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
  features_."tensorflow"."0.13.0" = deps: f: updateFeatures f (rec {
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
    (if deps."tensorflow"."0.13.0" ? "aligned_alloc" then features_.aligned_alloc."${deps."tensorflow"."0.13.0"."aligned_alloc" or ""}" deps else {})
    (if deps."tensorflow"."0.13.0" ? "byteorder" then features_.byteorder."${deps."tensorflow"."0.13.0"."byteorder" or ""}" deps else {})
    (if deps."tensorflow"."0.13.0" ? "crc" then features_.crc."${deps."tensorflow"."0.13.0"."crc" or ""}" deps else {})
    (if deps."tensorflow"."0.13.0" ? "libc" then features_.libc."${deps."tensorflow"."0.13.0"."libc" or ""}" deps else {})
    (if deps."tensorflow"."0.13.0" ? "num_complex" then features_.num_complex."${deps."tensorflow"."0.13.0"."num_complex" or ""}" deps else {})
    (if deps."tensorflow"."0.13.0" ? "tensorflow_sys" then features_.tensorflow_sys."${deps."tensorflow"."0.13.0"."tensorflow_sys" or ""}" deps else {})
  ];


# end
# tensorflow-sys-0.16.0

  crates.tensorflow_sys."0.16.0" = deps: { features?(features_."tensorflow_sys"."0.16.0" deps {}) }: buildRustCrate {
    crateName = "tensorflow-sys";
    version = "0.16.0";
    description = "The package provides bindings to TensorFlow.";
    homepage = "https://github.com/tensorflow/rust";
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
  features_."tensorflow_sys"."0.16.0" = deps: f: updateFeatures f (rec {
    curl."${deps.tensorflow_sys."0.16.0".curl}".default = true;
    flate2."${deps.tensorflow_sys."0.16.0".flate2}".default = true;
    libc."${deps.tensorflow_sys."0.16.0".libc}".default = true;
    pkg_config."${deps.tensorflow_sys."0.16.0".pkg_config}".default = true;
    semver."${deps.tensorflow_sys."0.16.0".semver}".default = true;
    tar."${deps.tensorflow_sys."0.16.0".tar}".default = true;
    tensorflow_sys."0.16.0".default = (f.tensorflow_sys."0.16.0".default or true);
  }) [
    (if deps."tensorflow_sys"."0.16.0" ? "libc" then features_.libc."${deps."tensorflow_sys"."0.16.0"."libc" or ""}" deps else {})
    (if deps."tensorflow_sys"."0.16.0" ? "curl" then features_.curl."${deps."tensorflow_sys"."0.16.0"."curl" or ""}" deps else {})
    (if deps."tensorflow_sys"."0.16.0" ? "flate2" then features_.flate2."${deps."tensorflow_sys"."0.16.0"."flate2" or ""}" deps else {})
    (if deps."tensorflow_sys"."0.16.0" ? "pkg_config" then features_.pkg_config."${deps."tensorflow_sys"."0.16.0"."pkg_config" or ""}" deps else {})
    (if deps."tensorflow_sys"."0.16.0" ? "semver" then features_.semver."${deps."tensorflow_sys"."0.16.0"."semver" or ""}" deps else {})
    (if deps."tensorflow_sys"."0.16.0" ? "tar" then features_.tar."${deps."tensorflow_sys"."0.16.0"."tar" or ""}" deps else {})
  ];


# end
# termios-0.3.1

  crates.termios."0.3.1" = deps: { features?(features_."termios"."0.3.1" deps {}) }: buildRustCrate {
    crateName = "termios";
    version = "0.3.1";
    description = "Safe bindings for the termios library.";
    homepage = "https://github.com/dcuddeback/termios-rs";
    authors = [ "David Cuddeback <david.cuddeback@gmail.com>" ];
    sha256 = "1h0fwglrhay85fkbl05ym5gh8hxzl7pyz0a51zfmmngxrf7823c2";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."termios"."0.3.1"."libc"}" deps)
    ]);
  };
  features_."termios"."0.3.1" = deps: f: updateFeatures f (rec {
    libc."${deps.termios."0.3.1".libc}".default = true;
    termios."0.3.1".default = (f.termios."0.3.1".default or true);
  }) [
    (if deps."termios"."0.3.1" ? "libc" then features_.libc."${deps."termios"."0.3.1"."libc" or ""}" deps else {})
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
# threadpool-1.7.1

  crates.threadpool."1.7.1" = deps: { features?(features_."threadpool"."1.7.1" deps {}) }: buildRustCrate {
    crateName = "threadpool";
    version = "1.7.1";
    description = "A thread pool for running a number of jobs on a fixed set of worker threads.
";
    homepage = "https://github.com/rust-threadpool/rust-threadpool";
    authors = [ "The Rust Project Developers" "Corey Farwell <coreyf@rwell.org>" "Stefan Schindler <dns2utf8@estada.ch>" ];
    sha256 = "09g715plrn59kasvigqjrjqzcgqnaf6v6pia0xx03f18kvfmkq06";
    dependencies = mapFeatures features ([
      (crates."num_cpus"."${deps."threadpool"."1.7.1"."num_cpus"}" deps)
    ]);
  };
  features_."threadpool"."1.7.1" = deps: f: updateFeatures f (rec {
    num_cpus."${deps.threadpool."1.7.1".num_cpus}".default = true;
    threadpool."1.7.1".default = (f.threadpool."1.7.1".default or true);
  }) [
    (if deps."threadpool"."1.7.1" ? "num_cpus" then features_.num_cpus."${deps."threadpool"."1.7.1"."num_cpus" or ""}" deps else {})
  ];


# end
# toml-0.5.3

  crates.toml."0.5.3" = deps: { features?(features_."toml"."0.5.3" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.5.3";
    description = "A native Rust encoder and decoder of TOML-formatted files and streams. Provides
implementations of the standard Serialize/Deserialize traits for TOML data to
facilitate deserializing and serializing Rust structures.
";
    homepage = "https://github.com/alexcrichton/toml-rs";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    edition = "2018";
    sha256 = "0kdagcqxv1p5xxnqd0d4ganr7fq011pdspcm7j45vrd4ka4mzjk5";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.5.3"."serde"}" deps)
    ]);
    features = mkFeatures (features."toml"."0.5.3" or {});
  };
  features_."toml"."0.5.3" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.5.3".serde}".default = true;
    toml = fold recursiveUpdate {} [
      { "0.5.3"."linked-hash-map" =
        (f.toml."0.5.3"."linked-hash-map" or false) ||
        (f.toml."0.5.3"."preserve_order" or false) ||
        (toml."0.5.3"."preserve_order" or false); }
      { "0.5.3".default = (f.toml."0.5.3".default or true); }
    ];
  }) [
    (if deps."toml"."0.5.3" ? "serde" then features_.serde."${deps."toml"."0.5.3"."serde" or ""}" deps else {})
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
# unicode-xid-0.2.0

  crates.unicode_xid."0.2.0" = deps: { features?(features_."unicode_xid"."0.2.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.2.0";
    description = "Determine whether characters have the XID_Start
or XID_Continue properties according to
Unicode Standard Annex #31.
";
    homepage = "https://github.com/unicode-rs/unicode-xid";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "1c85gb3p3qhbjvfyjb31m06la4f024jx319k10ig7n47dz2fk8v7";
    features = mkFeatures (features."unicode_xid"."0.2.0" or {});
  };
  features_."unicode_xid"."0.2.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.2.0".default = (f.unicode_xid."0.2.0".default or true);
  }) [];


# end
# vcpkg-0.2.7

  crates.vcpkg."0.2.7" = deps: { features?(features_."vcpkg"."0.2.7" deps {}) }: buildRustCrate {
    crateName = "vcpkg";
    version = "0.2.7";
    description = "A library to find native dependencies in a vcpkg tree at build
time in order to be used in Cargo build scripts.
";
    authors = [ "Jim McGrath <jimmc2@gmail.com>" ];
    sha256 = "1lwykbbscbdy4nhrfidgg3rk2xw9cvx5672sx1c97wm8y3vjpcd9";
  };
  features_."vcpkg"."0.2.7" = deps: f: updateFeatures f (rec {
    vcpkg."0.2.7".default = (f.vcpkg."0.2.7".default or true);
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
# wasi-0.5.0

  crates.wasi."0.5.0" = deps: { features?(features_."wasi"."0.5.0" deps {}) }: buildRustCrate {
    crateName = "wasi";
    version = "0.5.0";
    description = "Experimental WASI API bindings for Rust";
    authors = [ "The Cranelift Project Developers" ];
    edition = "2018";
    sha256 = "07lkhjfx9ab19ri5gliqgga0jhafd1gv42y5ckb97l08wb7862k6";
  };
  features_."wasi"."0.5.0" = deps: f: updateFeatures f (rec {
    wasi."0.5.0".default = (f.wasi."0.5.0".default or true);
  }) [];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_."winapi"."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    description = "Types and constants for WinAPI bindings. See README for list of crates providing function bindings.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_."winapi"."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
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
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_."winapi_build"."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    description = "Common code for build.rs in WinAPI -sys crates.";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_."winapi_build"."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


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
# xattr-0.2.2

  crates.xattr."0.2.2" = deps: { features?(features_."xattr"."0.2.2" deps {}) }: buildRustCrate {
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
  features_."xattr"."0.2.2" = deps: f: updateFeatures f (rec {
    libc."${deps.xattr."0.2.2".libc}".default = true;
    xattr = fold recursiveUpdate {} [
      { "0.2.2"."unsupported" =
        (f.xattr."0.2.2"."unsupported" or false) ||
        (f.xattr."0.2.2"."default" or false) ||
        (xattr."0.2.2"."default" or false); }
      { "0.2.2".default = (f.xattr."0.2.2".default or true); }
    ];
  }) [
    (if deps."xattr"."0.2.2" ? "libc" then features_.libc."${deps."xattr"."0.2.2"."libc" or ""}" deps else {})
  ];


# end
}
