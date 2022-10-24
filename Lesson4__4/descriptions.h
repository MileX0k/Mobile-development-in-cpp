#ifndef DESCRIPTIONS_H
#define DESCRIPTIONS_H

#include <QObject>
#include <QtMath>
#include <QPair>
#include <QList>

class descriptions : public QObject
{
    Q_OBJECT


public:
    Q_INVOKABLE enum ChartType
    {
        sin,
        line,
        modal,
        square,
        log_x
    };

    explicit descriptions(QObject *parent = nullptr);

private:
    void initializingX();
    Q_INVOKABLE void initializingY(ChartType chartType);
    Q_INVOKABLE void selectedColor();
    Q_INVOKABLE QList<std::pair<double, double>> addInMap();

signals:

private:
    std::vector<double> x_value;
    std::vector<double> y_value;
    ChartType *chartType;
    int r, g, b;
    Q_INVOKABLE QList<std::pair<double, double>> pointers;

};

#endif // DESCRIPTIONS_H
