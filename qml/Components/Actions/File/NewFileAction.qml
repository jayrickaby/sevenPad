import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

Action {
    id: action

    text: qsTr("&New")
    shortcut: StandardKey.New

    onTriggered: {
        FileManager.newFile();
    }
}
