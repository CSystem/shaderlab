Shader "shadertoy/Target with smoothstep" {
    Properties {
		_Rings("_Rings", float) = 16.0
		_Velocity("_Velocity", float) = 8.0
		_SmoothWidth("_SmoothWidth", float) = 0.003
		_MainTex ("Main Texture (RGB)", 2D) = "white" {}
		_Test("_Test", float) = 1.0
    }

    CGINCLUDE

    #include "UnityCG.cginc"  
    #pragma target 3.0  

    #define vec2 float2
    #define vec3 float3
    #define vec4 float4
    #define mat2 float2x2
    #define iGlobalTime _Time.y
    #define mod fmod
    #define mix lerp
    #define atan atan2
    #define fract frac 
    #define texture2D tex2D
    #define iResolution _ScreenParams

	float _Rings;
	float _Velocity;
	float _SmoothWidth;
	float _Test;
    sampler2D _MainTex;

    struct v2f {      
        float4 pos : SV_POSITION;      
        float2 uv : TEXCOORD0;    
     };    

	 float4 _MainTex_ST;
     v2f vert(appdata_base v) {    
         v2f o;    
         o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
         o.uv = ComputeScreenPos(o.pos);   
         return o;    
     }

     vec4 main(vec2 fragCoord);
	 vec4 mainNew(vec2 fragCoord);

     fixed4 frag(v2f _iParam) : COLOR0 {  
        return main(_iParam.uv);
     }  

     vec4 main(vec2 fragCoord) {

		vec2 position = fragCoord.xy;
		float aspect = _Test;
		position.x *= aspect;
		float dist = distance(position, vec2(aspect*0.5, 0.5));
		float offset = iGlobalTime*_Velocity;
		float v = dist * _Rings - offset;
		float ringr = floor(v);
		float color = smoothstep(-_SmoothWidth, _SmoothWidth, abs(dist - (ringr + float(fract(v) > 0.5) + offset) / _Rings));
		_Test = mod(ringr,2.0);
		if(_Test == 0.0 )
			color=1.0 - color;
		vec4 fragColor = vec4(color, color, color, 1.0);
        return fragColor;
    }

	vec4 mainNew(vec2 fragCoord) {

		vec2 position = fragCoord.xy;
		float aspect = _Test;
		position.x *= aspect;
		float dist = distance(position, vec2(aspect*0.5, 0.5));
		float constDist = 0.5;
		float step = constDist / _Rings;
		float diff = dist / constDist;
		float diffN = floor(diff);
		float color = 1.0;
		if (mod(diffN, 2.0) == 1.0)
		{
			color = 1.0 - color;
		}
		vec4 fragColor = vec4(color, color, color, 1.0);
        return fragColor;
    }
    ENDCG

    SubShader {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest   

            ENDCG
        }
    } 
    FallBack "Diffuse"
}