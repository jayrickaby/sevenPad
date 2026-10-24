//
// Created by jay on 23/10/26
//

#include "FileManager.h"

FileManager::FileManager(QObject *parent)
: QObject(parent)
{}

QString FileManager::getCurrentFilePath() {
    if (m_currentFilePath.get()) {
        return *m_currentFilePath;
    }

    return "Untitled";
}

QByteArray FileManager::getCurrentFileText() {
    if (!m_currentFilePath.get()) {
        return {};
    }

    QFile text {*m_currentFilePath};

    if (!text.open({QIODeviceBase::ReadOnly})) {
        // TODO: Turn into overload of setCurrentFile
        m_currentFilePath = nullptr;
        emit currentFilePathChanged();
        return {};
    }

    return text.readAll();
}

void FileManager::setCurrentFilePath(const QString& path) {
    QString purePath = QUrl(path).toLocalFile();

    if (!m_currentFilePath.get() || *m_currentFilePath != purePath) {
        m_currentFilePath = std::make_unique<QString>(purePath);

        emit currentFilePathChanged();
    }
};

void FileManager::saveToFile(const QString& path, const QByteArray& content) {};

void FileManager::newFile() {};

void FileManager::openFile(const QString& path) {};

void FileManager::saveFile(const QByteArray& content) {};

void FileManager::saveAsFile(const QString& path, const QByteArray& content) {};
