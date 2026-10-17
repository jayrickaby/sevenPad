import QtQuick
import QtQuick.Controls

Action {
    id: action

    property var window: null

    onTriggered: {
        if (window && window instanceof Window) {
            window.close()
        }
    }
}