import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
    id: control

    RowLayout {
        // Spacer
        Item {
            Layout.fillWidth: true
            Layout.preferredWidth: control.width * 0.75
        }

        ToolSeparator {}

        Label {
            id: labelCursorStartPos

            // TODO: Match to current cursor start position
            text: "Ln 1, Col 1"
        }
    }
}