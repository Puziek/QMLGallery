#include "imagedescriptor.h"

ImageDescriptor::ImageDescriptor(QString src) :
    source(src),
    isSelected(false)
{
}

bool ImageDescriptor::getSelection() const
{
    return isSelected;
}

QString ImageDescriptor::getSource() const
{
    return source;
}

void ImageDescriptor::changeSelection()
{
    isSelected = !isSelected;
}

void ImageDescriptor::changeSelection(bool val)
{
    isSelected = val;
}
