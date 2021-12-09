#include "template.h"
#include "game.h"
#include "surface.h"
#include <cstdio> //printf

using namespace Tmpl8;

// -----------------------------------------------------------
// Initialize the application
// -----------------------------------------------------------
void Game::Init()
{
}
	
// -----------------------------------------------------------
// Close down application
// -----------------------------------------------------------
void Game::Shutdown()
{
}

// -----------------------------------------------------------
// Main application tick function
// -----------------------------------------------------------
void Game::Tick(float deltaTime)
{
	// clear the graphics window
	screen->Clear(0);
	// print something in the graphics window
	screen->Print("hello world", 2, 2, 0xffffff);
	// print something to the text window
	printf("this goes to the console window.\n");
}