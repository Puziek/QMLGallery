import QtQuick 2.0

Item {
    id: root
    property bool active: false

    property string imgSource

    Behavior on opacity { NumberAnimation{} }

    Image {
        anchors.centerIn: parent
        source: root.imgSource
    }

    states: [
        State {
            name: "active"
            when: root.active
            PropertyChanges {
                target: root
                opacity: 1
            }
            PropertyChanges {
                target: root
                scale: 1.2
            }
        },
        State {
            name: "unactive"
            when: !root.active
            PropertyChanges {
                target: root
                opacity: 0.5
            }
            PropertyChanges {
                target: root
                scale: 1
            }
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation {
                target: root
                properties: "scale"
                duration: 500
                easing.type: Easing.OutQuart
            }
        }
    ]
}
