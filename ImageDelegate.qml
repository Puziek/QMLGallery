import QtQuick 2.0
import QtQml.Models 2.2
import QmlGallery 1.0

Item {
    id: imageDelegate

    width: 140
    height: 140

    signal clicked(int idx)
    signal doubleClicked()
    signal dragged(int idx);

    property string imagePath

    function singleClick() {
        imageDelegate.clicked(index)
    }

    function doubleClick() {
        imageDelegate.doubleClicked()
    }

    Image {
        id: content
        Behavior on opacity { NumberAnimation{} }

        width: imageDelegate.width
        height: imageDelegate.height
        fillMode: Image.PreserveAspectCrop
        source: imagePath
        anchors.centerIn: imageDelegate

        Drag.active: mouseArea.drag.active
        Drag.hotSpot.x: content.width / 2
        Drag.hotSpot.y: content.height / 2
    }


    MouseArea {
        id: mouseArea
        anchors.fill: content
        hoverEnabled: true

        drag.target: content
        drag.onActiveChanged: {
            if (mouseArea.drag.active) {
                imageDelegate.dragged(index);
            }
            content.Drag.drop();
        }
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

    // Not the best way, introduce better encapsulation
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
            when: isSelected && !content.Drag.active && gridImageGallery.selectionMode
            PropertyChanges {
                target: content
                opacity: 1
            }
        },
        State {
            name: "unselected"
            when: !isSelected & !content.Drag.active && gridImageGallery.selectionMode
            PropertyChanges {
                target: content
                opacity: 0.5
            }
        },
        State {
            name: "dragged"
            when: content.Drag.active && isSelected && gridImageGallery.selectionMode
            ParentChange {
                target: content
                parent: gridImageGallery.parent
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
