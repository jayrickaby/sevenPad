import QtQuick
import QtQuick.Controls

import "../Actions/Application"

Menu {
    id: control

    title: qsTr("&Help")

    ViewHelpAction {
        id: actionViewHelp
    }

    MenuSeparator{}

    AboutNotepadAction {
        id: actionAboutNotepad
    }
}