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

	filter "system:linux or system:macosx" --- NOT Tested
		pic "On"		

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "Off"
