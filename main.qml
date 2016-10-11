import QtQuick 2.7
import QtQuick.Controls 1.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    color: "black"

    ListModel {
        id: imageGalleryModel
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
    }

    TabView
    {
        id: tabView

        Tab {
            title: "GridView"
            GridImageGallery {
                model: imageGalleryModel
            }
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
