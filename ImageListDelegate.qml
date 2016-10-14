import QtQuick 2.0
import QtQml.Models 2.2
import QmlGallery 1.0

Item {
    id: imageListDelegate

    width: 62
    height: 62

    signal clicked(int idx)

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
            imageListDelegate.clicked(index)
        }
    }
}
