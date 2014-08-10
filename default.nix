let
  windows32 = import <nixpkgs> {
#    system = "i686-linux"; # local system
    crossSystem = {
      config = "i686-w64-mingw32";
      arch = "x86";
      libc = "msvcrt";
      platform = {};
      openssl.system = "mingw";
    };
  };  

  engine2 = {stdenv, nasm, petool}: stdenv.mkDerivation rec {
    name = "dune2k";
    version = "1.1.1.1";

    nativeBuildInputs = [ nasm petool ];
    src = ./.;
    preBuild = "makeFlagsArray="
     + "(REV=${version}"
     + "  CP=cp"
     + "  CC=${stdenv.cross.config}-gcc"
     + "  WINDRES=${stdenv.cross.config}-windres"
     + ")";

    enableParallelBuilding = true;

    meta = with stdenv.lib; {
      homepage = http://github.com/cnc-patch/dune2k;
      description = "";
      # maintainers =
      license = map (builtins.getAttr "shortName") [ licenses.mit ];
      # Buildable on any platform, runable only on Windows
      platforms = stdenv.lib.platforms.all;
    };
  };
in windows32.callPackage engine2 {}
