import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

ScrollView {
    id: control

    property alias text: document.text

    TextArea {
        id: document

        width: Document.wordWrapped ? control.availableWidth : implicitWidth

        font.family: Document.fontFamily
        font.pointSize: Document.fontSize
        font.styleName: Document.fontStyle

        // This weird padding I believe is due to Linux font rendering
        leftPadding: 3
        topPadding: 2
        rightPadding: 3
        bottomPadding: 2

        wrapMode: Document.wordWrapped ? TextEdit.WordWrap : TextEdit.NoWrap

        onCursorPositionChanged: {
            Document.cursorPosition = document.cursorPosition;
        }

        onTextChanged: {
            Document.text = document.text;
        }
        onTextEdited: {
            FileManager.currentFileModified = true;
        }

        Connections {
            target: FileManager
            function onCurrentFilePathChanged() {
                document.text = FileManager.currentFileText;
            }
        }
    }
}
