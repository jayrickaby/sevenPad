import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

Action {
    id: action

    text: qsTr("&Word Wrap")

    checked: DocumentStyling.wordWrapped
    checkable: true

    onCheckedChanged: (checked) => {
        DocumentStyling.wordWrapped = checked;
    }
}