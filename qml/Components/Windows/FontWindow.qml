import QtQuick
import QtQuick.Controls

import jayrickaby.sevenPad

import "../Controls"

Window {
    id: control

    maximumWidth: width
    maximumHeight: height

    minimumWidth: width
    minimumHeight: height

    title: "Font"

    flags: Qt.Dialog

    SimpleComboBox {
        id: fontSelector

        width: 200

        currentIndex: findFirstMatch(DocumentStyling.font)

        delegate: SimpleComboBoxDelegate {
            font.family: modelData;
        }

        model: DocumentStyling.getAvailableFonts()

        title: qsTr("&Font:")

        onCurrentIndexChanged: {
            DocumentStyling.font = fontSelector.model[fontSelector.currentIndex];
        }
    }

    SimpleComboBox {
        id: styleSelector

        x: 250
        width: 200

        delegate: SimpleComboBoxDelegate {
            font.styleName: modelData;
        }

        model: DocumentStyling.getAvailableStyles();

        title: qsTr("Font St&yle:")
    }
}