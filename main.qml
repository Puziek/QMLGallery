import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQml.Models 2.2
import QmlGallery 1.0

ApplicationWindow {
    visible: true
    width: 1366
    height: 768
    title: qsTr("Hello World")
    color: "black"

    ImageGalleryModel {
        id: imageGalleryModel
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
                    implicitWidth: background.width / tabView.count
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

            delegate: StackViewDelegate {
                function transitionFinished(properties)
                {
                    properties.exitItem.opacity = 1
                }

                pushTransition: StackViewTransition {
                    PropertyAnimation {
                        target: enterItem
                        property: "opacity"
                        from: 0
                        to: 1
                    }
                    PropertyAnimation {
                        target: exitItem
                        property: "opacity"
                        from: 1
                        to: 0
                    }
                }
            }
        }
    }
}
