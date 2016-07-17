{ stdenv, fetchFromGitHub, cmake, ITK, SlicerExecutionModel }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "DWIConvert";
  version = "4.7.1";
  src = fetchFromGitHub {
      owner = "reckbo";
      name = pname;
      sha256 = "0pxijhqsnwcp9jv1d8p11hsj90k8ajpwxhrnn8kk8c56k7y1207a";
  };

  buildInputs = [
    cmake 
    git
  ];

  GIT_SSL_CAINFO = "${cacert}/etc/ssl/certs/ca-bundle.crt";

  cmakeFlags = [
      "-DModule_ITKDCMTK=ON"
      "-DModule_ITKIODCMTK=ON"
  ];

  meta = {
    description = "Medical imaging processing library.";
    license = "ASL20";
    homepage = http://itk.org;
  };
}
