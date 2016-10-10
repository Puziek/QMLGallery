import QtQuick 2.0

Rectangle {
    id: root
    width: 640
    height: 480
    color: "transparent"

    property string imagePath

    Image {
        anchors.fill: root
        source: root.imagePath
    }
}
