Shader "MyShader/Vertex&&AlphaBlend&Selfluminous" {
	Properties {
		_Luminous("Luminous Color", Color) = (1,1,1,1)
		_Shininess("Shininess", Range(0.01, 1.0)) = 0.7
		_Specular("Specular Color",Color) = (0.9,0.5,0.4,1)
		_Emission("Emission Color", Color) = (1,1,1,1)
		_MainColor("Main Color", Color) = (1,1,1,1)
		_MainTex("Main Texture", 2D) = "White"
		_BlentTex("Blend Texture", 2D) = "White"
	}
	SubShader {
		Pass{
			Material{
				Diffuse[_MainColor]
				Ambient[_MainColor]
				Shininess[_Shininess]
				Specular[_Specular]
				Emission[_Emission]
			}

			Lighting On
			SeparateSpecular On		//开启高光反射


			SetTexture[_MainTex]{
				constantColor[_Luminous]
				combine constant lerp(texture) previous
			}

			SetTexture[_MainTex]{
				combine texture * previous
			}

			SetTexture[_BlentTex]{
				combine texture * previous
			}

			SetTexture[_MainTex]{
				combine previous * primary Double, previous * primary
			}
		}
	}

	Fallback "Diffuse"
}
