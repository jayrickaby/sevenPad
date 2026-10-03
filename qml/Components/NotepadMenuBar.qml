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
    FormatMenu {
        id: menuFormat
    }
    Menu {
        title: qsTr("&View")
    }
    Menu {
        title: qsTr("&Help")
    }
}