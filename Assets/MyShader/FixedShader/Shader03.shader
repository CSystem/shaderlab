Shader "MyShader/DynamicColor&&Light" {
	Properties {
		_MainColor("Main Color(RGB)",Color) = (1,1,1,1)
	}
	SubShader {		
		Pass{
			Material{
				Diffuse [_MainColor]
				Ambient [_MainColor]
			}
			Lighting On
		}
	}

	Fallback "Diffuse"
}
