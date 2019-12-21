# Make the default build type to be Release in case none was specified

if(NOT CMAKE_BUILD_TYPE OR CMAKE_BUILD_TYPE STREQUAL None)
  set(CMAKE_BUILD_TYPE
      Release
      CACHE STRING
            "Choose type of build: None Debug Release RelWithDebInfo MinSizeRel"
            FORCE)
endif()
