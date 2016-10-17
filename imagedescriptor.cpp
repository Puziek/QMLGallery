#include "imagedescriptor.h"

ImageDescriptor::ImageDescriptor(QString src) :
    source(src),
    isSelected(false)
{
}

QString ImageDescriptor::getSource() const
{
    return source;
}

bool ImageDescriptor::getSelection() const
{
    return isSelected;
}

void ImageDescriptor::setSelection(bool selection)
{
    isSelected = selection;
}
