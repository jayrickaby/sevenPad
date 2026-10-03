import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
    id: control

    RowLayout {
        // Spacer
        anchors.fill: parent

        Item {
            Layout.preferredWidth: control.width * 0.75
        }

        ToolSeparator {}

        Label {
            id: labelCursorStartPos

            Layout.fillWidth: true

            // TODO: Match to current cursor start position
            text: "Ln 1, Col 1"
        }
    }
}