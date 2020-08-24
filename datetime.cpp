#include "datetime.h"

#include <QDateTime>
#include <QTimer>
#include <QCoreApplication>
#include <QVariant>
#include <QDebug>

DateTime::DateTime(QObject *parent) : QObject(parent)
{
    timer = new QTimer;
    QObject::connect(timer, SIGNAL(timeout()), SLOT(sendTime()));
    timer->start(1000);
}

void DateTime::sendTime()
{
    m_obj->setProperty("text", QTime::currentTime().toString("h:mm AP"));
}
