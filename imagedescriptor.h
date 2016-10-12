#ifndef IMAGEDESCRIPTOR_H
#define IMAGEDESCRIPTOR_H

#include <QObject>

class ImageDescriptor
{

public:
    explicit ImageDescriptor(QString src);

    bool getSelection() const;
    QString getSource() const;

    void changeSelection();
    void changeSelection(bool val);

private:
    QString source;
    bool isSelected;

};

#endif // IMAGEDESCRIPTOR_H
