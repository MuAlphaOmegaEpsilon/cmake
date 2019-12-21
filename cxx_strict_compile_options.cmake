# ----- Add stricter compile flags globally -----

IF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    ADD_COMPILE_OPTIONS (/Wall)
ELSE ()
    ADD_COMPILE_OPTIONS (
        -Wall
        -Wextra
        -Wpedantic
        -Wdouble-promotion
        -Wformat=2
        -Wformat-overflow=2
        -Wformat-signedness
        -Wformat-truncation=2
        -Wnull-dereference
        -Wimplicit-fallthrough=5
        -Wmisleading-indentation
        -Wmissing-include-dirs
        -Wparentheses
        -Wuninitialized
        -Winit-self
        -Wstrict-aliasing=1
        -Wstrict-overflow=5
        -Wstringop-overflow=4
        -Warray-bounds=2
        -Wtautological-compare
        -Wfloat-equal
        -Wshadow
        -Wvector-operation-performance
        -Weffc++
        -Wno-unknown-warning-option)
ENDIF ()
