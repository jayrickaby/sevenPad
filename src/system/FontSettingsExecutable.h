//
// Created by jay on 17/10/2026.
//

#ifndef SEVENPAD_FONTSETTINGSEXECUTABLE_H_
#define SEVENPAD_FONTSETTINGSEXECUTABLE_H_

#include <qqml.h>
#include <QProcessEnvironment>
#include <QString>

class FontSettingsExecutable : public QObject {
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT
public:
    explicit FontSettingsExecutable(QObject *parent = nullptr);

public slots:
    void run();

private:
    static QStringList findExecutable();

    static QStringList s_exec;
    static QProcess s_proc;
};


#endif // SEVENPAD_FONTSETTINGSEXECUTABLE_H_
