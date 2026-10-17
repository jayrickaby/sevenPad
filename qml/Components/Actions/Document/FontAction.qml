import QtQuick
import QtQuick.Controls

Action {
    id: action

    text: qsTr("&Font...")

    onTriggered: root.openFontSelector()
}