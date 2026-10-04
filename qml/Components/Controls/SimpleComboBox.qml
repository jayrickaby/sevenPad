import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    id: control

    property string title
    property var model
    property string textRole
    property int currentIndex

    Label {
        id: label
        text: control.title
    }

    TextField {
        id: input
        width: parent.width

    }
    ScrollView {
        height: 140
        width: parent.width
        model: control.model

        delegate:  ItemDelegate {
            width: view.width
            text: modelData
        }
    }
}

