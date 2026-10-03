import QtQuick
import QtQuick.Controls

import "./Components"

ApplicationWindow {
    id: root

    width: 480
    height: 270

    visible: true

    menuBar: NotepadMenuBar {}
}