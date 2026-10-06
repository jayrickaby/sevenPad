import QtQuick
import QtQuick.Controls

Label {
    function generateMnemonicHTML(rawText) {
        let result = ""

        let underlineChar = false;

        for (let i = 0; i < rawText.length; i++) {
            let char = rawText[i];

            if (char === "&") {
                char = "<u>"
                underlineChar = true;
            } else if (underlineChar) {
                char += "</u>";
                underlineChar = false;
            }

            result += char;
        }

        return result;
    }

    Component.onCompleted: {
        title = generateMnemonicHTML(title);
    }
}