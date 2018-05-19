cmake_minimum_required ( VERSION 3.1 )
#########################################################################################
#
#   Library: Xna.Framework
#
#########################################################################################
project ( xna.framework VERSION 0.1.0 )

list ( APPEND SOURCE .lib/xna.framework/src/Input/Keys.vala )
list ( APPEND SOURCE .lib/xna.framework/src/Point.vala )
list ( APPEND SOURCE .lib/xna.framework/src/Rectangle.vala )
list ( APPEND SOURCE .lib/xna.framework/src/Vector2.vala )
list ( APPEND SOURCE .lib/xna.framework/src/Vector3.vala )
list ( APPEND SOURCE .lib/xna.framework/src/xna.vala )

list ( APPEND PACKAGE sdl2 )

## Export to the parent scope:

set ( VALA_SOURCES "${VALA_SOURCES};${SOURCE}" PARENT_SCOPE )
set ( PACKAGES "${PACKAGES};${PACKAGE}" PARENT_SCOPE )
set ( VALAC_OPTIONS "${VALAC_OPTIONS};--vapidir=${CMAKE_SOURCE_DIR}/.lib/xna.framework/src/SDL" PARENT_SCOPE )
set ( DEPS_LIBRARIES "${DEPS_LIBRARIES};-lSDL2_mixer -lSDL2_image -lSDL2_ttf" PARENT_SCOPE )

