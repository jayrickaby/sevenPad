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

        wrapMode: Document.wordWrapped ? TextEdit.WordWrap : TextEdit.NoWrap
    }
}
