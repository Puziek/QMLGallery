import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QmlGalleryModel 1.0

ApplicationWindow {

    visible: true
    width: 1366
    height: 768
    title: qsTr("PuzLLery")

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"

        GalleryModel {
            id: galleryModel
        }

        TabView
        {
            id: tabView
            anchors.fill: background

            Tab {
                title: "All photos"
                GridGallery {
                    id: gridGallery
                    anchors.fill: parent
                    contentView: mainContentView
                    viewModel: galleryModel
                }
            }
            Tab { title: "Albums" }
            Tab { title: "Favorites" }
            Tab { title: "Dick knows" }

            style: TabViewStyle {
                tab: TabButton {
                    implicitWidth: background.width / tabView.count
                    normalImage: "/Resources/PhotosTabNormal.png"
                    selectedImage: "/Resources/PhotosTabSelected.png"
                }
                frame: Rectangle { color: "black" }
            }
        }

        ContentView {
            id: mainContentView
            anchors.fill: background
            enabled: false
            viewModel: galleryModel
        }
    }
}
