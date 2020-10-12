Shader "MyShader/AlphaBlend&&Light" {
	Properties {
		_MainTex("Main Texture",2D) = "White"
	}
	SubShader {
		Pass{
			Material{
				Diffuse(1,1,1,1)		
				Ambient(1,1,1,1)			//设置白色的顶点光
			}
			Lighting On

			SetTexture[_MainTex]{
				constantColor(1,1,1,1)
				combine constant lerp(texture) previous		//使用纹理的alpha通道和color插值混合颜色
			}

			SetTexture[_MainTex]{
				combine texture * previous
			}
		}
	}

	Fallback "Diffuse"
}