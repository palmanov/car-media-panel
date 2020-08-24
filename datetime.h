#ifndef DATETIME_H
#define DATETIME_H

#include <QObject>
#include <QTime>
#include <QVariant>

class QTimer;

class DateTime : public QObject
{
    Q_OBJECT
private:
    //Q_PROPERTY(qulonglong)

public:
    explicit DateTime(QObject *parent = nullptr);

    void setObject(QObject* _obj) {
        m_obj = _obj;
        m_obj->setProperty("text", QTime::currentTime().toString("h:mm AP"));
    }

signals:

private slots:
    void sendTime();

private:
    QObject* m_obj;

    QTimer *timer;
};

#endif // DATETIME_H
