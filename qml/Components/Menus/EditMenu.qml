import QtQuick
import QtQuick.Controls

import "../Actions/Document"

Menu {
    id: control

    title: qsTr("&Edit")

    UndoAction {
        id: actionUndo
    }

    MenuSeparator {}

    CutAction {
        id: actionCut
    }

    CopyAction {
        id: actionCopy
    }

    PasteAction {
        id: actionPaste
    }

    DeleteAction {
        id: actionDelete
    }

    MenuSeparator {}

    FindAction {
        id: actionFind
    }

    FindNextAction {
        id: actionFindNext
    }

    ReplaceAction {
        id: actionReplace
    }

    GoToAction {
        id: actionGoTo
    }

    MenuSeparator {}

    SelectAllAction {
        id: actionSelectAll
    }

    TimeDateAction {
        id: actionTimeDate
    }
}