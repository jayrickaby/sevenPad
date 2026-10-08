//
// Created by jay on 04/10/2026.
//

#include "DocumentStyling.h"

DocumentStyling::DocumentStyling(QObject *parent)
: QObject(parent),
  m_fontSize(10),
  m_fontFamily(getDefaultFontFamily())
{}

QStringList DocumentStyling::getFontFamilies() {
    return QFontDatabase::families();
}

QStringList DocumentStyling::getFontStyles(const QString& family) {
    // TODO: This is ordered in a specific way in Windows. Removes the need for getDefaultStyle()
    return QFontDatabase::styles(family);
}

QList<uint> DocumentStyling::getAvailableSizes() {
    // TODO: Is there a default for this?
    return {8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72};
}

QString DocumentStyling::getDefaultFontFamily(QFontDatabase::SystemFont type) {
    // TODO: Check stored default font if allowing user to customise this
    return QFontDatabase::systemFont(type).family();
}

void DocumentStyling::setFontFamily(const QString &family) {
    if (m_fontFamily != family) {
        m_fontFamily = family;

        emit fontFamilyChanged();
    }
}

void DocumentStyling::setFontStyle(const QString &style) {
    if (m_fontStyle != style) {
        m_fontStyle = style;

        emit fontStyleChanged();
    }
}

void DocumentStyling::setFontSize(uint size) {
    if (m_fontSize != size) {
        m_fontSize = size;

        emit fontSizeChanged();
    }
}

QString DocumentStyling::getDefaultStyle() {
    return "Regular";
}

QStringList DocumentStyling::getFontScripts(const QString &family) {
    QStringList scripts;
    for (const auto& script : QFontDatabase::writingSystems(family)) {
        scripts.append(QFontDatabase::writingSystemName(script));
    }
    
    return scripts;
}
