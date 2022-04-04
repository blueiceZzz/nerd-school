## 	1. Setting 

- C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.30.30705\bin\Hostx64\x64\cl.exe
- Cusomize formatting in VSCode: https://stackoverflow.com/questions/45823734/visual-studio-code-formatting-for
- Compiler path: Compiler:C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.30.30705/bin/Hostx64/x64/cl.exe
- When you want to compile with cl.exe, open "Developer command prompt for VS 2022" -> cd /d "C:\0Workspace\Jobsuche\coding-interview" -> code . . In this way, the path and environment for cl.exe gets set correctly

## 2. Knowledge

- Determine OS: 
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32) && !defined(__CYGWIN__)
https://stackoverflow.com/questions/3213037/determine-if-linux-or-windows-in-c
- Lib (static lib) gets compiled and when included, also gets compiled into .exe. Dll(dynamic lib) does not get compiled in to .exe and gets called when the program runs, can be used by multiple programs at the same time 
https://stackoverflow.com/questions/913691/dll-and-lib-files-what-and-why
- When automating calling the exe, all the path are referenced to the WorkspaceFolder, but in code, relative paths are referenced to the location of the exe file https://stackoverflow.com/questions/8068921/how-to-use-fstream-objects-with-relative-path
- std::random_shuffle() is deprecated: https://stackoverflow.com/questions/6926433/how-to-shuffle-a-stdvector
- Vscode trying to find some weird file in d:/a01/_work/…{vcr}… : 
Map the path to your vc installation: 
"sourceFileMap": {
    "d:\agent\_work\4\s\src\vctools\crt\runtime\src": "C:\MyPath\To\VCRuntime\src"
}
https://github.com/microsoft/vscode-cpptools/issues/5637
- std::streambuf: https://en.cppreference.com/w/cpp/io/basic_streambuf
Tutorial save console log into string / file: http://www.cplusplus.com/forum/beginner/171317/
- Compilation and Linking process:
Three step process: (https://www.youtube.com/watch?v=3tIqpEmWMLI)
    • processing: evaluate #if, #pragma, #define (subsitute first keyword with the second #define iNteGer int), #include(paste file at this position) -> .cpp
    • Compilation: .cpp -> translation unit -> .obj file, binaries
    • Linking: combing .obj files to a binary, link all the codes and function calls together
Watch linking: How the C++ Linker Works