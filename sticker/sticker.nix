# Generated by carnix 0.10.0: carnix generate-nix --src . --standalone
{ lib, buildRustCrate, buildRustCrateHelpers, callPackage }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
  cratesIO = (callPackage ./crates-io.nix { });
in
rec {
  crates = cratesIO // rec {
# sticker-0.2.2

    crates.sticker."0.2.2" = deps: { features?(features_.sticker."0.2.2" deps {}) }: buildRustCrate {
      crateName = "sticker";
      version = "0.2.2";
      description = "Neural sequence labeler";
      authors = [ "Daniël de Kok <me@danieldk.eu>" ];
      edition = "2018";
      src = include [ "Cargo.toml" " sticker" ] ./.;
      workspace_member = "sticker";
      dependencies = mapFeatures features ([
        (cratesIO.crates."conllx"."${deps."sticker"."0.2.2"."conllx"}" deps)
        (cratesIO.crates."failure"."${deps."sticker"."0.2.2"."failure"}" deps)
        (cratesIO.crates."finalfusion"."${deps."sticker"."0.2.2"."finalfusion"}" deps)
        (cratesIO.crates."itertools"."${deps."sticker"."0.2.2"."itertools"}" deps)
        (cratesIO.crates."ndarray"."${deps."sticker"."0.2.2"."ndarray"}" deps)
        (cratesIO.crates."ordered_float"."${deps."sticker"."0.2.2"."ordered_float"}" deps)
        (cratesIO.crates."petgraph"."${deps."sticker"."0.2.2"."petgraph"}" deps)
        (cratesIO.crates."protobuf"."${deps."sticker"."0.2.2"."protobuf"}" deps)
        (cratesIO.crates."serde"."${deps."sticker"."0.2.2"."serde"}" deps)
        (cratesIO.crates."serde_derive"."${deps."sticker"."0.2.2"."serde_derive"}" deps)
        (cratesIO.crates."tensorflow"."${deps."sticker"."0.2.2"."tensorflow"}" deps)
        (crates."tf_proto"."${deps."sticker"."0.2.2"."tf_proto"}" deps)
      ]);
    };
    features_.sticker."0.2.2" = deps: f: updateFeatures f (rec {
      conllx."${deps.sticker."0.2.2".conllx}".default = true;
      failure."${deps.sticker."0.2.2".failure}".default = true;
      finalfusion."${deps.sticker."0.2.2".finalfusion}".default = true;
      itertools."${deps.sticker."0.2.2".itertools}".default = true;
      ndarray."${deps.sticker."0.2.2".ndarray}".default = true;
      ordered_float."${deps.sticker."0.2.2".ordered_float}".default = true;
      petgraph."${deps.sticker."0.2.2".petgraph}".default = true;
      protobuf."${deps.sticker."0.2.2".protobuf}".default = true;
      serde."${deps.sticker."0.2.2".serde}".default = true;
      serde_derive."${deps.sticker."0.2.2".serde_derive}".default = true;
      sticker."0.2.2".default = (f.sticker."0.2.2".default or true);
      tensorflow."${deps.sticker."0.2.2".tensorflow}".default = true;
      tf_proto."${deps.sticker."0.2.2".tf_proto}".default = true;
    }) [
      (cratesIO.features_.conllx."${deps."sticker"."0.2.2"."conllx"}" deps)
      (cratesIO.features_.failure."${deps."sticker"."0.2.2"."failure"}" deps)
      (cratesIO.features_.finalfusion."${deps."sticker"."0.2.2"."finalfusion"}" deps)
      (cratesIO.features_.itertools."${deps."sticker"."0.2.2"."itertools"}" deps)
      (cratesIO.features_.ndarray."${deps."sticker"."0.2.2"."ndarray"}" deps)
      (cratesIO.features_.ordered_float."${deps."sticker"."0.2.2"."ordered_float"}" deps)
      (cratesIO.features_.petgraph."${deps."sticker"."0.2.2"."petgraph"}" deps)
      (cratesIO.features_.protobuf."${deps."sticker"."0.2.2"."protobuf"}" deps)
      (cratesIO.features_.serde."${deps."sticker"."0.2.2"."serde"}" deps)
      (cratesIO.features_.serde_derive."${deps."sticker"."0.2.2"."serde_derive"}" deps)
      (cratesIO.features_.tensorflow."${deps."sticker"."0.2.2"."tensorflow"}" deps)
      (features_.tf_proto."${deps."sticker"."0.2.2"."tf_proto"}" deps)
    ];


# end
# sticker-utils-0.2.2

    crates.sticker_utils."0.2.2" = deps: { features?(features_.sticker_utils."0.2.2" deps {}) }: buildRustCrate {
      crateName = "sticker-utils";
      version = "0.2.2";
      description = "Neural sequence labeler (utilities)";
      authors = [ "Daniël de Kok <me@danieldk.eu>" ];
      edition = "2018";
      src = include [ "Cargo.toml" " sticker-utils" ] ./.;
      workspace_member = "sticker-utils";
      dependencies = mapFeatures features ([
        (cratesIO.crates."conllx"."${deps."sticker_utils"."0.2.2"."conllx"}" deps)
        (cratesIO.crates."failure"."${deps."sticker_utils"."0.2.2"."failure"}" deps)
        (cratesIO.crates."finalfusion"."${deps."sticker_utils"."0.2.2"."finalfusion"}" deps)
        (cratesIO.crates."getopts"."${deps."sticker_utils"."0.2.2"."getopts"}" deps)
        (cratesIO.crates."indicatif"."${deps."sticker_utils"."0.2.2"."indicatif"}" deps)
        (cratesIO.crates."ordered_float"."${deps."sticker_utils"."0.2.2"."ordered_float"}" deps)
        (cratesIO.crates."serde"."${deps."sticker_utils"."0.2.2"."serde"}" deps)
        (cratesIO.crates."serde_cbor"."${deps."sticker_utils"."0.2.2"."serde_cbor"}" deps)
        (cratesIO.crates."serde_derive"."${deps."sticker_utils"."0.2.2"."serde_derive"}" deps)
        (cratesIO.crates."stdinout"."${deps."sticker_utils"."0.2.2"."stdinout"}" deps)
        (crates."sticker"."${deps."sticker_utils"."0.2.2"."sticker"}" deps)
        (cratesIO.crates."tensorflow"."${deps."sticker_utils"."0.2.2"."tensorflow"}" deps)
        (cratesIO.crates."threadpool"."${deps."sticker_utils"."0.2.2"."threadpool"}" deps)
        (cratesIO.crates."toml"."${deps."sticker_utils"."0.2.2"."toml"}" deps)
      ]);
    };
    features_.sticker_utils."0.2.2" = deps: f: updateFeatures f (rec {
      conllx."${deps.sticker_utils."0.2.2".conllx}".default = true;
      failure."${deps.sticker_utils."0.2.2".failure}".default = true;
      finalfusion."${deps.sticker_utils."0.2.2".finalfusion}".default = true;
      getopts."${deps.sticker_utils."0.2.2".getopts}".default = true;
      indicatif."${deps.sticker_utils."0.2.2".indicatif}".default = true;
      ordered_float = fold recursiveUpdate {} [
        { "${deps.sticker_utils."0.2.2".ordered_float}"."serde" = true; }
        { "${deps.sticker_utils."0.2.2".ordered_float}".default = true; }
      ];
      serde."${deps.sticker_utils."0.2.2".serde}".default = true;
      serde_cbor."${deps.sticker_utils."0.2.2".serde_cbor}".default = true;
      serde_derive."${deps.sticker_utils."0.2.2".serde_derive}".default = true;
      stdinout."${deps.sticker_utils."0.2.2".stdinout}".default = true;
      sticker."${deps.sticker_utils."0.2.2".sticker}".default = true;
      sticker_utils."0.2.2".default = (f.sticker_utils."0.2.2".default or true);
      tensorflow."${deps.sticker_utils."0.2.2".tensorflow}".default = true;
      threadpool."${deps.sticker_utils."0.2.2".threadpool}".default = true;
      toml."${deps.sticker_utils."0.2.2".toml}".default = true;
    }) [
      (cratesIO.features_.conllx."${deps."sticker_utils"."0.2.2"."conllx"}" deps)
      (cratesIO.features_.failure."${deps."sticker_utils"."0.2.2"."failure"}" deps)
      (cratesIO.features_.finalfusion."${deps."sticker_utils"."0.2.2"."finalfusion"}" deps)
      (cratesIO.features_.getopts."${deps."sticker_utils"."0.2.2"."getopts"}" deps)
      (cratesIO.features_.indicatif."${deps."sticker_utils"."0.2.2"."indicatif"}" deps)
      (cratesIO.features_.ordered_float."${deps."sticker_utils"."0.2.2"."ordered_float"}" deps)
      (cratesIO.features_.serde."${deps."sticker_utils"."0.2.2"."serde"}" deps)
      (cratesIO.features_.serde_cbor."${deps."sticker_utils"."0.2.2"."serde_cbor"}" deps)
      (cratesIO.features_.serde_derive."${deps."sticker_utils"."0.2.2"."serde_derive"}" deps)
      (cratesIO.features_.stdinout."${deps."sticker_utils"."0.2.2"."stdinout"}" deps)
      (features_.sticker."${deps."sticker_utils"."0.2.2"."sticker"}" deps)
      (cratesIO.features_.tensorflow."${deps."sticker_utils"."0.2.2"."tensorflow"}" deps)
      (cratesIO.features_.threadpool."${deps."sticker_utils"."0.2.2"."threadpool"}" deps)
      (cratesIO.features_.toml."${deps."sticker_utils"."0.2.2"."toml"}" deps)
    ];


# end
# tf-proto-0.1.0

    crates.tf_proto."0.1.0" = deps: { features?(features_.tf_proto."0.1.0" deps {}) }: buildRustCrate {
      crateName = "tf-proto";
      version = "0.1.0";
      authors = [ "Daniël de Kok <me@danieldk.eu>" ];
      edition = "2018";
      src = include [ "Cargo.toml" " tf-proto" ] ./.;
      workspace_member = "tf-proto";
      dependencies = mapFeatures features ([
        (cratesIO.crates."protobuf"."${deps."tf_proto"."0.1.0"."protobuf"}" deps)
      ]);

      buildDependencies = mapFeatures features ([
      ]
        ++ (if features.tf_proto."0.1.0".protoc-rust or false then [ (cratesIO.crates.protoc_rust."${deps."tf_proto"."0.1.0".protoc_rust}" deps) ] else []));
      features = mkFeatures (features."tf_proto"."0.1.0" or {});
    };
    features_.tf_proto."0.1.0" = deps: f: updateFeatures f (rec {
      protobuf."${deps.tf_proto."0.1.0".protobuf}".default = true;
      protoc_rust."${deps.tf_proto."0.1.0".protoc_rust}".default = true;
      tf_proto = fold recursiveUpdate {} [
        { "0.1.0"."protoc-rust" =
          (f.tf_proto."0.1.0"."protoc-rust" or false) ||
          (f.tf_proto."0.1.0".proto-compile or false) ||
          (tf_proto."0.1.0"."proto-compile" or false); }
        { "0.1.0".default = (f.tf_proto."0.1.0".default or true); }
      ];
    }) [
      (cratesIO.features_.protobuf."${deps."tf_proto"."0.1.0"."protobuf"}" deps)
      (cratesIO.features_.protoc_rust."${deps."tf_proto"."0.1.0"."protoc_rust"}" deps)
    ];


# end

  };

  sticker = crates.crates.sticker."0.2.2" deps;
  sticker_utils = crates.crates.sticker_utils."0.2.2" deps;
  tf_proto = crates.crates.tf_proto."0.1.0" deps;
  __all = [ (sticker {}) (sticker_utils {}) (tf_proto {}) ];
  deps.adler32."1.0.3" = {};
  deps.aho_corasick."0.7.3" = {
    memchr = "2.2.0";
  };
  deps.aligned_alloc."0.1.3" = {
    kernel32_sys = "0.2.2";
    libc = "0.2.51";
    winapi = "0.2.8";
  };
  deps.approx."0.3.2" = {
    num_traits = "0.2.6";
  };
  deps.arrayvec."0.4.10" = {
    nodrop = "0.1.13";
  };
  deps.atty."0.2.11" = {
    termion = "1.5.1";
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.autocfg."0.1.2" = {};
  deps.backtrace."0.3.15" = {
    cfg_if = "0.1.7";
    rustc_demangle = "0.1.14";
    autocfg = "0.1.2";
    backtrace_sys = "0.1.28";
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.backtrace_sys."0.1.28" = {
    libc = "0.2.51";
    cc = "1.0.35";
  };
  deps.bitflags."1.0.4" = {};
  deps.build_const."0.2.1" = {};
  deps.byteorder."1.3.1" = {};
  deps.cc."1.0.35" = {};
  deps.cfg_if."0.1.7" = {};
  deps.clicolors_control."1.0.0" = {
    lazy_static = "1.3.0";
    libc = "0.2.51";
    atty = "0.2.11";
    winapi = "0.3.7";
  };
  deps.cloudabi."0.0.3" = {
    bitflags = "1.0.4";
  };
  deps.conllx."0.11.1" = {
    failure = "0.1.5";
    itertools = "0.7.11";
    lazy_init = "0.3.0";
    petgraph = "0.4.13";
  };
  deps.console."0.7.5" = {
    atty = "0.2.11";
    clicolors_control = "1.0.0";
    lazy_static = "1.3.0";
    libc = "0.2.51";
    parking_lot = "0.7.1";
    regex = "1.1.5";
    unicode_width = "0.1.5";
    termios = "0.3.1";
    encode_unicode = "0.3.5";
    winapi = "0.3.7";
  };
  deps.crc."1.8.1" = {
    build_const = "0.2.1";
  };
  deps.crc32fast."1.2.0" = {
    cfg_if = "0.1.7";
  };
  deps.crossbeam_deque."0.2.0" = {
    crossbeam_epoch = "0.3.1";
    crossbeam_utils = "0.2.2";
  };
  deps.crossbeam_epoch."0.3.1" = {
    arrayvec = "0.4.10";
    cfg_if = "0.1.7";
    crossbeam_utils = "0.2.2";
    lazy_static = "1.3.0";
    memoffset = "0.2.1";
    nodrop = "0.1.13";
    scopeguard = "0.3.3";
  };
  deps.crossbeam_utils."0.2.2" = {
    cfg_if = "0.1.7";
  };
  deps.curl."0.4.20" = {
    curl_sys = "0.4.17";
    libc = "0.2.51";
    socket2 = "0.3.8";
    openssl_probe = "0.1.2";
    openssl_sys = "0.9.43";
    kernel32_sys = "0.2.2";
    schannel = "0.1.15";
    winapi = "0.2.8";
  };
  deps.curl_sys."0.4.17" = {
    libc = "0.2.51";
    libz_sys = "1.0.25";
    cc = "1.0.35";
    pkg_config = "0.3.14";
    openssl_sys = "0.9.43";
    winapi = "0.3.7";
  };
  deps.either."1.5.2" = {};
  deps.encode_unicode."0.3.5" = {};
  deps.failure."0.1.5" = {
    backtrace = "0.3.15";
    failure_derive = "0.1.5";
  };
  deps.failure_derive."0.1.5" = {
    proc_macro2 = "0.4.27";
    quote = "0.6.12";
    syn = "0.15.30";
    synstructure = "0.10.1";
  };
  deps.filetime."0.2.4" = {
    cfg_if = "0.1.7";
    redox_syscall = "0.1.54";
    libc = "0.2.51";
  };
  deps.finalfusion."0.5.1" = {
    byteorder = "1.3.1";
    failure = "0.1.5";
    fnv = "1.0.6";
    itertools = "0.8.0";
    memmap = "0.7.0";
    ndarray = "0.12.1";
    ordered_float = "1.0.2";
    rand = "0.6.5";
    rand_xorshift = "0.1.1";
    reductive = "0.2.0";
    toml = "0.4.10";
  };
  deps.fixedbitset."0.1.9" = {};
  deps.flate2."1.0.7" = {
    crc32fast = "1.2.0";
    libc = "0.2.51";
    miniz_sys = "0.1.11";
    miniz_oxide_c_api = "0.2.1";
  };
  deps.fnv."1.0.6" = {};
  deps.fuchsia_cprng."0.1.1" = {};
  deps.getopts."0.2.18" = {
    unicode_width = "0.1.5";
  };
  deps.half."1.3.0" = {};
  deps.indicatif."0.11.0" = {
    console = "0.7.5";
    lazy_static = "1.3.0";
    number_prefix = "0.2.8";
    parking_lot = "0.7.1";
    regex = "1.1.5";
  };
  deps.itertools."0.7.11" = {
    either = "1.5.2";
  };
  deps.itertools."0.8.0" = {
    either = "1.5.2";
  };
  deps.kernel32_sys."0.2.2" = {
    winapi = "0.2.8";
    winapi_build = "0.1.1";
  };
  deps.lazy_init."0.3.0" = {};
  deps.lazy_static."1.3.0" = {};
  deps.libc."0.2.51" = {};
  deps.libz_sys."1.0.25" = {
    libc = "0.2.51";
    cc = "1.0.35";
    pkg_config = "0.3.14";
  };
  deps.lock_api."0.1.5" = {
    owning_ref = "0.4.0";
    scopeguard = "0.3.3";
  };
  deps.log."0.4.6" = {
    cfg_if = "0.1.7";
  };
  deps.matrixmultiply."0.1.15" = {
    rawpointer = "0.1.0";
  };
  deps.memchr."2.2.0" = {};
  deps.memmap."0.7.0" = {
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.memoffset."0.2.1" = {};
  deps.miniz_sys."0.1.11" = {
    libc = "0.2.51";
    cc = "1.0.35";
  };
  deps.miniz_oxide."0.2.1" = {
    adler32 = "1.0.3";
  };
  deps.miniz_oxide_c_api."0.2.1" = {
    crc = "1.8.1";
    libc = "0.2.51";
    miniz_oxide = "0.2.1";
    cc = "1.0.35";
  };
  deps.ndarray."0.12.1" = {
    itertools = "0.7.11";
    matrixmultiply = "0.1.15";
    num_complex = "0.2.1";
    num_traits = "0.2.6";
  };
  deps.ndarray_parallel."0.9.0" = {
    ndarray = "0.12.1";
    rayon = "1.0.3";
  };
  deps.nodrop."0.1.13" = {};
  deps.num_complex."0.2.1" = {
    num_traits = "0.2.6";
  };
  deps.num_traits."0.2.6" = {};
  deps.num_cpus."1.10.0" = {
    libc = "0.2.51";
  };
  deps.number_prefix."0.2.8" = {
    num_traits = "0.2.6";
  };
  deps.openssl_probe."0.1.2" = {};
  deps.openssl_sys."0.9.43" = {
    libc = "0.2.51";
    cc = "1.0.35";
    pkg_config = "0.3.14";
    rustc_version = "0.2.3";
  };
  deps.ordered_float."1.0.2" = {
    num_traits = "0.2.6";
    serde = "1.0.90";
  };
  deps.ordermap."0.3.5" = {};
  deps.owning_ref."0.4.0" = {
    stable_deref_trait = "1.1.1";
  };
  deps.parking_lot."0.7.1" = {
    lock_api = "0.1.5";
    parking_lot_core = "0.4.0";
  };
  deps.parking_lot_core."0.4.0" = {
    rand = "0.6.5";
    smallvec = "0.6.9";
    rustc_version = "0.2.3";
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.petgraph."0.4.13" = {
    fixedbitset = "0.1.9";
    ordermap = "0.3.5";
  };
  deps.pkg_config."0.3.14" = {};
  deps.proc_macro2."0.4.27" = {
    unicode_xid = "0.1.0";
  };
  deps.protobuf."2.5.0" = {};
  deps.protobuf_codegen."2.5.0" = {
    protobuf = "2.5.0";
  };
  deps.protoc."2.5.0" = {
    log = "0.4.6";
  };
  deps.protoc_rust."2.5.0" = {
    protobuf = "2.5.0";
    protobuf_codegen = "2.5.0";
    protoc = "2.5.0";
    tempfile = "3.0.7";
  };
  deps.quote."0.6.12" = {
    proc_macro2 = "0.4.27";
  };
  deps.rand."0.6.5" = {
    rand_chacha = "0.1.1";
    rand_core = "0.4.0";
    rand_hc = "0.1.0";
    rand_isaac = "0.1.1";
    rand_jitter = "0.1.3";
    rand_os = "0.1.3";
    rand_pcg = "0.1.2";
    rand_xorshift = "0.1.1";
    autocfg = "0.1.2";
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.rand_chacha."0.1.1" = {
    rand_core = "0.3.1";
    autocfg = "0.1.2";
  };
  deps.rand_core."0.3.1" = {
    rand_core = "0.4.0";
  };
  deps.rand_core."0.4.0" = {};
  deps.rand_hc."0.1.0" = {
    rand_core = "0.3.1";
  };
  deps.rand_isaac."0.1.1" = {
    rand_core = "0.3.1";
  };
  deps.rand_jitter."0.1.3" = {
    rand_core = "0.4.0";
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.rand_os."0.1.3" = {
    rand_core = "0.4.0";
    rdrand = "0.4.0";
    cloudabi = "0.0.3";
    fuchsia_cprng = "0.1.1";
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.rand_pcg."0.1.2" = {
    rand_core = "0.4.0";
    autocfg = "0.1.2";
  };
  deps.rand_xorshift."0.1.1" = {
    rand_core = "0.3.1";
  };
  deps.rawpointer."0.1.0" = {};
  deps.rayon."1.0.3" = {
    crossbeam_deque = "0.2.0";
    either = "1.5.2";
    rayon_core = "1.4.1";
  };
  deps.rayon_core."1.4.1" = {
    crossbeam_deque = "0.2.0";
    lazy_static = "1.3.0";
    libc = "0.2.51";
    num_cpus = "1.10.0";
  };
  deps.rdrand."0.4.0" = {
    rand_core = "0.3.1";
  };
  deps.redox_syscall."0.1.54" = {};
  deps.redox_termios."0.1.1" = {
    redox_syscall = "0.1.54";
  };
  deps.reductive."0.2.0" = {
    log = "0.4.6";
    ndarray = "0.12.1";
    ndarray_parallel = "0.9.0";
    num_traits = "0.2.6";
    ordered_float = "1.0.2";
    rand = "0.6.5";
    rand_xorshift = "0.1.1";
    rayon = "1.0.3";
  };
  deps.regex."1.1.5" = {
    aho_corasick = "0.7.3";
    memchr = "2.2.0";
    regex_syntax = "0.6.6";
    thread_local = "0.3.6";
    utf8_ranges = "1.0.2";
  };
  deps.regex_syntax."0.6.6" = {
    ucd_util = "0.1.3";
  };
  deps.remove_dir_all."0.5.1" = {
    winapi = "0.3.7";
  };
  deps.rustc_demangle."0.1.14" = {};
  deps.rustc_version."0.2.3" = {
    semver = "0.9.0";
  };
  deps.schannel."0.1.15" = {
    lazy_static = "1.3.0";
    winapi = "0.3.7";
  };
  deps.scopeguard."0.3.3" = {};
  deps.semver."0.9.0" = {
    semver_parser = "0.7.0";
  };
  deps.semver_parser."0.7.0" = {};
  deps.serde."1.0.90" = {};
  deps.serde_cbor."0.9.0" = {
    byteorder = "1.3.1";
    half = "1.3.0";
    serde = "1.0.90";
  };
  deps.serde_derive."1.0.90" = {
    proc_macro2 = "0.4.27";
    quote = "0.6.12";
    syn = "0.15.30";
  };
  deps.smallvec."0.6.9" = {};
  deps.socket2."0.3.8" = {
    cfg_if = "0.1.7";
    libc = "0.2.51";
    redox_syscall = "0.1.54";
    winapi = "0.3.7";
  };
  deps.stable_deref_trait."1.1.1" = {};
  deps.stdinout."0.4.0" = {};
  deps.sticker."0.2.2" = {
    conllx = "0.11.1";
    failure = "0.1.5";
    finalfusion = "0.5.1";
    itertools = "0.8.0";
    ndarray = "0.12.1";
    ordered_float = "1.0.2";
    petgraph = "0.4.13";
    protobuf = "2.5.0";
    serde = "1.0.90";
    serde_derive = "1.0.90";
    tensorflow = "0.13.0";
    tf_proto = "0.1.0";
  };
  deps.sticker_utils."0.2.2" = {
    conllx = "0.11.1";
    failure = "0.1.5";
    finalfusion = "0.5.1";
    getopts = "0.2.18";
    indicatif = "0.11.0";
    ordered_float = "1.0.2";
    serde = "1.0.90";
    serde_cbor = "0.9.0";
    serde_derive = "1.0.90";
    stdinout = "0.4.0";
    sticker = "0.2.2";
    tensorflow = "0.13.0";
    threadpool = "1.7.1";
    toml = "0.5.0";
  };
  deps.syn."0.15.30" = {
    proc_macro2 = "0.4.27";
    quote = "0.6.12";
    unicode_xid = "0.1.0";
  };
  deps.synstructure."0.10.1" = {
    proc_macro2 = "0.4.27";
    quote = "0.6.12";
    syn = "0.15.30";
    unicode_xid = "0.1.0";
  };
  deps.tar."0.4.22" = {
    filetime = "0.2.4";
    redox_syscall = "0.1.54";
    libc = "0.2.51";
    xattr = "0.2.2";
  };
  deps.tempfile."3.0.7" = {
    cfg_if = "0.1.7";
    rand = "0.6.5";
    remove_dir_all = "0.5.1";
    redox_syscall = "0.1.54";
    libc = "0.2.51";
    winapi = "0.3.7";
  };
  deps.tensorflow."0.13.0" = {
    aligned_alloc = "0.1.3";
    byteorder = "1.3.1";
    crc = "1.8.1";
    libc = "0.2.51";
    num_complex = "0.2.1";
    tensorflow_sys = "0.16.0";
  };
  deps.tensorflow_sys."0.16.0" = {
    libc = "0.2.51";
    curl = "0.4.20";
    flate2 = "1.0.7";
    pkg_config = "0.3.14";
    semver = "0.9.0";
    tar = "0.4.22";
  };
  deps.termion."1.5.1" = {
    libc = "0.2.51";
    redox_syscall = "0.1.54";
    redox_termios = "0.1.1";
  };
  deps.termios."0.3.1" = {
    libc = "0.2.51";
  };
  deps.tf_proto."0.1.0" = {
    protobuf = "2.5.0";
    protoc_rust = "2.5.0";
  };
  deps.thread_local."0.3.6" = {
    lazy_static = "1.3.0";
  };
  deps.threadpool."1.7.1" = {
    num_cpus = "1.10.0";
  };
  deps.toml."0.4.10" = {
    serde = "1.0.90";
  };
  deps.toml."0.5.0" = {
    serde = "1.0.90";
  };
  deps.ucd_util."0.1.3" = {};
  deps.unicode_width."0.1.5" = {};
  deps.unicode_xid."0.1.0" = {};
  deps.utf8_ranges."1.0.2" = {};
  deps.vcpkg."0.2.6" = {};
  deps.winapi."0.2.8" = {};
  deps.winapi."0.3.7" = {
    winapi_i686_pc_windows_gnu = "0.4.0";
    winapi_x86_64_pc_windows_gnu = "0.4.0";
  };
  deps.winapi_build."0.1.1" = {};
  deps.winapi_i686_pc_windows_gnu."0.4.0" = {};
  deps.winapi_x86_64_pc_windows_gnu."0.4.0" = {};
  deps.xattr."0.2.2" = {
    libc = "0.2.51";
  };
}
