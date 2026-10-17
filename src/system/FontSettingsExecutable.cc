//
// Created by jay on 17/10/2026.
//

#include "FontSettingsExecutable.h"

FontSettingsExecutable::FontSettingsExecutable(QObject *parent)
    : QObject(parent)
{}

QProcess FontSettingsExecutable::s_proc {};
QStringList FontSettingsExecutable::s_exec {findExecutable()};

QStringList FontSettingsExecutable::findExecutable() {
    QString kernel {QSysInfo::kernelType()};
    QString os {QSysInfo::productType()};
    QString ver {QSysInfo::productVersion()};

    if (os == "windows") {
        return {"control", "fonts"};
    }
    if (kernel == "linux" ) {
        QString desktop {QProcessEnvironment::systemEnvironment().value("XDG_CURRENT_DESKTOP").toLower()};

        if (desktop.contains("kde")) {
            return {"kcmshell6", "kcm_fontinst"};
        }
    }

    return {};
}

void FontSettingsExecutable::run() {
    if (s_exec.isEmpty()) {
        return;
    }
    s_proc.startDetached(s_exec[0], {s_exec[1]});
}
