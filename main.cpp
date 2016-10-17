#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <imagegallerymodel.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<ImageGalleryModel>("QmlGalleryModel", 1, 0, "GalleryModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
