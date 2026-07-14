import QtQuick
import QtQuick.Window

import "../CommonElements"
import "../../Constants"

Rectangle {
    id: topWindowToolbar

    color: Colors.topToolbarColor

    topLeftRadius: parent.radius
    topRightRadius: parent.radius
    height: SizeConsts.windowTopToolbarHeight

    MouseArea {
        anchors.fill: parent
        onPressed: function (event) {
            Window.window.startSystemMove()
        }
    }

    Row {
        id: windowButtons

        spacing: 5
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom

            leftMargin: spacing
            rightMargin: spacing
        }

        Repeater {
            model: ["minimizeWindowAction", "maximizeWindowAction", "closeWindowAction"]

            Item {
                width: parent.parent.height
                height: parent.parent.height

                ButtonToolbarWindow {
                    anchors.centerIn: parent
                    state: modelData
                }
            }
        }
    }

    Text {
        text: StringConsts.title
        color: "black"
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter

        anchors {
            left: parent.left
            leftMargin: 10
        }

        height: parent.height
    }

    function hideButtons() {
        hideButtonsAnimation.start()
    }

    function showButtons() {
        showButtonsAnimation.start()
    }

    NumberAnimation {
        id: hideButtonsAnimation

        target: windowButtons
        property: "opacity"
        duration: 300
        easing.type: Easing.InOutQuad
        to: 0
    }

    NumberAnimation {
        id: showButtonsAnimation

        target: windowButtons
        property: "opacity"
        duration: 300
        easing.type: Easing.InOutQuad
        to: 1
    }
}
