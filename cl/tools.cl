// first 16 pairs of numbers of the [2,3] halton sequence
__constant float halton[32] = { 
	0, 0, 0.5f, 0.333333f, 0, 0.6666666f, 0.75f, 0.111111111f, 0, 0.44444444f, 
	0.5f, 0.7777777f, 0.25f, 0.222222222f, 0.75f, 0.55555555f, 0, 0.88888888f, 
	0.5f, 0.03703703f, 0.25f, 0.37037037f, 0.75f, 0.70370370f, 0.125f, 0.148148148f,
	0.625f, 0.481481481f, 0.375f, 0.814814814f, 0.875f, 0.259259259f 
};

// random numbers: seed using WangHash(threadidx), then use RandomInt / RandomFloat
uint WangHash( uint s ) { s = (s ^ 61) ^ (s >> 16), s *= 9, s = s ^ (s >> 4), s *= 0x27d4eb2d, s = s ^ (s >> 15); return s; }
uint RandomInt( uint* s ) { *s ^= *s << 13, * s ^= *s >> 17, * s ^= *s << 5; return *s; }
float RandomFloat( uint* s ) { return RandomInt( s ) * 2.3283064365387e-10f; /* = 1 / (2^32-1) */ }

// cosine weighted random reflection in tangent space with specified normal
float3 DiffuseReflectionCosWeighted( const float r0, const float r1, const float3 N )
{
	const float3 T = normalize( cross( N, fabs( N.y ) > 0.99f ? (float3)(1, 0, 0) : (float3)(0, 1, 0) ) );
	const float3 B = cross( T, N );
	const float term1 = TWOPI * r0, term2 = sqrt( 1 - r1 );
	float c, s = sincos( term1, &c );
	return (c * term2 * T) + (s * term2) * B + sqrt( r1 ) * N;
}

// EOF