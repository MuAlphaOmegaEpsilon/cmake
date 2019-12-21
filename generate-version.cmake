# Trigger generation of src/version.hpp everytime the git HEAD changes
if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/.git")
  message(FATAL_ERROR "Couldn't generate version.hpp file: .git repository was not found")
endif()

if(IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/.git") # The repository is cloned individually
	set(GIT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/.git")
else() # The repository is cloned as a git submodule
	execute_process(
	  COMMAND cut -d " " -f 2 .git
	  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	  OUTPUT_VARIABLE SUBMODULE_GIT_DIR
	  OUTPUT_STRIP_TRAILING_WHITESPACE)
    set(GIT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${SUBMODULE_GIT_DIR}")
endif()

message(STATUS "Git repository was found at ${GIT_DIR}")
execute_process(COMMAND touch ${CMAKE_CURRENT_SOURCE_DIR}/src/version.hpp)

# Add command that is triggered again every time the git HEAD changes
add_custom_command(
OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/src/version.hpp
COMMAND ${CMAKE_CURRENT_LIST_DIR}/generate-version.sh ${CMAKE_PROJECT_VERSION_MAJOR} ${CMAKE_PROJECT_VERSION_MINOR} ${CMAKE_PROJECT_VERSION_PATCH}
WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
DEPENDS ${GIT_DIR}/logs/HEAD
BYPRODUCTS src/version.hpp
VERBATIM)
