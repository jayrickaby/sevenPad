import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

ScrollView {
    id: control

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

        Connections {
            target: FileManager
            function onCurrentFileChanged() {
                document.text = FileManager.currentFileText;
            }
        }
    }
}
