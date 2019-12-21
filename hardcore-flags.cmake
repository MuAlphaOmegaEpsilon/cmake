# Add stricter compile flags globally: this is not for the faint of heart. Just
# include this cmake file into your CMakeLists and the compilation flags will be
# automatically set for all targets.

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  set(HARDCORE_FLAGS /Wall)
else()
  # Warning options in common between clang and GCC
  set(HARDCORE_FLAGS
	-Wall                       # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wall
	#-Warray-bounds=3            # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Warray-bounds
	-Wcast-align=strict         # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wcast-align_003dstrict
	-Wcast-qual                 # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wcast-qual
	-Wconversion                # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wconversion
	-Wdate-time                 # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wdate-time
	-Wdisabled-optimization     # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wdisabled-optimization
	-Wdouble-promotion          # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wdouble-promotion
	-Wduplicated-branches       # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wno-duplicated-branches
	-Wduplicated-cond           # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wno-duplicated-cond
	-Weffc++                    # https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Dialect-Options.html#index-Weffc_002b_002b
	-Wextra                     # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wextra
	-Wfloat-equal               # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wfloat-equal
	-Wformat=2                  # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wformat
	-Winvalid-pch               # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Winvalid-pch
	-Wmissing-include-dirs      # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wmissing-include-dirs
	#-Wnrvo                      # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wnrvo
	-Wnull-dereference          # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wnull-dereference
	-Wpacked                    # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wpacked
	-Wpedantic                  # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-pedantic-1
	-Wredundant-decls           # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wredundant-decls
	-Wshadow                    # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wshadow
	-Wshift-overflow=2          # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wshift-overflow
	-Wstack-protector           # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wstack-protector
	-Wstrict-aliasing=1         # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wstrict-aliasing_003dn
	-Wstrict-overflow=5         # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wstrict-overflow
	-Wsuggest-attribute=const   # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wsuggest-attribute_003dpure
	-Wsuggest-attribute=format  # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wsuggest-attribute_003dformat
	-Wsuggest-attribute=pure    # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wsuggest-attribute_003dpure
	-Wswitch-default            # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wswitch-default
	-Wswitch-enum               # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wswitch-enum
	-Wvariadic-macros           # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wvariadic-macros
  )
  # GCC specific flags
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
	set(HARDCORE_FLAGS ${HARDCORE_FLAGS}
	  -Wformat-overflow=2         # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wformat-overflow
	  -Wformat-signedness         # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wformat-signedness
	  -Wformat-truncation=2       # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wformat-truncation
	  -Wstringop-overflow=4       # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wstringop-overflow
	  -Wunsafe-loop-optimizations # https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wunsafe-loop-optimizations
    )
  endif()
endif()
