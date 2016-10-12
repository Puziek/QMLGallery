#ifndef IMAGEGALLERYMODEL_H
#define IMAGEGALLERYMODEL_H

#include <QObject>
#include <QAbstractItemModel>
#include <imagedescriptor.h>

class ImageGalleryModel : public QAbstractItemModel
{
    Q_OBJECT
    enum Roles {
        sourceRole = Qt::UserRole + 1,
        selectedRole
    };

public:
    ImageGalleryModel(QObject* parent = nullptr);

    // pure virtuals implementations
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const ;

    QHash<int,QByteArray> roleNames() const;

    Q_INVOKABLE void selectImage(int index);
    Q_INVOKABLE void deselectAll();

private:
    QList<ImageDescriptor> images;

    // QAbstractItemModel interface
public:
    QModelIndex index(int row, int column, const QModelIndex &parent) const;
    QModelIndex parent(const QModelIndex &child) const;
    int columnCount(const QModelIndex &parent) const;
};

#endif // IMAGEGALLERYMODEL_H
