Shader "MyShader/BaseTexture" {
	Properties {
		_MainTex("Main Texture", 2D) = "White" {TexGen SphereMap}
	}
	SubShader {
		Pass{
			SetTexture[_MainTex] {combine texture}
		}
	}

	Fallback "Diffuse"
}
