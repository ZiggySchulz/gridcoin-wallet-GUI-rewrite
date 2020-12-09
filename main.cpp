#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFont>
#include <QClipboard>
#include <QDir>
#include <QFontDatabase>

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);


    QGuiApplication app(argc, argv);

    //Load SF Pro Text font
    QDir dir{":/resources/fonts/SF Pro Text/"};
    for (auto file : dir.entryList(QDir::Files))
    {
        QFontDatabase::addApplicationFont(":/resources/fonts/SF Pro Text/" + file);
    }
    app.setFont(QFont("SF Pro Text"));

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

