import QtQuick 2.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "transparent"

    property variant model

    ListView {
        id: listImageGallery
        model: imageGalleryModel
        anchors.fill: root
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        delegate: ImageDelegate { imagePath: source; hostView: tabView; width: 75; height: 75 }
    }
}
