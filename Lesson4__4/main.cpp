#include <QApplication>
#include <QQmlApplicationEngine>
#include "descriptions.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Lesson4__4/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    qmlRegisterType<descriptions>("github.com.MileX0k", 1, 0, "Descriptions");
    engine.load(url);

    return app.exec();
}
