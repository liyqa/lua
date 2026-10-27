call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

echo "build lua.exe"
move onelua.c windows
cl -c -nologo -O2 -Ob1 -Oi -Gs -MD *.c
link -link  -out:lua.exe -verbose:lib *.obj
del *.obj
move lua.c windows

echo "build liblua54.lib"
cl -c -nologo -W3 -O2 -Ob1 -Oi -Gs -MD *.c
link -lib -out:liblua54.lib -verbose:lib *.obj
del *.obj

echo "build lua54.dll"
cl -c -nologo -O2 -Ob1 -Oi -Gs -MD -DLUA_BUILD_AS_DLL *.c
link -link -dll -out:lua54.dll -verbose:lib *.obj
del *.obj lua54.exp

move windows\lua.c .
move windows\onelua.c .

move lua.exe      D:\Lua\bin
move lua54.dll    D:\Lua\bin
move lua54.lib    D:\Lua\lib
move liblua54.lib D:\Lua\lib
copy /y lauxlib.h D:\Lua\include
copy /y lua.h     D:\Lua\include
copy /y luaconf.h D:\Lua\include
copy /y lualib.h  D:\Lua\include