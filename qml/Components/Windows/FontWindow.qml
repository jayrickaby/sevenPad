import QtQuick
import QtQuick.Controls

import "../Controls"

Window {
    id: root

    maximumWidth: width
    maximumHeight: height

    minimumWidth: width
    minimumHeight: height

    title: "Font"

    flags: Qt.Dialog

    SimpleComboBox {
        id: fontSelector

        width: 200

        title: qsTr("&Font:")
        model: Qt.fontFamilies()
    }
}