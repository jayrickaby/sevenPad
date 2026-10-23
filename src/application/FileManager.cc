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
QByteArray FileManager::getFileContents(const QString& path) {
    return {};
}

void FileManager::setCurrentFile(const QString& path) {
    if (*m_currentFile != path) {
        m_currentFile = std::make_unique<QString>(path);

        emit currentFileChanged();
    }
};

void FileManager::saveToFile(const QString& path, const QByteArray& content) {};

void FileManager::newFile() {};

void FileManager::openFile(const QString& path) {};

void FileManager::saveFile(const QByteArray& content) {};

void FileManager::saveAsFile(const QString& path, const QByteArray& content) {};
