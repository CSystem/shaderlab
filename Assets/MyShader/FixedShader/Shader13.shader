Shader "MyShader/CullFront&&BlueVertex" {
	Properties {
		_MainTex("Main Texture",2D) = "White" {}
		_Color("Color", Color) = (1,1,1,1)
		_Specular("Specular", Color) = (1,1,1,1)
		_Emission("Emission", Color) = (1,1,1,1)
		_Shininess("Shininess",Range(0.01, 1)) = 0.7
	} 
	SubShader {
		Pass{
			Material{
				Diffuse[_Color]
				Ambient[_Color]
				Shininess[_Shininess]
				Emission[_Emission]
				Specular[_Specular]
			}
			Lighting On

			SetTexture[_MainTex]{
				combine texture * primary
			}
		}

		Pass{
			Color(0,0,1,1)
			Cull Front
		}
	}

}
