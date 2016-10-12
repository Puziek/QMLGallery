import QtQuick 2.0
import QtQml.Models 2.2
import QmlGallery 1.0

Rectangle {
    id: imageDelegate
    color: "transparent"

    width: 150
    height: 150

    property string imagePath
    property bool selectable: false

    function singleClick() {
        if (!gridImageGallery.selectionMode || !selectable) {
            contentView.imagePath = imagePath
            if (stackView.depth >= 2) {          // WORST WORKAROUND EVER :(
                stackView.pop()
                stackView.push({item: contentView, immediate: true})
            }
            else {
                stackView.push(contentView)
            }
        }
        else
            imageGalleryModel.selectImage(index)
    }

    function doubleClick() {
        if (selectable) {
            gridImageGallery.selectionMode = !gridImageGallery.selectionMode
            controlExpandingPanel.show()
        }
    }

    Image {
        id: content

        Behavior on opacity { NumberAnimation{} }

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
        Timer {
            id: timer
            interval: 200
            onTriggered: singleClick()
        }
        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                if(timer.running) {
                    doubleClick()
                    timer.stop()
                }
                else
                    timer.restart()
            }
        }
    }

    states: [
        State {
            name: "active"
            when: mouseArea.containsMouse && !gridImageGallery.selectionMode
            PropertyChanges {
                target: content
                scale: 1.1
            }
        },
        State {
            name: "selected"
            when: isSelected && gridImageGallery.selectionMode
            PropertyChanges {
                target: content
                opacity: 1
            }
        },
        State {
            name: "unselected"
            when: !isSelected && gridImageGallery.selectionMode
            PropertyChanges {
                target: content
                opacity: 0.5
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
