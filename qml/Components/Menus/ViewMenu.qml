import QtQuick
import QtQuick.Controls

import "../Actions/Document"

Menu {
    id: control

    title: qsTr("&View")

    StatusBarAction {
        id: actionStatusBar
    }
}