#ifndef NOTEPAD_H
#define NOTEPAD_H

#include <QObject>
#include <QCoreApplication>
#include <QFile>
#include <QTextStream>
#include <QDebug>


class Notepad : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QString data READ data WRITE setData NOTIFY dataChanged)
public:
    explicit Notepad(QObject *parent = nullptr);
    QString path();
    void setPath(QString val);
    QString data();
    void setData(QString val);
signals:
    void pathChanged();
    void dataChanged();
private:
    QString m_path;

};

#endif // NOTEPAD_H
