#include "imagegallerymodel.h"
#include <QDebug>

ImageGalleryModel::ImageGalleryModel(QObject *parent) : QAbstractItemModel(parent)
{
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo01.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo02.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo03.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo04.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo05.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo06.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo07.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo08.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo09.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo10.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo11.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo12.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo13.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo14.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo15.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo16.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo01.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo02.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo03.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo04.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo05.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo06.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo07.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo08.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo09.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo10.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo11.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo12.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo13.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo14.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo15.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo16.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo01.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo02.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo03.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo04.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo05.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo06.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo07.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo08.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo09.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo10.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo11.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo12.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo13.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo14.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo15.jpg")));
    images.push_front(ImageDescriptor(QString("file:///C:/Users/kamil.puzio/Desktop/resources/Photo16.jpg")));
}

QVariant ImageGalleryModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < rowCount(index)) {
        switch (role) {
        case sourceRole:
            return images.at(index.row()).getSource();
        case selectedRole:
            return images.at(index.row()).getSelection();
        }
    }
    return QVariant();
}

int ImageGalleryModel::rowCount(const QModelIndex& /*parent*/) const
{
    return images.size();
}

QHash<int, QByteArray> ImageGalleryModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[sourceRole]= "source";
    roles[selectedRole] = "isSelected";
    return roles;
}

void ImageGalleryModel::selectImage(int index)
{
    qDebug() << index;
    images[index].changeSelection();
    emit dataChanged(createIndex(index, 0), createIndex(index, 0));
}

void ImageGalleryModel::remove(int index)
{
    images.removeAt(index);
    emit dataChanged(createIndex(0, 0), createIndex(images.count(), 0));
}

void ImageGalleryModel::deselectAll()
{
    for (ImageDescriptor& imageDesc : images) {
        imageDesc.changeSelection(false);
    }
}

QModelIndex ImageGalleryModel::index(int row, int /*column*/, const QModelIndex& /*parent*/) const
{
    return createIndex(row, 0);
}

QModelIndex ImageGalleryModel::parent(const QModelIndex& /*child*/) const
{
    return QModelIndex();
}

int ImageGalleryModel::columnCount(const QModelIndex& /*parent*/) const
{
    return 1;
}
