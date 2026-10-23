import QtQuick
import QtQuick.Controls

Action {
    id: action

    property var dialog: null

    text: qsTr("&Open...")
    shortcut: StandardKey.Open

    onTriggered: {
        if (dialog) {
            dialog.open();
        }
    }
}
