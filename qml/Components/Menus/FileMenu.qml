import QtQuick
import QtQuick.Controls

import "../Actions/Application"
import "../Actions/Document"
import "../Actions/File"

Menu {
    id: control

    title: qsTr("&File")

    NewFileAction {
        id: actionNew
    }
    OpenFileAction {
        id: actionOpen
    }
    SaveFileAction {
        id: actionSave
    }
    SaveAsFileAction {
        id: actionSaveAs
    }

    MenuSeparator {}

    PageSetupAction {
        id: actionPageSetup
    }

    PrintAction {
        id: actionPrint
    }

    MenuSeparator {}

    ExitAction {
        id: actionExit
    }
}