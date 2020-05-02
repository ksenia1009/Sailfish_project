#ifndef QUADRATICEQUATION_H
#define QUADRATICEQUATION_H

#include <QObject>
#include <QList>
#include <QtMath>
#include <qmath.h>

class QuadraticEquation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double res1 READ getRes1 NOTIFY resChanged)
    Q_PROPERTY(double res2 READ getRes2 NOTIFY resChanged)
private:
    double x1;
    double x2;
public:
    Q_INVOKABLE QuadraticEquation() : QObject() { x1 = 0.0; x2 = 0.0; }

    double discriminant(double a, double b, double c) {
        return b * b - 4 * a * c;
    }

    Q_INVOKABLE void findRoots(double a, double b, double c) {
        if( discriminant(a, b, c) >= 0 ) {
            x1 = (-b + qSqrt(discriminant(a, b, c))) / (2 * a);
            x2 = (-b - qSqrt(discriminant(a, b, c))) / (2 * a);
        }
        emit resChanged();
    }

    double getRes1() {
        return x1;
    }

    double getRes2() {
        return x2;
    }
signals:
    void resChanged();
};

#endif // QUADRATICEQUATION_H
