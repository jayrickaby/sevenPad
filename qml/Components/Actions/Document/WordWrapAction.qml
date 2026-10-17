import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

Action {
    id: action

    text: qsTr("&Word Wrap...")

    checked: DocumentStyling.wordWrapState
    checkable: true

    onCheckedChanged: (checked) => {
        DocumentStyling.wordWrapState = checked;
    }
}