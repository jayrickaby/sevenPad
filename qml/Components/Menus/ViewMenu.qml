import QtQuick
import QtQuick.Controls

import "../Actions/Application"

Menu {
    id: control

    title: qsTr("&View")

    StatusBarAction {
        id: actionStatusBar
    }
}