import QtQuick 2.0

Item {
    id: root
    opacity: 0.6

    property string imgSource

    Behavior on opacity { NumberAnimation{} }

    Image {
        anchors.centerIn: parent
        source: root.imgSource
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }

    states: [
        State {
            name: "active"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: root
                opacity: 1
            }
        }
    ]
}
