import QtQuick 2.0
import QtQuick.Controls 1.5
import QtGraphicalEffects 1.0
import QtQml.Models 2.2

Item {
    id: root

    property var contentView: undefined
    property variant viewModel: undefined
    property string currentImage: ""
    property bool selectionMode: false
    property bool dragOn: false

    function singleClick() {
        console.log("Single click in gridView")
        if (!selectionMode) {
            root.contentView.imageSource = currentImage
            root.contentView.show()
        }
    }

    function doubleClick() {
        root.selectionMode = root.selectionMode ? false : true
        controlExpandingPanel.show()
        root.viewModel.deselectAll()
        console.log("Selection mode on: " + selectionMode)
    }

    GridView {
        id: gridView
        anchors.fill: root
        model: root.viewModel

        cellWidth: 150
        cellHeight: 150

        delegate: GridGalleryDelegate {
            id: gridGalleryDelegate
            width: 140
            height: 140
            imageSource: source

            selectionEnabled: root.selectionMode

            onClicked: {
                if (!selectionEnabled) {
                    root.viewModel.currentIndex = index
                    root.currentImage = source
                    console.log("Current index: " + gridView.model.currentIndex)
                }
                else {
                    selected = !selected
                }
            }
        }
    }

    MouseArea {
        id: gridMouseArea
        anchors.fill: parent
        propagateComposedEvents: true

        Timer {
            id: mouseTimer
            interval: 200
            onTriggered: { singleClick(); }
        }

        onClicked: {
            if (mouse.button === Qt.LeftButton) {
                if(mouseTimer.running) {
                    doubleClick()
                    mouseTimer.stop()
                }
                else {
                    mouseTimer.restart()
                    mouse.accepted = false
                }
            }
        }

        onPressAndHold: {
            if (root.selectionMode && root.viewModel.selectedCount() > 0) {
                root.dragOn = true
                dragFrame.show()
                dragFrame.count = root.viewModel.selectedCount()
            }
        }

        onReleased: {
            if (root.dragOn === true) {
                root.dragOn = false
                dragFrame.visible = false
                if (dropFav.active) {
                    console.debug("Add to Fav: " + root.viewModel.selectedIndexes())
                    root.viewModel.deselectAll()
                }
                if (dropRemove.active) {
                    console.debug("Remove" + root.viewModel.selectedIndexes())
                    root.viewModel.removeSelected();
                }
            }
        }
    }

    OpacityMask {
        height: 100
        width: root.width
        anchors.bottom: root.bottom
        maskSource: Image {
            anchors.fill: parent
            source: "/Resources/bottomMask.png"
        }
    }

    ExpandingPanel {
        id: controlExpandingPanel
        anchorTopHidden: root.bottom
        anchorBottomHidden: undefined
        anchorTopExpanded: undefined
        anchorBottomExpanded: root.bottom
        height: 85

        Rectangle {
            anchors.fill: controlExpandingPanel
            color: "transparent"

            Row {
                anchors.fill: parent

                MenuBarButton {
                    id: favsBarButton
                    width: controlExpandingPanel.width / 2
                    height: controlExpandingPanel.height
                    imgSource: "/Resources/photos-favs-ico-large.png"
                    active: dropFav.active

                    Rectangle {
                        id: dropFav
                        anchors.fill: favsBarButton
                        color: "transparent"

                        property bool active: contains(mapFromItem(gridMouseArea, gridMouseArea.mouseX, gridMouseArea.mouseY))
                    }
                }

                MenuBarButton {
                    id: removeBarButton
                    width: controlExpandingPanel.width / 2
                    height: controlExpandingPanel.height
                    imgSource: "/Resources/photos-delete-ico-large.png"
                    active: dropRemove.active

                    Rectangle {
                        id: dropRemove
                        anchors.fill: removeBarButton
                        color: "transparent"

                        property bool active: contains(mapFromItem(gridMouseArea, gridMouseArea.mouseX, gridMouseArea.mouseY))
                    }
                }
            }
        }
    }

    DragFrame {
        id: dragFrame
        x: gridMouseArea.mouseX - 60
        y: gridMouseArea.mouseY - 60

        indexes: root.viewModel.selectedIndexes()
        viewModel: root.viewModel

        visible: false
        enabled: false
    }
}
