import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: root
    anchors.fill: parent

    property variant viewModel: undefined
    signal currentIndexChanged(string source)

    ListView {
        id: listGallery

        property real velocity: 400

        model: root.viewModel
        currentIndex: root.viewModel.currentIndex
        anchors.fill: root
        orientation: ListView.Horizontal
        highlight: highlight
        highlightMoveVelocity: velocity

        delegate: ListGalleryDelegate {
            width: 62
            height: 62

            opacity: ListView.isCurrentItem ? 1 : 0.5
            onClicked: {
                listGallery.velocity = Math.abs((index - root.viewModel.currentIndex) / 0.05) * 20
                root.viewModel.currentIndex = index
                root.currentIndexChanged(source)
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
