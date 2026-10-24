import QtQuick
import QtQuick.Controls

Action {
    id: action

    property var dialog: null

    text: qsTr("Save &As...")

    onTriggered: {
        if (dialog) {
            dialog.open();
        }
    }
}
