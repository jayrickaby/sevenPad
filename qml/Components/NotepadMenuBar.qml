import QtQuick
import QtQuick.Controls

import "./Menus"

MenuBar {
    id: control

    FileMenu {
        id: menuFile
    }
    Menu {
        title: qsTr("&Edit")
    }
    Menu {
        title: qsTr("F&ormat")
    }
    Menu {
        title: qsTr("&View")
    }
    Menu {
        title: qsTr("&Help")
    }
}