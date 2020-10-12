Shader "MyShader/GrabPass" {
	SubShader{
		Tags { "Queue" = "Transparent" }

		GrabPass{}	//捕获对象
		Pass{
			SetTexture[_GrabTexture] {combine one-texture Double}			//反向颜色
		}
	}
}
