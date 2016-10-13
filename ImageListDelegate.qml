import QtQuick 2.0
import QtQml.Models 2.2
import QmlGallery 1.0

Rectangle {
    id: imageListDelegate
    color: "transparent"

    width: 62
    height: 62

    property string imagePath

    Behavior on opacity { NumberAnimation{} }

    Image {
        id: content
        anchors.centerIn: imageListDelegate
        width: 50
        height: 50
        fillMode: Image.PreserveAspectCrop
        source: imagePath
    }

    MouseArea {
        id: mouseArea
        anchors.fill: content

        Timer {
            id: timer
            interval: 200
            onTriggered: singleClick()
        }
        onClicked: {
            contentView.imagePath = imagePath
            listImageGallery.currentIndex = index
        }
    }
}
