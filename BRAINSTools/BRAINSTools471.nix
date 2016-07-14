{ stdenv, fetchurl, cmake, git, cacert }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "BRAINSTools";
  version = "4.7.1";
  src = fetchurl {
      url = "https://github.com/BRAINSia/BRAINSTools/archive/v4.7.1.tar.gz";
      sha256 = "14vwaibybwd96wwmgy2l2v4sjkp1p1qzc0igwwdlj47n8328qyx4";
  };

  buildInputs = [
    cmake 
    git
  ];

  GIT_SSL_CAINFO = "${cacert}/etc/ssl/certs/ca-bundle.crt";

  installPhase = ''mkdir -p $out/bin; mkdir -p $out/lib; cp bin/* $out/bin; cp lib/* $out/lib;'';

  cmakeFlags = [
        "-DBRAINSTools_INSTALL_DEVELOPMENT=OFF"
        "-DBRAINSTools_MAX_TEST_LEVEL=0" 
        "-DBRAINSTools_USE_QT=OFF" 
        "-DBRAINS_DEBUG_IMAGE_WRITE=OFF"
        "-DBUILD_STYLE_UTILS=OFF"
        "-DBUILD_TESTING=OFF" 
        "-DBRAINSTools_USE_QT=OFF"
        "-DBRAINSTools_SUPERBUILD=ON "
        "-DEXTERNAL_PROJECT_BUILD_TYPE=Release "
        "-DFORCE_EXTERNAL_BUILDS=OFF "
        "-DITK_VERSION_MAJOR=4 "
        "-DSuperBuild_BRAINSTools_USE_CTKAPPLAUNCHER=OFF"
        "-DSuperBuild_BRAINSTools_USE_GIT_PROTOCOL=ON "
        "-DUSE_ANTS=OFF"
        "-DUSE_AutoWorkup=OFF "
        "-DUSE_BRAINSABC=OFF "
        "-DUSE_BRAINSConstellationDetector=OFF "
        "-DUSE_BRAINSContinuousClass=OFF "
        "-DUSE_BRAINSCreateLabelMapFromProbabilityMaps=OFF "
        "-DUSE_BRAINSCut=OFF "
        "-DUSE_BRAINSDWICleanup=OFF "
        "-DUSE_BRAINSDemonWarp=OFF "
        "-DUSE_BRAINSFit=OFF "
        "-DUSE_BRAINSInitializedControlPoints=OFF "
        "-DUSE_BRAINSLabelStats=OFF "
        "-DUSE_BRAINSLandmarkInitializer=OFF "
        "-DUSE_BRAINSMultiModeSegment=OFF "
        "-DUSE_BRAINSMultiSTAPLE=OFF "
        "-DUSE_BRAINSMush=OFF "
        "-DUSE_BRAINSPosteriorToContinuousClass=OFF "
        "-DUSE_BRAINSROIAuto=OFF "
        "-DUSE_BRAINSResample=OFF "
        "-DUSE_BRAINSSnapShotWriter=OFF "
        "-DUSE_BRAINSStripRotation=OFF "
        "-DUSE_BRAINSSurfaceTools=OFF "
        "-DUSE_BRAINSTalairach=OFF "
        "-DUSE_BRAINSTransformConvert=OFF "
        "-DUSE_ConvertBetweenFileFormats=ON "
        "-DUSE_DWIConvert=ON "
        "-DUSE_DebugImageViewer=OFF "
        "-DUSE_GTRACT=OFF "
        "-DUSE_ICCDEF=OFF "
        "-DUSE_ImageCalculator=OFF "
        "-DUSE_ReferenceAtlas=OFF "
        "-DUSE_SYSTEM_DCMTK=OFF "
        "-DUSE_SYSTEM_ITK=OFF "
        "-DUSE_SYSTEM_SlicerExecutionModel=OFF "
        "-DUSE_SYSTEM_VTK=OFF "
        "-DVTK_GIT_REPOSITORY=git://vtk.org/VTK.git"
  ];

  meta = {
    description = "Medical imaging processing software.";
    license = "ASL20";
    homepage = http://teem.sourceforge.net/index.html;
  };
}
