import QtQuick
import QtQuick.Controls

MenuBar {
    id: control

    Menu {
        title: qsTr("&File")
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