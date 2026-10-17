import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

ScrollView {
    id: control

    TextArea {
        id: document

        width: DocumentStyling.wordWrapped ? control.availableWidth : implicitWidth

        font.family: DocumentStyling.fontFamily
        font.pointSize: DocumentStyling.fontSize
        font.styleName: DocumentStyling.fontStyle

        wrapMode: DocumentStyling.wordWrapped ? TextEdit.WordWrap : TextEdit.NoWrap
    }
}
