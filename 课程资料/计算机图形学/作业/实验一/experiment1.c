#include <windows.h>
#include <math.h>
#include <stdlib.h>

static void DrawPoint(HDC hdc, int x, int y, COLORREF color)
{
    SetPixel(hdc, x, y, color);
}

static void PutText(HDC hdc, int x, int y, const char *text)
{
    TextOutA(hdc, x, y, text, lstrlenA(text));
}

/* DDA画线 */
static void DrawLineDDA(HDC hdc, int x0, int y0, int x1, int y1, COLORREF color)
{
    int dx = x1 - x0;
    int dy = y1 - y0;
    int steps = abs(dx) > abs(dy) ? abs(dx) : abs(dy);
    float x = (float)x0;
    float y = (float)y0;
    float xInc = dx / (float)steps;
    float yInc = dy / (float)steps;
    int i;

    for (i = 0; i <= steps; ++i) {
        DrawPoint(hdc, (int)(x + 0.5f), (int)(y + 0.5f), color);
        x += xInc;
        y += yInc;
    }
}

/* 中点Bresenham画线，支持0<k<1和k>1 */
static void DrawLineBresenham(HDC hdc, int x0, int y0, int x1, int y1, COLORREF color)
{
    int dx = abs(x1 - x0);
    int dy = abs(y1 - y0);
    int sx = x0 < x1 ? 1 : -1;
    int sy = y0 < y1 ? 1 : -1;
    int err = dx - dy;

    while (1) {
        DrawPoint(hdc, x0, y0, color);
        if (x0 == x1 && y0 == y1) break;
        if (err * 2 > -dy) {
            err -= dy;
            x0 += sx;
        }
        if (err * 2 < dx) {
            err += dx;
            y0 += sy;
        }
    }
}

/* 利用八分对称性画圆 */
static void DrawCirclePoints(HDC hdc, int xc, int yc, int x, int y, COLORREF color)
{
    DrawPoint(hdc, xc + x, yc + y, color);
    DrawPoint(hdc, xc - x, yc + y, color);
    DrawPoint(hdc, xc + x, yc - y, color);
    DrawPoint(hdc, xc - x, yc - y, color);
    DrawPoint(hdc, xc + y, yc + x, color);
    DrawPoint(hdc, xc - y, yc + x, color);
    DrawPoint(hdc, xc + y, yc - x, color);
    DrawPoint(hdc, xc - y, yc - x, color);
}

/* 中点Bresenham画圆 */
static void DrawCircleBresenham(HDC hdc, int xc, int yc, int r, COLORREF color)
{
    int x = 0;
    int y = r;
    int d = 1 - r;

    DrawCirclePoints(hdc, xc, yc, x, y, color);
    while (x < y) {
        ++x;
        if (d < 0) {
            d += 2 * x + 3;
        } else {
            --y;
            d += 2 * (x - y) + 5;
        }
        DrawCirclePoints(hdc, xc, yc, x, y, color);
    }
}

static void DrawDemo(HDC hdc)
{
    PutText(hdc, 40, 20, "DDA line: 0<k<1");
    DrawLineDDA(hdc, 40, 60, 300, 160, RGB(220, 20, 60));

    PutText(hdc, 40, 190, "DDA line: k>1");
    DrawLineDDA(hdc, 80, 230, 180, 490, RGB(220, 20, 60));

    PutText(hdc, 360, 20, "Bresenham line: 0<k<1");
    DrawLineBresenham(hdc, 360, 60, 620, 160, RGB(0, 90, 200));

    PutText(hdc, 360, 190, "Bresenham line: k>1");
    DrawLineBresenham(hdc, 410, 230, 510, 490, RGB(0, 90, 200));

    PutText(hdc, 650, 20, "Bresenham circle");
    DrawCircleBresenham(hdc, 740, 230, 90, RGB(20, 150, 80));
}

static LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    switch (msg) {
    case WM_PAINT: {
        PAINTSTRUCT ps;
        HDC hdc = BeginPaint(hwnd, &ps);
        DrawDemo(hdc);
        EndPaint(hwnd, &ps);
        return 0;
    }
    case WM_DESTROY:
        PostQuitMessage(0);
        return 0;
    }
    return DefWindowProc(hwnd, msg, wParam, lParam);
}

int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR cmd, int show)
{
    WNDCLASSA wc;
    HWND hwnd;
    MSG msg;

    (void)hPrev;
    (void)cmd;

    ZeroMemory(&wc, sizeof(wc));
    wc.lpfnWndProc = WndProc;
    wc.hInstance = hInst;
    wc.lpszClassName = "CGExperiment1";
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);

    RegisterClassA(&wc);
    hwnd = CreateWindowA("CGExperiment1", "Experiment 1",
                         WS_OVERLAPPEDWINDOW, 20, 20, 920, 560,
                         NULL, NULL, hInst, NULL);
    ShowWindow(hwnd, show);
    UpdateWindow(hwnd);

    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    return (int)msg.wParam;
}
