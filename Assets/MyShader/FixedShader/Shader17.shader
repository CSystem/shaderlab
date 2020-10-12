Shader "MyShader/PlantShader" {
	Properties {
		_MainTex ("Base Texture", 2D) = "white" {}
		_Color("Main Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_CutOff("Cut Off", Range(0,.9)) = .5
	}
	SubShader {

		Material{
			Diffuse[_Color]
			Ambient[_Color]
		}
		Lighting On
		Cull Off

		Pass{
			AlphaTest Greater [_CutOff]
			SetTexture[_MainTex]{
				combine primary * texture
			}
		}

		Pass{
			ZWrite Off
			ZTest Less
			AlphaTest LEqual [_CutOff]
			Blend SrcAlpha OneMinusSrcAlpha
			SetTexture[_MainTex]{
				combine primary * texture, texture
			}
		}
	} 
	FallBack "Diffuse"
}
