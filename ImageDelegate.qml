import QtQuick 2.0

Rectangle {
    id: imageDelegate
    color: "transparent"

    property variant hostView: undefined
    property bool isCurrentItem: hostView !== undefined && hostView.currentIndex === index && hostView.currentIndex !== -1

    width: 150
    height: 150

    property string imagePath

    Image {
        id: content
        width: imageDelegate.width
        height: imageDelegate.height
        source: imagePath
        anchors.centerIn: imageDelegate
    }

    MouseArea {
        id: mouseArea
        anchors.fill: content
        hoverEnabled: true
        onClicked: {
            if (hostView !== undefined) {
                hostView.currentIndex = index
            }
            var component = Qt.createComponent("ContentView.qml");
            component.createObject(imageDelegate)
            stackView.push(component.createObject(parent, {"imagePath": imageDelegate.imagePath}))
        }
    }

    states: [
        State {
            name: "active"
            when: mouseArea.containsMouse || imageDelegate.isCurrentItem
            PropertyChanges {
                target: content
                scale: 1.1
            }
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation {
                target: content
                properties: "scale"
                duration: 300
                easing.type: Easing.OutQuart
            }
        }
    ]
}
