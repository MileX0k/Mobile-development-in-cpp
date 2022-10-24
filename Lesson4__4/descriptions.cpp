#include "descriptions.h"
#include <QDebug>

descriptions::descriptions(QObject *parent)
    : QObject{parent}
{
    initializingX();

}

void descriptions::initializingX()
{
    for (double i = 0; i <= 5;)
    {
        x_value.push_back(i);
        i += 0.1;
    }

    for (auto i = x_value.begin(); i != x_value.end(); i++)
    {
        qDebug() << *i;
    }
    initializingY(sin);
}

void descriptions::initializingY(ChartType chartType)
{
    if (chartType == 0)
    {
        for (auto i = x_value.begin(); i != x_value.end(); i++)
        {
            y_value.push_back(qSin(*i));
        }
    } else if (chartType == 1)
    {
        for (auto i = x_value.begin(); i != x_value.end(); i++)
        {
            y_value.push_back(*i);
        }
    } else if (chartType == 1)
    {
        for (auto i = x_value.begin(); i != x_value.end(); i++)
        {
            y_value.push_back(qFabs(*i-2.5));
        }
    } else if (chartType == 1)
    {
        for (auto i = x_value.begin(); i != x_value.end(); i++)
        {
            y_value.push_back(*i * *i);
        }
    } else if (chartType == 1)
    {
        for (auto i = x_value.begin(); i != x_value.end(); i++)
        {
            y_value.push_back(qLn(*i) / qLn(2));
        }
    }

    for (auto i = y_value.begin(); i != y_value.end(); i++)
    {
        qDebug() << *i;
    }
    addInMap();

}

void descriptions::selectedColor()
{
    r = rand() % 255;
    g = rand() % 255;
    b = rand() % 255;
    qDebug() << "r: " << r << "g: " << g << "b: " << b ;
}

QList<std::pair<double, double>> descriptions::addInMap()
{

    for (auto i = x_value.begin(); i < x_value.end();)
    {
        for (auto j = y_value.begin(); j < y_value.end();)
        {
            pointers.append(qMakePair(*i, *j));
            i++;
            j++;
        }
    }

    for (auto i = pointers.begin(); i < pointers.end(); i++)
        qDebug() << "first : " << i->first << " second: " << i->second;
    return pointers;
}
