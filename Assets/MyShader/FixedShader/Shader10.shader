Shader "MyShader/AlphaBlend&DinamicColorLight" {
	Properties {
		_Color(" Color(RGBA)", Color) = (1,1,1,1)
		_MainTex("Main Texture", 2D) = "White"
	}
	SubShader {
		Pass{
			Material{
				Diffuse(1,1,1,1)
				Ambient(1,1,1,1)
			}

			Lighting On

			SetTexture[_MainTex]{
				constantColor[_Color]
				combine constant lerp(texture)  previous
			}
  
			SetTexture[_MainTex]{
				combine texture * previous
			}
		}
	}

	Fallback "Diffuse"
}