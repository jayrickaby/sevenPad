cmake_minimum_required(VERSION 3.16)

project(sevenPad VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

find_package(Qt6 REQUIRED COMPONENTS
        Qml
        Quick
        QuickControls2
)

qt_standard_project_setup(REQUIRES 6.11.2)

add_executable(sevenPad src/main.cc)

qt_add_qml_module(sevenPad
        URI jayrickaby.sevenPad
        RESOURCE_PREFIX /
        QML_FILES
        qml/Main.qml
        qml/Components/Actions/Application/ExitAction.qml
        qml/Components/Actions/Document/PageSetupAction.qml
        qml/Components/Actions/Document/PrintAction.qml
        qml/Components/Actions/File/NewFileAction.qml
        qml/Components/Actions/File/OpenFileAction.qml
        qml/Components/Actions/File/SaveAsFileAction.qml
        qml/Components/Actions/File/SaveFileAction.qml
        qml/Components/Menus/FileMenu.qml
        qml/Components/NotepadMenuBar.qml
)

target_include_directories(sevenPad PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(sevenPad PROPERTIES
        #    MACOSX_BUNDLE_GUI_IDENTIFIER jayrickaby.sevenPad
        MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
        MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        MACOSX_BUNDLE TRUE
        WIN32_EXECUTABLE TRUE
)

target_link_libraries(sevenPad
        PRIVATE Qt6::Qml
        PRIVATE Qt6::Quick
        PRIVATE Qt6::QuickControls2
)

install(TARGETS sevenPad
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)