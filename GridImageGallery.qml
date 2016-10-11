import QtQuick 2.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "black"

    property variant model

    GridView {
        id: gridImageGallery
        model: root.model
        anchors.fill: root
        delegate: ImageDelegate { imagePath: source; hostView: gridImageGallery }
        cellHeight: 160
        cellWidth: 160
    }

    ContentView {
        id: contentView
        visible: false
    }
}
