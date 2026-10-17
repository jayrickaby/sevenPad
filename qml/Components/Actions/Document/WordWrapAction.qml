import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

Action {
    id: action

    text: qsTr("&Word Wrap")

    checked: Document.wordWrapped
    checkable: true

    onCheckedChanged: (checked) => {
        Document.wordWrapped = checked;
    }
}