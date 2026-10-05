//
// Created by jay on 04/10/2026.
//

#ifndef SEVENPAD_DOCUMENTSTYLING_H_
#define SEVENPAD_DOCUMENTSTYLING_H_

#include <qqml.h>
#include <QFontDatabase>


class DocumentStyling : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString font MEMBER m_font WRITE setFont NOTIFY fontChanged)
    Q_PROPERTY(QString fontStyle MEMBER m_fontStyle WRITE setFontStyle NOTIFY fontStyleChanged)
    Q_PROPERTY(uint fontSize MEMBER m_fontSize WRITE setFontSize NOTIFY fontSizeChanged)
    QML_SINGLETON
    QML_ELEMENT

signals:
    void fontChanged();
    void fontStyleChanged();
    void fontSizeChanged();

public:
    explicit DocumentStyling(QObject *parent = nullptr);

    void setFont(const QString& string);
    void setFontStyle(const QString& string);
    void setFontSize(uint size);

public slots:
    QStringList getAvailableFonts();
    QStringList getAvailableStyles();
    QList<uint> getAvailableSizes();

    QString getDefaultFont(enum QFontDatabase::SystemFont type = QFontDatabase::GeneralFont);

private:
    QString m_font;
    QString m_fontStyle;
    uint m_fontSize;

};


#endif // SEVENPAD_DOCUMENTSTYLING_H_
