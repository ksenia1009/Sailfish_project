#include <sailfishapp.h>
#include <QGuiApplication>
#include "quadraticequation.h"

int main(int argc, char *argv[])
{
//    return SailfishApp::main(argc, argv);

    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView * view = SailfishApp::createView();
    view->setSource(SailfishApp::pathTo("qml/SpecialLab.qml"));
    qmlRegisterType<QuadraticEquation>("custom.QuadraticEquation", 1, 0, "QuadraticEquation");
    view->show();

    return app->exec();
}
