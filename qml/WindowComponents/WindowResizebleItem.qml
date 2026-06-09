import QtQuick
import QtQuick.Window

Item {
    anchors.fill: parent

    property int handleSize: 4
    property int cornerSize: 10

    // Левый край
    MouseArea {
        width: handleSize
        height: parent.height
        anchors {
            left: parent.left
            top: parent.top
        }
        cursorShape: Qt.SizeHorCursor
        onPressed: Window.window.startSystemResize(Qt.LeftEdge)
    }

    // Правый край
    MouseArea {
        width: handleSize
        height: parent.height
        anchors {
            right: parent.right
            top: parent.top
        }
        cursorShape: Qt.SizeHorCursor
        onPressed: Window.window.startSystemResize(Qt.RightEdge)
    }

    // Верхний край
    MouseArea {
        width: parent.width
        height: handleSize
        anchors {
            left: parent.left
            top: parent.top
        }
        cursorShape: Qt.SizeVerCursor
        onPressed: Window.window.startSystemResize(Qt.TopEdge)
    }

    // Нижний край
    MouseArea {
        width: parent.width
        height: handleSize
        anchors {
            left: parent.left
            bottom: parent.bottom
        }
        cursorShape: Qt.SizeVerCursor
        onPressed: Window.window.startSystemResize(Qt.BottomEdge)
    }

    // 4 угла
    MouseArea {
        width: cornerSize
        height: cornerSize
        anchors {
            left: parent.left
            top: parent.top
        }
        cursorShape: Qt.SizeFDiagCursor
        onPressed: Window.window.startSystemResize(Qt.TopEdge | Qt.LeftEdge)
    }

    MouseArea {
        width: cornerSize
        height: cornerSize
        anchors {
            right: parent.right
            top: parent.top
        }
        cursorShape: Qt.SizeBDiagCursor
        onPressed: Window.window.startSystemResize(Qt.TopEdge | Qt.RightEdge)
    }

    MouseArea {
        width: cornerSize
        height: cornerSize
        anchors {
            left: parent.left
            bottom: parent.bottom
        }
        cursorShape: Qt.SizeBDiagCursor
        onPressed: Window.window.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
    }

    MouseArea {
        width: cornerSize
        height: cornerSize
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        cursorShape: Qt.SizeFDiagCursor
        onPressed: Window.window.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
    }
}
