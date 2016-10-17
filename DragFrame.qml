import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: root
    width: 125
    height: 125

    property var viewModel: undefined
    property var indexes: undefined
    property int count: 0

    function show() {
        visible = true
        indexes = root.viewModel.selectedIndexes()
    }

    Repeater {
        model: (root.count <= 3) ? root.count : 3

        Image {
            id: frame
            z: -index
            anchors.left: root.left
            anchors.bottom: root.bottom
            anchors.leftMargin: 0//index * 20
            anchors.bottomMargin: 0// index * 20
            width: 125
            height: 125
            source: "/Resources/photos-drag-frame.png"

            Image {
                anchors.centerIn: frame
                width: 100
                height: 100
                source: root.viewModel.sourceFromIndex(root.indexes[index])
                fillMode: Image.PreserveAspectCrop
            }

            states: [
                State {
                    when: root.visible
                    PropertyChanges {
                        target: frame
                        anchors.leftMargin: index * 20
                    }
                    PropertyChanges {
                        target: frame
                        anchors.bottomMargin: index * 20
                    }
                }
            ]
            transitions: [
                Transition {
                    PropertyAnimation {
                        target: frame
                        properties: "anchors.leftMargin, anchors.bottomMargin"
                        duration: 500
                        easing.type: Easing.OutQuart
                    }
                }
            ]
        }
    }

    Image {
        anchors.right: root.right
        anchors.bottom: root.bottom
        width: 47
        height: 47

        Label {
            anchors.centerIn: parent
            text: root.count
            color: "white"
        }

        source: "/Resources/photos-drag-count.png"
    }

    states: [
        State {
            name: "visible"
            when: visible
            PropertyChanges {
                target: root
                opacity: 1
            }
        },
        State {
            name: "hidden"
            when: !visible
            PropertyChanges {
                target: root
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation {
                target: root
                properties: "opacity"
                duration: 500
                easing.type: Easing.OutQuart
            }
        }
    ]
}
