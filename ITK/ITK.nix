{ stdenv, fetchurl, cmake }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "ITK";
  version = "4.10.0";
  src = fetchurl {
      url = "http://ufpr.dl.sourceforge.net/project/itk/itk/4.10/InsightToolkit-4.10.0.tar.xz";
      sha256 = "0pxijhqsnwcp9jv1d8p11hsj90k8ajpwxhrnn8kk8c56k7y1207a";
  };

  buildInputs = [
    cmake 
  ];

  cmakeFlags = [
    "-DModule_ITKDCMTK=ON"
    "-DModule_ITKIODCMTK=On"
  ]

  meta = {
    description = "Medical imaging processing library.";
    license = "ASL20";
    homepage = http://itk.org;
  };
}