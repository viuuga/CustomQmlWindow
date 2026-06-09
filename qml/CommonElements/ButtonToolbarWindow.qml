import QtQuick
import "../../Constants"

Rectangle {
    id: buttonToolbarWindow

    readonly property real baseHeight: parent.height / 1.5

    height: {
        if (buttonToolbarWindowArea.pressed)
            return baseHeight * 1.3
        if (buttonToolbarWindowArea.containsMouse)
            return baseHeight * 1.2
        return baseHeight
    }
    width: height * 1.5

    radius: height / 4

    color: {
        if (buttonToolbarWindowArea.pressed)

            return Qt.darker(Colors.buttonToolbarWindowColor, 1.2)
        if (buttonToolbarWindowArea.containsMouse)
            return Qt.lighter(Colors.buttonToolbarWindowColor, 1.3)
        return Colors.buttonToolbarWindowColor
    }

    state: "closeWindowAction"

    states: [
        State {
            name: "closeWindowAction"
            PropertyChanges {
                target: buttonToolbarWindowArea
                onClicked: {
                    Window.window.close()
                }
            }
        },
        State {
            name: "minimizeWindowAction"
            PropertyChanges {
                target: buttonToolbarWindowArea
                onClicked: {
                    Window.window.showMinimized()
                }
            }
        },
        State {
            name: "maximizeWindowAction"
            PropertyChanges {
                target: buttonToolbarWindowArea
                onClicked: {
                    if (Window.window.visibility === Window.Maximized)
                        Window.window.showNormal()
                    else
                        Window.window.showMaximized()
                }
            }
        }
    ]

    MouseArea {
        id: buttonToolbarWindowArea
        anchors.fill: parent
        hoverEnabled: true
    }

    Behavior on height {
        NumberAnimation {
            duration: 150
            easing.type: Easing.OutQuad
        }
    }
}
