Shader "MyShader/RimShine" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_NormalTex("Normal Bump",2D) = "Bump"{}
		_RimColor("Rim Color",Color) = (1,1,1,1)
		_RimPower("Rim Power",Range(0.4,0.9)) = 0.7
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		  
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _NormalTex;
		float _RimPower;
		float4 _RimColor;

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpMap;
			float3 viewDir;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Normal = UnpackNormal(tex2D(_NormalTex, IN.uv_BumpMap));
			half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission = _RimColor.rgb * pow(rim, _RimPower);
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
