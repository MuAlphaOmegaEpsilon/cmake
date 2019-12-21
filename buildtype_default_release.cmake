# ----- Make the default build type be Release -----

IF (NOT CMAKE_BUILD_TYPE)
    SET (
        CMAKE_BUILD_TYPE
        Release
        CACHE
            STRING
            "Choose type of build: None Debug Release RelWithDebInfo MinSizeRel"
            FORCE)
ENDIF ()
