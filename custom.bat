@echo off

set "VCVER=vc14"
set "ARCH=64"
set "VCVARS=%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat"
set "CASDEB=i"
set "SHORTCUT_HEADERS=Copy"

set "THIRDPARTY=%SCRIPTROOT%/3rdParty"

rem Optional 3rd-parties switches
set HAVE_TBB=true

rem Additional headers search paths
set "CSF_OPT_INC=%THIRDPARTY%/freetype-2.5.5-vc14-64/include;%THIRDPARTY%/freeimage-3.17.0-vc14-64/include;%THIRDPARTY%/gl2ps-1.3.8-vc14-64/include;%THIRDPARTY%/ffmpeg-3.3-64/include;%THIRDPARTY%\tbb\include"

rem Additional libraries (64-bit) search paths
set "CSF_OPT_LIB64=%THIRDPARTY%/freetype-2.5.5-vc14-64/lib;%THIRDPARTY%/freeimage-3.17.0-vc14-64/lib;%THIRDPARTY%/gl2ps-1.3.8-vc14-64/lib;%THIRDPARTY%/ffmpeg-3.3-64/lib;%THIRDPARTY%\tbb\lib\Release_x64;%THIRDPARTY%\tbb\lib\Debug_x64"

rem Additional (64-bit) search paths
set "CSF_OPT_BIN64=%THIRDPARTY%/freetype-2.5.5-vc14-64/bin;%THIRDPARTY%/freeimage-3.17.0-vc14-64/bin;%THIRDPARTY%/gl2ps-1.3.8-vc14-64/bin;%THIRDPARTY%/ffmpeg-3.3-64/bin;%THIRDPARTY%\tbb\bin\Release_x64;%THIRDPARTY%\tbb\bin\Debug_x64"

