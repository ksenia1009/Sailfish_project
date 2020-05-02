#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QMetaObject>
#include <QDebug>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ getCount WRITE setCount NOTIFY countChange)
private:
    int count;
public:
    Q_INVOKABLE Counter() : QObject() { count = 0; }

    Q_INVOKABLE void increment() {
        count++;
        emit countChange();
    }

    Q_INVOKABLE void reset() {
        count = 0;
        emit countChange();
    }

    int getCount() {
        return count;
    }

    void setCount(int _count) {
        count = _count;
//        emit countChange();
    }
signals:
    void countChange();
private slots:
    void print() {
        qDebug() << "Counter: " << count;
    }
};

#endif // COUNTER_H
