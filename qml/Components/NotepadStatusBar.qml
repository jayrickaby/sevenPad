import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import jayrickaby.sevenPad

ToolBar {
    id: control

    property list<int> cursor2dPosition: Document.cursor2dPosition

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
            text: `Ln ${cursor2dPosition[0]}, Col ${cursor2dPosition[1]}`
        }
    }
}