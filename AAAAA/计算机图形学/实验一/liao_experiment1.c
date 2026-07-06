#include <windows.h>
#include <stdlib.h>

static int RoundValue(double value)
{
    return (int)(value + 0.5);
}

static void Pixel(HDC hdc, int x, int y, COLORREF color)
{
    SetPixel(hdc, x, y, color);
}

static void Label(HDC hdc, int x, int y, const char *text)
{
    TextOutA(hdc, x, y, text, lstrlenA(text));
}

/* DDA算法绘制直线 */
static void LineByDDA(HDC hdc, int xa, int ya, int xb, int yb, COLORREF color)
{
    int dx = xb - xa;
    int dy = yb - ya;
    int count = abs(dx) > abs(dy) ? abs(dx) : abs(dy);
    double x = xa;
    double y = ya;
    double stepX = dx / (double)count;
    double stepY = dy / (double)count;
    int i;

    for (i = 0; i <= count; ++i) {
        Pixel(hdc, RoundValue(x), RoundValue(y), color);
        x += stepX;
        y += stepY;
    }
}

/* Bresenham算法绘制直线 */
static void LineByBresenham(HDC hdc, int xa, int ya, int xb, int yb, COLORREF color)
{
    int dx = abs(xb - xa);
    int dy = abs(yb - ya);
    int sx = xa <= xb ? 1 : -1;
    int sy = ya <= yb ? 1 : -1;
    int decision = dx - dy;

    while (1) {
        int twice = decision * 2;
        Pixel(hdc, xa, ya, color);
        if (xa == xb && ya == yb) {
            break;
        }
        if (twice > -dy) {
            decision -= dy;
            xa += sx;
        }
        if (twice < dx) {
            decision += dx;
            ya += sy;
        }
    }
}

/* 按八分对称性绘制圆点 */
static void CircleSymmetry(HDC hdc, int cx, int cy, int x, int y, COLORREF color)
{
    Pixel(hdc, cx + x, cy + y, color);
    Pixel(hdc, cx - x, cy + y, color);
    Pixel(hdc, cx + x, cy - y, color);
    Pixel(hdc, cx - x, cy - y, color);
    Pixel(hdc, cx + y, cy + x, color);
    Pixel(hdc, cx - y, cy + x, color);
    Pixel(hdc, cx + y, cy - x, color);
    Pixel(hdc, cx - y, cy - x, color);
}

/* Bresenham中点画圆算法 */
static void CircleByBresenham(HDC hdc, int cx, int cy, int radius, COLORREF color)
{
    int x = 0;
    int y = radius;
    int p = 1 - radius;

    CircleSymmetry(hdc, cx, cy, x, y, color);
    while (x < y) {
        ++x;
        if (p >= 0) {
            --y;
            p += 2 * (x - y) + 5;
        } else {
            p += 2 * x + 3;
        }
        CircleSymmetry(hdc, cx, cy, x, y, color);
    }
}

static void PaintResult(HDC hdc)
{
    Label(hdc, 40, 25, "DDA: 0<k<1");
    LineByDDA(hdc, 55, 58, 410, 142, RGB(180, 40, 150));

    Label(hdc, 40, 165, "DDA: k>1");
    LineByDDA(hdc, 125, 200, 205, 325, RGB(180, 40, 150));

    Label(hdc, 40, 350, "Bresenham: 0<k<1");
    LineByBresenham(hdc, 55, 383, 410, 467, RGB(30, 130, 180));

    Label(hdc, 40, 490, "Bresenham: k>1");
    LineByBresenham(hdc, 125, 525, 205, 650, RGB(30, 130, 180));

    Label(hdc, 40, 675, "Circle");
    CircleByBresenham(hdc, 260, 780, 72, RGB(0, 170, 80));
}

static LRESULT CALLBACK WindowProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message) {
    case WM_PAINT: {
        PAINTSTRUCT ps;
        HDC hdc = BeginPaint(hwnd, &ps);
        PaintResult(hdc);
        EndPaint(hwnd, &ps);
        return 0;
    }
    case WM_DESTROY:
        PostQuitMessage(0);
        return 0;
    }
    return DefWindowProc(hwnd, message, wParam, lParam);
}

int WINAPI WinMain(HINSTANCE instance, HINSTANCE prev, LPSTR command, int show)
{
    WNDCLASSA wc;
    HWND hwnd;
    MSG msg;

    (void)prev;
    (void)command;

    ZeroMemory(&wc, sizeof(wc));
    wc.lpfnWndProc = WindowProc;
    wc.hInstance = instance;
    wc.lpszClassName = "LiaoExperimentOne";
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);

    RegisterClassA(&wc);
    hwnd = CreateWindowA("LiaoExperimentOne", "Experiment 1 - Liao",
                         WS_OVERLAPPEDWINDOW, 80, 20, 560, 920,
                         NULL, NULL, instance, NULL);

    ShowWindow(hwnd, show);
    UpdateWindow(hwnd);

    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    return (int)msg.wParam;
}
