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
        fillMode: Image.PreserveAspectCrop
        source: imagePath
        anchors.centerIn: imageDelegate
    }

    MouseArea {
        id: mouseArea
        anchors.fill: content
        hoverEnabled: true
        onClicked: {
            if (hostView !== undefined) {
                contentView.imagePath = imagePath
                if (stackView.depth >= 2) {          // WORST WORKAROUND EVER :(
                    stackView.pop()
                    stackView.push({item: contentView, immediate: true})
                }
                else {
                    stackView.push(contentView)
                }
            }
        }
    }

    states: [
        State {
            name: "active"
            when: mouseArea.containsMouse
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
