import QtQuick
import QtQuick.Controls

import "../Actions/Document"

Menu {
    id: control

    title: qsTr("F&ormat")

    WordWrapAction {
        id: actionWordwrap
    }
    FontAction {
        id: actionFont
    }
}