#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
#include "systeminfo.h"
#include "settings.h"
#include <QTranslator>

int main(int argc, char *argv[])
{
    // 设置属性以启用高 DPI 缩放
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

    QApplication app(argc, argv);
    app.setWindowIcon(QIcon::fromTheme("utilities-system-monitor"));

    // 设置应用程序属性
    app.setOrganizationName("lingmo");
    app.setOrganizationDomain("lingmo.org");
    app.setApplicationName("lingmo-system-monitor");

    SystemInfo systemInfo;

    QTranslator translator;
    if (translator.load(QLocale::system(), "", "", ":/translations")) {
        app.installTranslator(&translator);
    }

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("systemInfo", &systemInfo);
    qmlRegisterType<SettingsManager>("Lingmo.SystemMonitor", 1, 0, "SettingsManager");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
} 