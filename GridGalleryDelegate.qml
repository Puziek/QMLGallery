import QtQuick 2.0

Item {
    id: root

    property string imageSource: ""
    property bool selectionEnabled: false

    signal clicked(int idx)

    Image {
        id: image
        anchors.centerIn: root

        Behavior on opacity { NumberAnimation{} }

        width: root.width
        height: root.height
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
                scale: 1.1
                opacity: root.selectionEnabled ? (selected ? 1 : 0.5) : 1
            }
        },
        State {
            name: "selected"
            when: selected && root.selectionEnabled
            PropertyChanges {
                target: image
                opacity: 1
                scale: 1.05
            }
        },
        State {
            name: "unselected"
            when: !selected && root.selectionEnabled
            PropertyChanges {
                target: image
                opacity: 0.5
                scale: 1
            }
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation {
                target: image
                properties: "scale"
                duration: 500
                easing.type: Easing.OutQuart
            }
            PropertyAnimation {
                target: image
                properties: "opacity"
                duration: 500
                easing.type: Easing.OutQuart
            }
        }
    ]
}
