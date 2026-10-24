//
// Created by jay on 23/10/26
//

#ifndef SEVENPAD_FILEMANAGER_H_
#define SEVENPAD_FILEMANAGER_H_

#include <qqml.h>
#include <QFile>

class FileManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool currentFileModified MEMBER m_currentFileModified WRITE setCurrentFileModified NOTIFY currentFileModified)
    Q_PROPERTY(QByteArray currentFileText READ getCurrentFileText NOTIFY currentFilePathChanged)
    Q_PROPERTY(QString currentFilePath READ getCurrentFilePath WRITE setCurrentFilePath NOTIFY currentFilePathChanged)
    QML_SINGLETON
    QML_ELEMENT

signals:
    void currentFileModified();
    void currentFilePathChanged();

public:
    explicit FileManager(QObject *parent = nullptr);

    QByteArray getCurrentFileText();
    QString getCurrentFilePath();

    void resetCurrentFilePath();
    void setCurrentFileModified(bool state);
    void setCurrentFilePath(const QString& path);
    void saveToFile(const QString& path, const QByteArray& content);

public slots:
    void newFile();
    void openFile(const QString& path);
    void saveFile(const QByteArray& content);
    void saveAsFile(const QString& path, const QByteArray& content);

private:
    std::unique_ptr<QString> m_currentFilePath {nullptr};
    bool m_currentFileModified {false};
};

#endif // SEVENPAD_FILEMANAGER_H_
