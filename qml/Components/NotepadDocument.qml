import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

ScrollView {
    id: control

    TextArea {
        id: document

        font.family: DocumentStyling.fontFamily
        font.pointSize: DocumentStyling.fontSize
        font.styleName: DocumentStyling.fontStyle

        wrapMode: DocumentStyling.wordWrapState ? TextEdit.WordWrap : TextEdit.NoWrap
    }
}
