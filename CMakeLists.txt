cmake_minimum_required (VERSION 3.16)

include(pico_sdk_import.cmake)

project(project_template)

pico_sdk_init()

#This creates an executable target "blink" from a single source file blink.c
add_executable(test test.c)


#Generates different file formats such as .uf2 .elf .bin
pico_add_extra_outputs(test)

#Specifies libraries - flags to use when linking a given target
target_link_libraries(test pico_stdlib)
