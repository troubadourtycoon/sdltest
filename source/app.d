import derelict.sdl2.sdl;
import std.stdio;

int main() {
    DerelictSDL2.load();

    if (SDL_Init(SDL_INIT_EVERYTHING) == -1) {
        writefln("SDL_Init failed with error code: %s", SDL_GetError());
        return 1;
    }

    SDL_Window* win = null;
    win = SDL_CreateWindow("Hello World!", 100, 100, 640, 480, SDL_WINDOW_SHOWN);
    if (win == null) {
        writefln("SDL_CreateWindow failed with error code: %s", SDL_GetError());
        return 1;
    }

    SDL_Renderer* ren = null;
    ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (ren == null) {
        writefln("SDL_CreateRenderer failed with error code: %s", SDL_GetError());
        return 1;
    }

    SDL_Surface* bmp = null;
    bmp = SDL_LoadBMP("./res/hello.bmp");
    if (bmp == null) {
        writefln("SDL_LoadBMP failed with error code: %s", SDL_GetError());
        return 1;
    }

    SDL_Texture* tex = null;
    tex = SDL_CreateTextureFromSurface(ren, bmp);

    SDL_RenderClear(ren);
    SDL_RenderCopy(ren, tex, null, null);
    SDL_RenderPresent(ren);

    SDL_Delay(2000);

    SDL_Quit();
    return 0;
}