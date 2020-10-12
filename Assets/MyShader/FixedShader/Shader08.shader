Shader "MyShader/AlphaBlend" {
	Properties {
		_MainTex("Maint Texture", 2D) = "White"
		_BlendTex("Blend Texture", 2D) = "White"
	}
	SubShader {
		Pass{
			SetTexture[_MainTex]
			SetTexture [_BlendTex] {combine  texture * previous}	//alpha和RGB一起混合
		}
	}

	Fallback "Diffuse"
}