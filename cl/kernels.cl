#include "template/common.h"
#include "cl/tools.cl"

__kernel void render( __global uint* pixels )
{
	// plot a pixel to outimg
	const int p = get_global_id( 0 );
	const int x = p % 511;
	const int y = p / 512;
	pixels[x + y * 512] = (x >> 1) + ((y >> 1) << 8);
}

// EOF