import QtQuick 2.0
import QmlGallery 1.0

Item {
    id: root

    property string imagePath
    property int currentIdx: -1

    Image {
        id: content
        anchors.fill: root
        source: root.imagePath
    }

    onImagePathChanged:
        PropertyAnimation {
            target: content
            property: "opacity"
            from: 0
            to: 1
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

        Image {
            anchors.fill: photosExpandingPanel
            source: "/Resources/photodetails-navbg.png"
        }
            ListImageGallery {
                currentIdx: root.currentIdx
                anchors.fill: parent
            }
    }

    ExpandingPanel {
        id: controlExpandingPanel
        mouseArea: mouseArea
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

}
