-- 定义一个包含所有源文件的变量
-- set project
set_project("MyTinySTL")
set_version("2.0.0")

-- 设置构建类型
add_rules("mode.debug", "mode.release")

-- 设置xmake 最小版本
set_xmakever("2.7.3")

--设置公共flags
set_languages("c++17")
set_warnings("more")

-- 判断编译器类型，并设置相应的编译选项
if is_plat("linux") or is_plat("macosx") then 
    add_defines("LINUX_OR_MACOSX")
elseif is_plat("windows") then
    add_defines("WINDOWS")
end

-- 判断编译器类型，并设置相应的编译选项
if is_mode("debug") then
    add_defines("DEBUG")
    set_languages("cxx11")
    add_cxflags("-g")
else
    set_languages("cxx11")
    add_cxflags("-O2")
end

-- 判断编译器类型，并设置相应的编译选项
-- config debug level
-- one of (debug", "info", "warn", "error", off")
if is_mode("debug") then
    add_defines("DEBUG")
    add_cxflags("-g")
else
    set_optimize("fastest")
    add_cxflags("-O2")
end

-- 定义一个名为 demo 的项目
target("demo")           
    -- 设置编译语言为C++
    set_kind("binary")
    -- 添加源文件
    add_files("MyTinySTL/**.cpp")
    add_files("Test/**.cpp") 

