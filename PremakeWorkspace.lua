workspace "Glad"
	startproject "Glad"

	platforms
	{
		"x86",
		"x64"
	}

	configurations
	{
		"Debug",
		"Release"
	}

	flags
	{
		"MultiProcessorCompile"
	}

project "Glad"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++20"
	staticruntime "Off"
	warnings      "Default"
	targetname    "glad"

	files
	{
		"include/glad/glad.h",
		"include/KHR/khrplatform.h",	

		"src/glad.c"
	}

	includedirs
	{
		"include/"
	}

	filter "system:linux or system:macosx" --- NOT Tested
		pic "On"

	filter "system:windows"
		systemversion "latest"
		targetdir     "bin/%{cfg.platform}/%{cfg.buildcfg}/"
		objdir        "bin/intermediates/%{cfg.platform}/%{cfg.buildcfg}/"

		filter { "system:windows", "platforms:x86" }
			architecture "x86"

		filter { "system:windows", "platforms:x64" }
			architecture "x86_64"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime  "Release"
		optimize "On"
		symbols  "Off"
