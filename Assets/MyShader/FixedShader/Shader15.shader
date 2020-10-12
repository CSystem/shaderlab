Shader "MyShader/BaseAlphaTest" {
	Properties {
		_MainTex("Main Texture", 2D) = "White" {}
	}
	SubShader {
		Pass{
			AlphaTest Greater 0.6
			SetTexture[_MainTex] {
				combine texture
			}
		}
	}

	Fallback "Diffuse"
}
