#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

int main(int argc, char *argv[])
{
    qputenv("QSG_RENDER_LOOP", "basic");
    QQuickWindow::setDefaultAlphaBuffer(true);

    QGuiApplication app(argc, argv);

    QQuickView view;
    view.setSource(QUrl("qrc:/Main.qml"));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setFlags(Qt::FramelessWindowHint);
    view.setColor(Qt::transparent);
    view.setMinimumSize(QSize(640, 480));
    view.show();

    return app.exec();
}
