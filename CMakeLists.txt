cmake_minimum_required(VERSION 3.16)

project(MoneyApp2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appMoneyApp2
    main.cpp
)

qt_add_qml_module(appMoneyApp2
    URI MoneyApp2
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Screen01.ui.qml
        QML_FILES Page1.qml
        QML_FILES Page2.qml
        QML_FILES Page3.qml
        QML_FILES PopUpCategories.qml
        RESOURCES
            "fonts/Bangers-Regular.ttf"
            "fonts/ZenDots-Regular.ttf"
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_


# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMoneyApp2 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMoneyApp2
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appMoneyApp2
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appMoneyApp2
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
