//
// Created by jay on 04/10/2026.
//

#ifndef SEVENPAD_DOCUMENT_H_
#define SEVENPAD_DOCUMENT_H_

#include <qqml.h>
#include <QFontDatabase>


class Document : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool wordWrapped MEMBER m_wordWrapped WRITE setWordWrapped NOTIFY wordWrappedChanged)
    Q_PROPERTY(int fontSize MEMBER m_fontSize WRITE setFontSize NOTIFY fontSizeChanged)
    Q_PROPERTY(QString fontFamily MEMBER m_fontFamily WRITE setFontFamily NOTIFY fontFamilyChanged)
    Q_PROPERTY(QString fontScript MEMBER m_fontScript WRITE setFontScript NOTIFY fontScriptChanged)
    Q_PROPERTY(QString fontStyle MEMBER m_fontStyle WRITE setFontStyle NOTIFY fontStyleChanged)
    QML_SINGLETON
    QML_ELEMENT

signals:
    void fontFamilyChanged();
    void fontScriptChanged();
    void fontSizeChanged();
    void fontStyleChanged();
    void wordWrappedChanged();

public:
    explicit Document(QObject *parent = nullptr);

    void setFontFamily(const QString& family);
    void setFontScript(const QString& script);
    void setFontSize(int size);
    void setFontStyle(const QString& style);
    void setWordWrapped(bool wrapped);

public slots:
    QList<int> getFontSizes(const QString& family, const QString& style);
    QString getDefaultFontFamily(enum QFontDatabase::SystemFont type = QFontDatabase::GeneralFont);
    QString getDefaultStyle();
    QStringList getFontFamilies();
    QStringList getFontScripts(const QString& family);
    QStringList getFontStyles(const QString& family);

private:
    bool m_wordWrapped {false};
    int m_fontSize;
    QString m_fontFamily;
    QString m_fontScript;
    QString m_fontStyle;
};


#endif // SEVENPAD_DOCUMENT_H_
