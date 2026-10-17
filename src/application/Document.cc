//
// Created by jay on 04/10/2026.
//

#include "Document.h"

Document::Document(QObject *parent)
: QObject(parent),
  m_fontSize(10),
  m_fontFamily(getDefaultFontFamily())
{}

QStringList Document::getFontFamilies() {
    return QFontDatabase::families();
}

QStringList Document::getFontStyles(const QString& family) {
    // TODO: This is ordered in a specific way in Windows. Removes the need for getDefaultStyle()
    return QFontDatabase::styles(family);
}

QString Document::getDefaultFontFamily(QFontDatabase::SystemFont type) {
    // TODO: Check stored default font if allowing user to customise this
    return QFontDatabase::systemFont(type).family();
}

void Document::setFontFamily(const QString &family) {
    if (m_fontFamily != family) {
        m_fontFamily = family;

        emit fontFamilyChanged();
    }
}

void Document::setFontScript(const QString& script) {
    if (m_fontScript != script) {
        m_fontScript = script;

        emit fontScriptChanged();
    }
}

void Document::setFontStyle(const QString &style) {
    if (m_fontStyle != style) {
        m_fontStyle = style;

        emit fontStyleChanged();
    }
}

void Document::setFontSize(int size) {
    if (m_fontSize != size) {
        m_fontSize = size;

        emit fontSizeChanged();
    }
}

QString Document::getDefaultStyle() {
    return "Regular";
}

QStringList Document::getFontScripts(const QString &family) {
    QStringList scripts;
    for (const auto& script : QFontDatabase::writingSystems(family)) {
        scripts.append(QFontDatabase::writingSystemName(script));
    }
    
    return scripts;
}

QList<int> Document::getFontSizes(const QString &family, const QString &style) {
    QList<int> sizes {QFontDatabase::pointSizes(family, style)};

    if (sizes.isEmpty()) {
        return QFontDatabase::standardSizes();
    }

    return sizes;
}

void Document::setWordWrapped(bool wrapped) {
    if (m_wordWrapped != wrapped) {
        m_wordWrapped = wrapped;

        emit wordWrappedChanged();
    }
}

void Document::setCursorPosition(int pos) {
    if (m_cursorPosition != pos) {
        m_cursorPosition = pos;

        emit cursorPositionChanged();
    }
}

void Document::setText(const QString &text) {
    if (m_text != text) {
        m_text = text;

        emit textChanged();
    }
}
