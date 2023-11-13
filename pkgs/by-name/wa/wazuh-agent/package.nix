{ lib, stdenv, fetchurl, dpkg, autoPatchelfHook}:

stdenv.mkDerivation rec {
  pname = "wazuh";
  version = "4.5.3";
  src = fetchurl {
    url = "https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.6.0-1_amd64.deb";
    hash = "sha256-BBPnWXhH88oUQ9XvCb/kRKaoZqXHlIejNKa+BX8scGM=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [ dpkg autoPatchelfHook ];

  unpackCmd = "dpkg -x $src $out";

  meta = with lib; {
    description = "IDS agent";
    homepage = "https://wazuh.com/";
    platforms = platforms.linux;
    sourceProvenance = with sourceTypes; [ binaryBytecode ];
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ mikaelfangel ];
  };
}
