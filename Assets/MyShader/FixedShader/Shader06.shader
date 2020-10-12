Shader "MyShader/Color&&Light&&Texture" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainColor("Main Color",Color) = (1,1,1,0)
		_Specular("Specular Color", Color) = (1,1,1,0)
		_Shininess("Shininess",Range(0.07,1)) = 0.7
		_Emission("Emission Color", Color) = (1,1,1,0)
	}
	SubShader {
		Pass{
			Material{
				Diffuse [_MainColor]
				Ambient [_MainColor]

				Shininess [_Shininess]
				Emission [_Emission]
				Specular [_Specular]
			}
			Lighting On
			SeparateSpecular On
			SetTexture [_MainTex] {Combine texture * primary DOUBLE, texture * primary}
		}


	} 
	FallBack "Diffuse"
}
