#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

#include <datetime.h>
#include <mediaplayer.h>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlComponent comp(&engine, QUrl(QStringLiteral("qrc:/main.qml")));

    DateTime datetime;
    MediaPlayer audioPlayer;

    QObject* pobj = comp.create();
    QObject* textButton;
    if (pobj) {
        textButton = pobj->findChild<QObject*>("timeText");

        if (textButton) {
            datetime.setObject(textButton);
        }
    }

    return app.exec();
}
