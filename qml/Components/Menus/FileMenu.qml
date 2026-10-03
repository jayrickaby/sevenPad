import QtQuick
import QtQuick.Controls

import "../Actions"

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