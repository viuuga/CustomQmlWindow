import QtQuick
import "qml/WindowComponents"

Rectangle {
    width: 640
    height: 480
    color: "Blue"

    radius: 8

    layer.enabled: true
    layer.samples: 8

    TopWindowToolbar {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    WindowResizebleItem {
        visible: (Window.window.visibility !== Window.Maximized)
    }
}
