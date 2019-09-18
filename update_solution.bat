@echo off
setlocal EnableDelayedExpansion

rem Setup environment
call "%~dp0env.bat" %1 %2 %3

rem Define path to project file
set "PRJPATH=%~dp0\adm\msvc\%VCVER%"
set "SUFFIX=_RshShape"

rem Renaming and adding pdb for release configuration
for %%f in (%PRJPATH%\*.vcxproj); do (
	echo Renaming output and generating .pdb in release for project: %%f
	set filename=%%~nf
	
	rem renaming OCCProj.lib to OCCProj%SUFFIX%.lib in all projects
	for %%g in (%PRJPATH%\*.vcxproj); do gsar -s"!filename!.lib" -r"!filename!%SUFFIX%.lib" -o "%%g"
	
	rem renaming OCCProj.pdb and OCCProj.dll to OCCProj%SUFFIX%.pdb and OCCProj%SUFFIX%.dll in this project
	for %%e in (pdb dll); do gsar -s"!filename!.%%e" -r"!filename!%SUFFIX%.%%e" -o "%%f"
	
	rem adding new ProjectName in this project
	gsar -s"</ProjectGuid>:x0d:x0a  </PropertyGroup>" -r"</ProjectGuid>:x0d:x0a    <ProjectName>!filename!%SUFFIX%</ProjectName>:x0d:x0a  </PropertyGroup>" -o "%%f"
	
	rem adding pdb for release configuration
	gsar -i -s"<GenerateDebugInformation>No" -r"<GenerateDebugInformation>true" -o "%%f"
)

rem removing some projects from solution
for %%p in (DRAWEXE TKDCAF TKDraw TKIVtkDraw TKQADraw TKTObjDRAW TKTopTest TKViewerTest TKXDEDRAW TKXSDRAW TKIVtk); do (
	echo Removing project %%p from OCCT solution
	dotnet sln %PRJPATH%\OCCT.sln remove %PRJPATH%\%%p.vcxproj
)

pause
