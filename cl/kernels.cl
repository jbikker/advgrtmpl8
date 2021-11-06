#include "template/common.h"
#include "cl/tools.cl"

__kernel void render( write_only image2d_t outimg )
{
	// plot a pixel to outimg
	const int x = get_global_id( 0 );
	const int y = get_global_id( 1 );
	write_imagef( outimg, (int2)(x, y), ((x & 255) << 16) + ((g & 255) << 8) );
}

// EOF