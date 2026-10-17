//
// Created by jay on 04/10/2026.
//

#ifndef SEVENPAD_DOCUMENT_H_
#define SEVENPAD_DOCUMENT_H_

#include <qqml.h>
#include <QFontDatabase>
#include <QStringView>


class Document : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool wordWrapped MEMBER m_wordWrapped WRITE setWordWrapped NOTIFY wordWrappedChanged)
    Q_PROPERTY(int cursorPosition MEMBER m_cursorPosition WRITE setCursorPosition NOTIFY cursorPositionChanged)
    Q_PROPERTY(int fontSize MEMBER m_fontSize WRITE setFontSize NOTIFY fontSizeChanged)
    Q_PROPERTY(QList<int> cursor2dPosition READ getCursor2dPosition NOTIFY cursorPositionChanged)
    Q_PROPERTY(QString fontFamily MEMBER m_fontFamily WRITE setFontFamily NOTIFY fontFamilyChanged)
    Q_PROPERTY(QString fontScript MEMBER m_fontScript WRITE setFontScript NOTIFY fontScriptChanged)
    Q_PROPERTY(QString fontStyle MEMBER m_fontStyle WRITE setFontStyle NOTIFY fontStyleChanged)
    Q_PROPERTY(QString text MEMBER m_text WRITE setText NOTIFY textChanged)
    QML_SINGLETON
    QML_ELEMENT

signals:
    void cursorPositionChanged();
    void fontFamilyChanged();
    void fontScriptChanged();
    void fontSizeChanged();
    void fontStyleChanged();
    void textChanged();
    void wordWrappedChanged();

public:
    explicit Document(QObject *parent = nullptr);

    void setCursorPosition(int pos);
    void setFontFamily(const QString& family);
    void setFontScript(const QString& script);
    void setFontSize(int size);
    void setFontStyle(const QString& style);
    void setText(const QString& text);
    void setWordWrapped(bool wrapped);

public slots:
    QList<int> getCursor2dPosition();
    QList<int> getFontSizes(const QString& family, const QString& style);
    QString getDefaultFontFamily(enum QFontDatabase::SystemFont type = QFontDatabase::GeneralFont);
    QString getDefaultStyle();
    QStringList getFontFamilies();
    QStringList getFontScripts(const QString& family);
    QStringList getFontStyles(const QString& family);

private:
    bool m_wordWrapped {false};
    int m_cursorPosition {0};
    int m_fontSize;
    QString m_fontFamily;
    QString m_fontScript;
    QString m_fontStyle;
    QString m_text;
};


#endif // SEVENPAD_DOCUMENT_H_
