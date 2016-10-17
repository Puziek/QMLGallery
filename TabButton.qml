import QtQuick 2.0
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    id: root

    implicitWidth: Math.max(text.width + 4, 150)
    implicitHeight: 50

    property string normalImage
    property string selectedImage

    Rectangle {
        id: background
        anchors.fill: root
        color: "black"
    }

    Image {
        id: imageNormal
        anchors.fill: parent
        source: root.normalImage


        states: State {
            name: "selected"
            when: styleData.selected
            PropertyChanges { target: imageNormal; opacity: 0}
            PropertyChanges { target: imageSelected; opacity: 1}
        }

        transitions: Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.OutQuart; duration: 500  }
        }
    }

    Image {
        id: imageSelected
        source:  root.selectedImage
        smooth: true
        opacity: 0
        anchors.fill: imageNormal

    }

    Label {
        id: text
        anchors.centerIn: parent
        text: styleData.title
        color: "white"
    }
}
