#include "notepad.h"

Notepad::Notepad(QObject *parent):QObject(parent)
{
    m_path = QCoreApplication::applicationFilePath();
    m_path.append("/file.txt");

}

QString Notepad::path()
{
    return m_path;
}

void Notepad::setPath(QString val)
{
    m_path = val;
    m_path.remove("file://");
    emit pathChanged();
}

QString Notepad::data()
{
    QFile file(m_path);
    if(!file.open(QIODevice::ReadOnly)){
        qWarning() << "Khong the doc file!";
        return "";
    }
    QTextStream stream(&file);
    QString val = stream.readAll();
    file.close();
    return val;
}

void Notepad::setData(QString val)
{
    QFile file(m_path);
    if(!file.open(QIODevice::WriteOnly)){
        qWarning() << "Khong the ghi file!";
    }
    QTextStream stream(&file);
    stream << val;
    stream.flush();
    file.close();
    emit dataChanged();
}
