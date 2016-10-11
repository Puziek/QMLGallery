import QtQuick 2.0

Rectangle {
    id: root
    color: "transparent"

    property string imagePath

    Image {
        anchors.fill: root
        source: root.imagePath
    }

    MouseArea {
        id: mouseArea
        anchors.fill: root
        hoverEnabled: true
        onClicked: {
            photosExpandingPanel.show()
            controlExpandingPanel.show()
        }
        onDoubleClicked: { stackView.pop() }

    }

    ExpandingPanel {
        id: photosExpandingPanel
        mouseArea: mouseArea
        anchorTopHidden: undefined
        anchorBottomHidden: root.top
        anchorTopExpanded: root.top
        anchorBottomExpanded: undefined

        ListImageGallery {
            anchors.fill: photosExpandingPanel
            opacity: 0.7
        }
    }

    ExpandingPanel {
        id: controlExpandingPanel
        mouseArea: mouseArea
        anchorTopHidden: root.bottom
        anchorBottomHidden: undefined
        anchorTopExpanded: undefined
        anchorBottomExpanded: root.bottom

        Rectangle {
            anchors.fill: controlExpandingPanel
            color: "black"
            opacity: 0.7
        }
    }

}
