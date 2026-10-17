import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

Action {
    id: action

    text: qsTr("&Status Bar")

    enabled: !Document.wordWrapped

    checked: Document.wordWrapped ? false : Document.showStatusBar
    checkable: true

    onCheckedChanged: (checked) => {
        // Only update if wordWrap isnt overriding
        if (!Document.wordWrapped) {
            Document.showStatusBar = checked;
        }
    }
}