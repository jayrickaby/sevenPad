import QtQuick
import QtQuick.Controls

import "./Menus"

MenuBar {
    id: control

    FileMenu {
        id: menuFile
    }
    EditMenu {
        id: menuEdit
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