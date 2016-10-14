import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: root
    anchors.fill: parent

    property variant model
    property int currentIdx: -1
    //property int index: -1

    ListView {
        id: listImageGallery

        property real velocity: 400

        model: imageGalleryModel
        anchors.fill: root
        orientation: ListView.Horizontal
        currentIndex: currentIdx
        highlight: highlight
        highlightMoveVelocity: velocity

        delegate: ImageListDelegate {
            imagePath: source
            opacity: ListView.isCurrentItem ? 1 : 0.5
            onClicked: {
                listImageGallery.velocity = Math.abs((index - listImageGallery.currentIndex) / 0.05) * 20
                contentView.imagePath = imagePath
                listImageGallery.currentIndex = index
            }
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
