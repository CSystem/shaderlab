Shader "MyShader/BaseColor" {
	SubShader {
		Pass{
		Color(0,0,0.6,0)
		}
	}

	Fallback "Diffuse"
}
