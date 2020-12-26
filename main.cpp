#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>
#include <QClipboard>
#include <QDir>
#include <QFontDatabase>
#include <QLocale>
#include <QTranslator>
#include <stdio.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QTranslator translator;
    if (translator.load(QLocale(), QLatin1String("GridcoinWalletGUI"), QLatin1String("_"), QLatin1String(":/translations"))) {
        app.installTranslator(&translator);
    } else {
        qDebug() << "cannot load translator " << QLocale::system().name() << " check content of translations.qrc";
    }

    //Load SF Pro Text font
    QDir dir{":/resources/fonts/SF Pro Text/"};
    for (auto file : dir.entryList(QDir::Files))
    {
        QFontDatabase::addApplicationFont(":/resources/fonts/SF Pro Text/" + file);
    }
    QFont font = QFont("SF Pro Text");
    font.setPixelSize(12);
    app.setFont(font);


    QQmlApplicationEngine engine;
    engine.addImportPath(":/plugins/");
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

