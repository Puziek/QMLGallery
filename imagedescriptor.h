#ifndef IMAGEDESCRIPTOR_H
#define IMAGEDESCRIPTOR_H

#include <QObject>

class ImageDescriptor
{    
public:
    explicit ImageDescriptor(QString src);

    QString getSource() const;
    bool getSelection() const;
    void setSelection(bool selection);

private:
    QString source;
    bool isSelected;
};

#endif // IMAGEDESCRIPTOR_H
