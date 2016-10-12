import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQml.Models 2.2
import QmlGallery 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    color: "black"

    ImageGalleryModel {
        id: imageGalleryModel
    }

    /*ListModel {
        id: listGalleryModel
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo01.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo02.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo03.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo04.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo05.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo06.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo07.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo08.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo01.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo02.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo03.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo04.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo05.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo06.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo07.jpg"
        }
        ListElement
        {
            source: "file:///C:/Users/kamil.puzio/Desktop/resources/Photo08.jpg"
        }
    }*/

    ContentView {
        id: contentView
        visible: false
    }

    TabView
    {
        id: tabView

        Tab {
            title: "All photos"
            GridImageGallery { model: imageGalleryModel }
        }
        Tab { title: "Albums" }
        Tab { title: "Favorites" }
        Tab { title: "Dick knows" }

        style: TabViewStyle {
                frameOverlap: 1
                tab: FancyButton {
                    normalImage: "/Resources/PhotosTabNormal.png"
                    selectedImage: "/Resources/PhotosTabSelected.png"
                }
                frame: Rectangle { color: "transparent" }
            }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"

        StackView {
            id: stackView
            anchors.fill: background
            initialItem: tabView
        }
    }
}
