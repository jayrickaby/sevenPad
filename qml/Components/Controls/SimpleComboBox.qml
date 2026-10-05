import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./"

Column {
    id: control

    property int currentIndex
    property string textRole
    property string title
    property var model

    Label {
        id: label
        text: control.title
    }

    TextField {
        id: input
        width: parent.width

    }
    ListView {
        id: view

        height: 140
        width: parent.width
        model: control.model
        currentIndex: root.currentIndex

        rightMargin: scrollBar.visible ? scrollBar.width : 0

        delegate: SimpleComboBoxDelegate {}

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
        }
    }
}

