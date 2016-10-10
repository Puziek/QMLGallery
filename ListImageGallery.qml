import QtQuick 2.0

Rectangle {
    id: root
    anchors.top: parent.top
    color: "black"
    opacity: 0.5

    property variant model

    ListView {
        id: listImageGallery
        model: root.model
        anchors.fill: root
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        delegate: ImageDelegate { imagePath: source; hostView: tabView }
    }
}
