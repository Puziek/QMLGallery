#include "imagegallerymodel.h"
#include "QDebug"

ImageGalleryModel::ImageGalleryModel(QObject *parent) : QAbstractListModel(parent)
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

bool ImageGalleryModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (index.row() < rowCount(index)) {
        switch (role) {
        case sourceRole:
            return false;
        case selectedRole:
            images[index.row()].setSelection(value.toBool());
            return true;
        }
    }
    return false;
}

int ImageGalleryModel::rowCount(const QModelIndex &parent) const
{
    return images.size();
}

QHash<int, QByteArray> ImageGalleryModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[sourceRole]= "source";
    roles[selectedRole] = "selected";
    return roles;
}

int ImageGalleryModel::selectedCount()
{
    int count = 0;

    for (const ImageDescriptor& image : images) {
        if (image.getSelection()) {
            count++;
        }
    }

    return count;
}

QString ImageGalleryModel::sourceFromIndex(int index)
{
    return images[index].getSource();
}

QList<int> ImageGalleryModel::selectedIndexes()
{
    QList<int> indexes;
    int count = 0;
    for (const ImageDescriptor& image : images) {
        if (image.getSelection()) {
            indexes.append(count);
        }
        count++;
    }

    return indexes;
}

int ImageGalleryModel::currentIndex()
{
    return properties.currentIndex;
}

void ImageGalleryModel::setCurrentIndex(int index)
{
    if (index != properties.currentIndex) {
        properties.currentIndex = index;
        emit currentIndexChanged();
    }
}
