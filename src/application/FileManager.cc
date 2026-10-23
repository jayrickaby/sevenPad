//
// Created by jay on 23/10/26
//

#include "FileManager.h"

FileManager::FileManager(QObject *parent)
: QObject(parent)
{}

QString FileManager::getCurrentFile() {
    if (m_currentFile.get()) {
        return *m_currentFile;
    }

    return "Untitled";
}

QByteArray FileManager::getCurrentFileContents() {
    if (!m_currentFile.get()) {
        return {};
    }

    qDebug() << "reading contents of:" << *m_currentFile;

    QFile text {*m_currentFile};

    if (!text.open({QIODeviceBase::ReadOnly})) {
        qDebug() << "failed to read contents of:" << *m_currentFile;
        // TODO: Turn into overload of setCurrentFile
        m_currentFile = nullptr;
        emit currentFileChanged();
        return {};
    }

    qDebug() << "successfully read contents of:" << *m_currentFile;

    return text.readAll();
}

void FileManager::setCurrentFile(const QString& path) {
    QString purePath = QUrl(path).toLocalFile();

    if (!m_currentFile.get() || *m_currentFile != purePath) {
        m_currentFile = std::make_unique<QString>(purePath);

        emit currentFileChanged();
    }
};

void FileManager::saveToFile(const QString& path, const QByteArray& content) {};

void FileManager::newFile() {};

void FileManager::openFile(const QString& path) {};

void FileManager::saveFile(const QByteArray& content) {};

void FileManager::saveAsFile(const QString& path, const QByteArray& content) {};
