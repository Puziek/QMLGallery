import QtQuick 2.0

Rectangle {
    id: root

    width: parent.width
    height: 60
    state: "hidden"

    property variant mouseArea
    property variant anchorTopExpanded
    property variant anchorTopHidden
    property variant anchorBottomExpanded
    property variant anchorBottomHidden

    anchors.horizontalCenter: root.parent.horizontalCenter

    function show() {
        state = (state == "hidden" ? "expanded" : "hidden")
    }

    color: "transparent"

    states: [
        State {
            name: "expanded"
            AnchorChanges {
                target: root
                anchors.top: root.anchorTopExpanded
                anchors.bottom: root.anchorBottomExpanded
            }
            PropertyChanges {
                target: root
                opacity: 1
            }
        },
        State {
            name: "hidden"
            AnchorChanges {
                target: root
                anchors.top: root.anchorTopHidden
                anchors.bottom: root.anchorBottomHidden
            }
            PropertyChanges {
                target: root
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            AnchorAnimation {
                targets: root
                duration: 500
                easing.type: Easing.OutQuart
            }
            PropertyAnimation {
                target: root
                properties: "opacity"
                duration: 500
                easing.type: Easing.OutQuart
            }
        }
    ]
}
