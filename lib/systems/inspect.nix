with import ./parse.nix;
with import ../attrsets.nix;

rec {
  patterns = {
    "32bit"      = { cpu = { bits = 32; }; };
    "64bit"      = { cpu = { bits = 64; }; };
    i686         = { cpu = cpuTypes.i686; };
    x86_64       = { cpu = cpuTypes.x86_64; };
    Arm          = { cpu = { family = "arm"; }; };
    Mips         = { cpu = { family = "mips"; }; };
    BigEndian    = { cpu = { significantByte = significantBytes.bigEndian; }; };
    LittleEndian = { cpu = { significantByte = significantBytes.littleEndian; }; };

    Unix         = { kernel = { families = { inherit (kernelFamilies) unix; }; }; };
    BSD          = { kernel = { families = { inherit (kernelFamilies) bsd; }; }; };

    Darwin       = { kernel = kernels.darwin; };
    Linux        = { kernel = kernels.linux; };
    SunOS        = { kernel = kernels.solaris; };
    FreeBSD      = { kernel = kernels.freebsd; };
    NetBSD       = { kernel = kernels.netbsd; };
    OpenBSD      = { kernel = kernels.openbsd; };
    Windows      = { kernel = kernels.windows; };
    Cygwin       = { kernel = kernels.windows; abi = abis.cygnus; };
    MinGW        = { kernel = kernels.windows; abi = abis.gnu; };

    Arm32        = recursiveUpdate patterns.Arm patterns."32bit";
    Arm64        = recursiveUpdate patterns.Arm patterns."64bit";

  };

  predicates = mapAttrs'
    (name: value: nameValuePair ("is" + name) (matchAttrs value))
    patterns;
}