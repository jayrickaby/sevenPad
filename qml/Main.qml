import QtQuick
import QtQuick.Controls

import "./Components"

ApplicationWindow {
    id: root

    // 3/4 of available screen  on first open
    // TODO: Save and restore on open
    width: 1440
    height: 762

    // TODO: Save and restore on open
    x: 50
    y: 50

    visible: true

    menuBar: NotepadMenuBar {
        id: menuBar
    }

    NotepadDocument {
        id: document

        anchors.fill: parent
    }

    footer: NotepadStatusBar {
        id: statusBar
    }
}