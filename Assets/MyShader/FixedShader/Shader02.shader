Shader "MyShader/BaseColor&&Light" {
	SubShader {
		Pass{
			Material{
				Diffuse(0.9,0.5,0.4,1)
				Ambient(0.9,0.5,0.4,1)
			}
			Lighting On
		}
	}

	Fallback "Diffuse"
}
