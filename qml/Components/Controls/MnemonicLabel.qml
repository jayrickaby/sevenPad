import QtQuick
import QtQuick.Controls

Label {
    id: control
    function getMnemonicHTML(rawText) {
        let result = "";

        let underlineChar = false;

        for (let i = 0; i < rawText.length; i++) {
            let char = rawText[i];

            if (char === "&") {
                char = "<u>";
                underlineChar = true;
            } else if (underlineChar) {
                char += "</u>";
                underlineChar = false;
            }

            result += char;
        }

        return result;
    }

    function getMnemonicShortcut(rawText) {
        let result = "";

        for (let i = 0; i < rawText.length; i++) {
            let rawChar = rawText[i];

            if (rawChar !== "&") {
                continue;
            }

            if (i + 1 === rawText.length) {
                continue;
            }

            let char = rawText[i + 1].toUpperCase();

            result = `ALT+${char}`
        }

        return result;
    }

    property string shortcut: getMnemonicShortcut(rawText)
    property string rawText

    property var action: null

    // TODO: Should indefinitely show underlines only when alt is initially pressed
    text: getMnemonicHTML(rawText);

    Action {
        shortcut: control.shortcut

        onTriggered: {
            if (control.action && typeof control.action == "function") {
                control.action();
            }
        }
    }
}