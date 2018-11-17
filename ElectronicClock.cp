// 电子时钟.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include <graphics.h>
#include <conio.h>
#include <math.h>

#define PI 3.1415926535

void DrawDial();
void DrawHand(int hour, int minute, int second);

int main()
{
    DrawDial();

    setwritemode(R2_XORPEN);        //设置图形划线模式

    SYSTEMTIME t;
    while (!kbhit())
    {
        GetLocalTime(&t);
        DrawHand(t.wHour, t.wMinute, t.wSecond);

        Sleep(1000);
        DrawHand(t.wHour, t.wMinute, t.wSecond);
    }

    return 0;
}

void DrawDial()
{
    //初始化窗口
    initgraph(500, 500);
    cleardevice();

    circle(250, 250, 2);
    circle(250, 250, 60);
    circle(335, 220, 30);
    circle(250, 250, 160);
    outtextxy(220, 350, L"hwchu");

    int x, y;   //为点的坐标
    for (int i = 0; i < 60; i++)
    {
        x = 250 + (int)(145 * sin(2 * PI * i/60));
        y = 250 + (int)(145 * cos(2 * PI * i/60));

        if (i % 15 == 0)
        {
            bar(x - 5, y - 5, x + 5, y + 5);
        }
        else if (i % 5 == 0)
        {
            circle(x, y, 3);
        }
        else
        {
            putpixel(x, y, WHITE);
        }
    }

    for (int i = 0; i < 11; i++)
    {
        x = 335 + (int)(28 * sin(2 * PI * i / 11));
        y = 220 + (int)(28 * cos(2 * PI * i/11));

        putpixel(x, y, WHITE);
    }

}

void DrawHand(int hour, int minute, int second)
{
    double a_hour, a_minute, a_second;      //每一时刻的弧度值
    int x_hour, y_hour, x_min, y_min, x_sec, y_sec;     //时分秒针末端的位置坐标

    a_second = second * 2 * PI /60;
    a_minute = minute * 2 * PI / 60 + a_second / 60;
    a_hour  = hour * 2 * PI / 12 + a_minute / 12;

    x_sec = int(120 * sin(a_second));
    y_sec = int(120 * cos(a_second));

    x_min = int(100 * sin(a_minute));
    y_min = int(100 * cos(a_minute));

    x_hour = int(70 * sin(a_hour));
    y_hour = int(70 * cos(a_hour));

    // 画秒针
    setlinestyle(PS_SOLID, 2);
    setcolor(YELLOW);

    line(250 + x_sec, 250 - y_sec, 250 - x_sec / 5, 250 + y_sec / 5);

    // 画分针
    setlinestyle(PS_SOLID, 6);
    setcolor(GREEN);

    line(250 + x_min, 250 - y_min, 250 - x_min / 5, 250 + y_min / 5);

    // 画时针
    setlinestyle(PS_SOLID, 6);
    setcolor(LIGHTBLUE);

    line(250 + x_hour, 250 - y_hour, 250 - x_hour / 5, 250 + y_hour / 5);

}
