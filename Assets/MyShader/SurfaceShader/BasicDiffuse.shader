Shader "CookbookShaders/BasicDiffuse" {

	Properties
	{
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_EmissiveColor ("Emissive Color",Color) = (1,1,1,1)
		_AmbientColor ("AmbientColor", Color) = (1,1,1,1)
		_MySilderValue("This is a slider", Range(0,10)) = 2.5
	}

	SubShader
	{
		Tags {"RenderType" = "Opaque"}
		LOD 200
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		half4 _EmissiveColor;
		half4 _AmbientColor;
		half _MySilderValue;

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			half4 c = pow((_AmbientColor + _EmissiveColor),_MySilderValue);
			// c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}

	FallBack "Diffuse"
}
