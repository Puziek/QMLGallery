import QtQuick 2.7
import QtQml.Models 2.2
import QmlGallery 1.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    anchors.centerIn: parent
    color: "black"

    property variant model

    GridView {
        id: gridImageGallery
        model: root.model

        property bool selectionMode: false
        property int dragItemIndex: -1

        onSelectionModeChanged: { root.model.deselectAll() }
        anchors.fill: root
        delegate: ImageDelegate {
            imagePath: source
            onClicked: {
                if (!gridImageGallery.selectionMode) {
                    contentView.imagePath = imagePath
                    contentView.currentIdx = index
                    if (stackView.depth >= 2) {          // WORST WORKAROUND EVER :(
                        stackView.pop()
                        stackView.push(contentView)
                    }
                    else {
                        stackView.push(contentView)
                    }
                }
                else
                    imageGalleryModel.selectImage(index)
            }
            onDoubleClicked: {
                gridImageGallery.selectionMode = !gridImageGallery.selectionMode
                controlExpandingPanel.show()
            }
        }
        cellHeight: 150
        cellWidth: 150
    }

    OpacityMask {
        height: 100
        width: parent.width
        anchors.bottom: parent.bottom
        maskSource: Image {
            anchors.fill: parent
            source: "/Resources/bottomMask.png"
        }
    }

    ContentView {
        id: contentView
        visible: false
    }

    ExpandingPanel {
        id: controlExpandingPanel
        anchorTopHidden: root.bottom
        anchorBottomHidden: undefined
        anchorTopExpanded: undefined
        anchorBottomExpanded: root.bottom
        height: 96

        Rectangle {
            anchors.fill: controlExpandingPanel
            color: "transparent"

            Row {
                anchors.fill: parent

                MenuBarButton {

                    width: controlExpandingPanel.width / 2
                    height: controlExpandingPanel.height
                    imgSource: "/Resources/photos-favs-ico-large.png"

                    DropArea {
                        id: dropAreaAddFav
                        anchors.fill: parent
                        onDropped: {
                            gridImageGallery.model.addToFav(gridImageGallery.dragItemIndex);
                            gridImageGallery.dragItemIndex = -1;
                        }
                    }
                }

                MenuBarButton {

                    width: controlExpandingPanel.width / 2
                    height: controlExpandingPanel.height
                    imgSource: "/Resources/photos-delete-ico-large.png"

                    DropArea {
                        id: dropAreaDelete
                        anchors.fill: parent
                        onDropped: {
                            gridImageGallery.model.remove(gridImageGallery.dragItemIndex);
                            gridImageGallery.dragItemIndex = -1;
                        }
                    }
                }
            }
        }
    }
}
