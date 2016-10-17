import QtQuick 2.0

Item {
    id: root

    property string imageSource: source

    signal clicked(int idx)

    Image {
        id: image
        anchors.centerIn: root

        width: 48
        height: 48
        fillMode: Image.PreserveAspectCrop
        source: imageSource
    }

    MouseArea {
        id: mouseArea
        anchors.fill: image
        hoverEnabled: true

        onClicked: {
            root.clicked(index)
        }
    }

    states: [
        State {
            name: "active"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: image
                scale: 1.05
            }
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation {
                target: image
                properties: "scale"
                duration: 1000
                easing.type: Easing.OutQuart
            }
        }
    ]
}
