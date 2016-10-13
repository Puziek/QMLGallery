import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: root
    anchors.fill: parent
    color: "transparent"

    property variant model
    property int currentIdx: -1
    //property int index: -1

    ListView {
        id: listImageGallery
        model: imageGalleryModel
        anchors.fill: root
        orientation: ListView.Horizontal
        currentIndex: currentIdx
        highlight: highlight

        delegate: ImageListDelegate {
            imagePath: source
            opacity: ListView.isCurrentItem ? 1 : 0.5
        }
    }

    Component {
        id: highlight
        Image {
            opacity: 0.8
            width: 62
            height: 62
            source: "/Resources/photodetails-nav-frame.png"
        }
    }
}
