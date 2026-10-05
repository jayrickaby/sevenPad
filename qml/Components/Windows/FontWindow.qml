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

        model: DocumentStyling.getAvailableFonts()

        title: qsTr("&Font:")
    }
}