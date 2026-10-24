//
// Created by jay on 23/10/26
//

#include "FileManager.h"

FileManager::FileManager(QObject *parent)
: QObject(parent)
{}

QString FileManager::getCurrentFileName() {
    if (m_currentFilePath.get()) {
        return QFileInfo(*m_currentFilePath).fileName();
    }

    return "Untitled";
}
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

    if (!text.open(QIODeviceBase::ReadOnly)) {
        resetCurrentFilePath();
        return {};
    }

    return text.readAll();
}

void FileManager::resetCurrentFilePath() {
    if (m_currentFilePath.get()) {
        m_currentFilePath = nullptr;

        setCurrentFileModified(false);

        emit currentFilePathChanged();
    }
}

void FileManager::setCurrentFileModified(bool state) {
    if (m_currentFileModified != state) {
        m_currentFileModified = state;

        emit currentFileModified();
    }
}
void FileManager::setCurrentFilePath(const QString& path) {
    QString purePath = QUrl(path).toLocalFile();

    if (!m_currentFilePath.get() || *m_currentFilePath != purePath) {
        m_currentFilePath = std::make_unique<QString>(purePath);

        setCurrentFileModified(false);

        emit currentFilePathChanged();
    }
};

void FileManager::saveToFile(const QString& path, const QByteArray& content) {
    QFile file {path};

    // Early return as we cannot save it
    if (!file.open(QIODeviceBase::WriteOnly)) {
        return;
    }

    // TODO: Handle the return value of write()
    file.write(content);
};

void FileManager::newFile() {
    resetCurrentFilePath();
};

void FileManager::openFile(const QString& path) {};

void FileManager::saveFile(const QByteArray& content) {};

void FileManager::saveAsFile(const QString& path, const QByteArray& content) {
    QString purePath = QUrl(path).toLocalFile();
    saveToFile(purePath, content);

    setCurrentFilePath(path);
};
