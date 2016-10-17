import QtQuick 2.0

Item {
    id: root
    state: "hidden"

    property string imageSource
    property variant viewModel: undefined

    function show() {
        state = (state == "hidden" ? "expanded" : "hidden")
        enabled = (enabled == false ? true : false)
    }

    Rectangle {
        id: image
        anchors.fill: root
        color: "black"

        Image {
            id: content
            anchors.fill: image
            source: root.imageSource
            fillMode: Image.PreserveAspectFit
        }
    }

    MouseArea {
        id: contentViewMouseArea
        anchors.fill: root

        Timer {
            id: mouseTimer
            interval: 200
            onTriggered: {              // single click
                photosExpandingPanel.show()
                controlExpandingPanel.show()
            }
        }

        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                if(mouseTimer.running) {
                    show()              // double click
                    photosExpandingPanel.state = "hidden"
                    controlExpandingPanel.state = "hidden"
                    mouseTimer.stop()
                }
                else {
                    mouseTimer.restart()
                    mouse.accepted = false
                }
            }
        }
    }

    ExpandingPanel {
        id: photosExpandingPanel
        mouseArea: contentViewMouseArea
        anchorTopHidden: undefined
        anchorBottomHidden: root.top
        anchorTopExpanded: root.top
        anchorBottomExpanded: undefined

        Image {
            anchors.fill: photosExpandingPanel
            source: "/Resources/photodetails-navbg.png"
        }

        ListGallery {
            viewModel: root.viewModel
            anchors.fill: photosExpandingPanel
            onCurrentIndexChanged: {
                root.imageSource = source
            }
        }
    }

    ExpandingPanel {
        id: controlExpandingPanel
        mouseArea: contentViewMouseArea
        anchorTopHidden: root.bottom
        anchorBottomHidden: undefined
        anchorTopExpanded: undefined
        anchorBottomExpanded: root.bottom

        Image {
            anchors.bottom: controlExpandingPanel.bottom
            height: 85
            width: parent.width
            source: "/Resources/photos-bottommenu-bg.png"
        }
    }

    states: [
        State {
            name: "expanded"
            PropertyChanges {
                target: image
                opacity: 1
            }
        },
        State {
            name: "hidden"
            PropertyChanges {
                target: image
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            PropertyAnimation {
                target: image
                properties: "opacity"
                duration: 500
                easing.type: Easing.OutQuart
            }
        }
    ]
}
