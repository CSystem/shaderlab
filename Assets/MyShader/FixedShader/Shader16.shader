Shader "MyShader/Light&&AlphaTest&&Glass" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Color("Color",Color) = (1,1,1,1)
		_Specular("Specular",Color) = (1,1,1,1)
		_Emission("Emission",Color) = (1,1,1,1)
		_Shininess("Shininess",Range(0.01,1)) = 0.7
		_Cutoff ("Alpha透明度阈值", Range (0,1)) = 0.5
	}
	SubShader {
		Pass{
			AlphaTest Greater [_Cutoff]
			Material{
				Diffuse[_Color]
				Ambient[_Color]
				Specular[_Specular]
				Emission[_Emission]
				Shininess[_Shininess]
			}
			Lighting On
			SetTexture [_MainTex] { combine texture * primary }
		}
	} 
	FallBack "Diffuse"
}
