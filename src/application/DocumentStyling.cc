//
// Created by jay on 04/10/2026.
//

#include "DocumentStyling.h"

DocumentStyling::DocumentStyling(QObject *parent)
: QObject(parent),
  m_fontSize(10),
  m_font(getDefaultFont())
{}

QStringList DocumentStyling::getAvailableFonts() {
    return QFontDatabase::families();
}

QStringList DocumentStyling::getAvailableStyles() {
    return QFontDatabase::styles(m_font);
}

QList<uint> DocumentStyling::getAvailableSizes() {
    // TODO: Is there a default for this?
    return {8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 36, 48, 72};
}

QString DocumentStyling::getDefaultFont(QFontDatabase::SystemFont type) {
    // TODO: Check stored default font if allowing user to customise this
    return QFontDatabase::systemFont(type).toString();
}

void DocumentStyling::setFont(const QString &string) {
    m_font = string;

    emit fontChanged();
}

void DocumentStyling::setFontStyle(const QString &string) {
    m_fontStyle = string;

    emit fontStyleChanged();
}

void DocumentStyling::setFontSize(uint size) {
    m_fontSize = size;

    emit fontSizeChanged();
}
