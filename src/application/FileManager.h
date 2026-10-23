//
// Created by jay on 23/10/26
//

#ifndef SEVENPAD_FILEMANAGER_H_
#define SEVENPAD_FILEMANAGER_H_

#include <qqml.h>
#include <QFile>

class FileManager : public QObject {
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT

signals:
    void currentFileChanged();

public:
    explicit FileManager(QObject *parent = nullptr);

    QByteArray getFileContents(const QString& path);

    void setCurrentFile(const QString& path);
    void saveToFile(const QString& path, const QByteArray& content);

public slots:
    void newFile();
    void openFile(const QString& path);
    void saveFile(const QByteArray& content);
    void saveAsFile(const QString& path, const QByteArray& content);

private:
    QFile* m_currentFile {nullptr};
};

#endif // SEVENPAD_FILEMANAGER_H_
