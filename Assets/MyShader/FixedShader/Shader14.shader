Shader "MyShader/Cull&&Glass" {
	Properties {
		_MainTex("Main Texture", 2D) = "White" {}
		_Color("Color",Color) = (1,1,1,1)
		_Specular("Specular",Color) = (1,1,1,1)
		_Emission("Emission",Color) = (1,1,1,1)
		_Shininess("Shininess",Range(0.01,1)) = 0.7
	}
	SubShader {

			Material{
				Diffuse[_Color]
				Ambient[_Color]
				Specular[_Specular]
				Emission[_Emission]
				Shininess[_Shininess]
			}
			Lighting On
			ZWrite Off
			SeparateSpecular On
			Blend SrcAlpha OneMinusSrcAlpha
			Pass{
			Cull Back
			SetTexture[_MainTex]{
				combine primary * texture 
			}
		}
	}		
	
	Fallback "Diffuse"
}
