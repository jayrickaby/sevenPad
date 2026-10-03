cmake_minimum_required(VERSION 3.16)

project(sevenPad VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

find_package(Qt6 REQUIRED COMPONENTS
        Qml
        Quick
        QuickControls2
        Widgets
)

qt_standard_project_setup(REQUIRES 6.11.2)

add_executable(sevenPad src/main.cc)

qt_add_qml_module(sevenPad
        URI jayrickaby.sevenPad
        RESOURCE_PREFIX /
        QML_FILES
        qml/Main.qml
        qml/Components/Actions/Application/AboutNotepadAction.qml
        qml/Components/Actions/Application/ExitAction.qml
        qml/Components/Actions/Application/StatusBarAction.qml
        qml/Components/Actions/Application/ViewHelpAction.qml
        qml/Components/Actions/Document/CopyAction.qml
        qml/Components/Actions/Document/CutAction.qml
        qml/Components/Actions/Document/DeleteAction.qml
        qml/Components/Actions/Document/FontAction.qml
        qml/Components/Actions/Document/FindAction.qml
        qml/Components/Actions/Document/FindNextAction.qml
        qml/Components/Actions/Document/GoToAction.qml
        qml/Components/Actions/Document/DeleteAction.qml
        qml/Components/Actions/Document/PageSetupAction.qml
        qml/Components/Actions/Document/PasteAction.qml
        qml/Components/Actions/Document/PrintAction.qml
        qml/Components/Actions/Document/ReplaceAction.qml
        qml/Components/Actions/Document/SelectAllAction.qml
        qml/Components/Actions/Document/TimeDateAction.qml
        qml/Components/Actions/Document/UndoAction.qml
        qml/Components/Actions/Document/WordWrapAction.qml
        qml/Components/Actions/File/NewFileAction.qml
        qml/Components/Actions/File/OpenFileAction.qml
        qml/Components/Actions/File/SaveAsFileAction.qml
        qml/Components/Actions/File/SaveFileAction.qml
        qml/Components/Menus/EditMenu.qml
        qml/Components/Menus/FileMenu.qml
        qml/Components/Menus/FormatMenu.qml
        qml/Components/Menus/HelpMenu.qml
        qml/Components/Menus/ViewMenu.qml
        qml/Components/NotepadDocument.qml
        qml/Components/NotepadMenuBar.qml
        qml/Components/NotepadStatusBar.qml
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
        PRIVATE Qt6::Widgets
)

install(TARGETS sevenPad
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)