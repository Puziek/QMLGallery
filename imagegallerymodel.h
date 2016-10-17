#ifndef IMAGEGALLERYMODEL_H
#define IMAGEGALLERYMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <imagedescriptor.h>

class ImageGalleryModel : public QAbstractListModel
{
    Q_OBJECT
    enum Roles {
        sourceRole = Qt::UserRole + 1,
        selectedRole
    };

    Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)

public:
    ImageGalleryModel(QObject* parent = nullptr);

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;

    QHash<int,QByteArray> roleNames() const;

    Q_INVOKABLE void deselectAll();
    Q_INVOKABLE void removeSelected();
    Q_INVOKABLE int selectedCount();
    Q_INVOKABLE QString sourceFromIndex(int index);
    Q_INVOKABLE QList<int> selectedIndexes();

    int currentIndex();
    void setCurrentIndex(int index);

signals:
    void currentIndexChanged();

private:

    struct QProperties {
        int currentIndex;
    };

    QProperties properties;

    QList<ImageDescriptor> images;
};

#endif // IMAGEGALLERYMODEL_H
