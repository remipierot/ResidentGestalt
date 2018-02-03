Shader "ImageEffect/SobelEdgeDetection"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
				float4 screenPos : TEXCOORD1;
			};

			float4 _MainTex_ST;
			float4 _MainTex_ST_TexelSize_;
			float step_h;
			float step_w;
			uniform half4 _BgColor;
			uniform half _BgFade;
			uniform half4 _Sensitivity; 

			v2f vert (appdata_base v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
				o.screenPos = ComputeScreenPos(o.vertex);
				return o;
			}
			
			uniform sampler2D _MainTex;
			float4 _MainTex_TexelSize;

			float3x3 sx = float3x3( 
			    1.0, 2.0, 1.0, 
			    0.0, 0.0, 0.0, 
			   -1.0, -2.0, -1.0 
			);
			float3x3 sy = float3x3( 
			    1.0, 0.0, -1.0, 
			    2.0, 0.0, -2.0, 
			    1.0, 0.0, -1.0 
			);


			inline half CheckSame (half2 centerNormal, float centerDepth, half4 theSample)
			{
				// difference in normals
				// do not bother decoding normals - there's no need here
				half2 diff = abs(centerNormal - theSample.xy) * _Sensitivity.y;
				int isSameNormal = (diff.x + diff.y) * _Sensitivity.y < 0.1;
				// difference in depth
				float sampleDepth = DecodeFloatRG (theSample.zw);
				float zdiff = abs(centerDepth-sampleDepth);
				// scale the required threshold by the distance
				int isSameDepth = zdiff * _Sensitivity.x < 0.09 * centerDepth;
			
				// return:
				// 1 - if normals and depth are similar enough
				// 0 - otherwise
				
				return isSameNormal * isSameDepth ? 1.0 : 0.0;
			}	


			fixed4 frag (v2f i) : SV_Target
			{

				step_w = _MainTex_TexelSize.x;
				step_h = _MainTex_TexelSize.y;
				
				float2 offs[9] = {
					float2(-step_w, -step_h),	float2(0, -step_h), 	float2(step_w, -step_h),
					float2(-step_w, 0),			float2(0, 0),			float2(step_w, 0), 
					float2(-step_w, step_h),	float2(0, step_h), 		float2(step_w, step_h)
				};

				float4 dif = tex2D(_MainTex, i.uv);

			    float3x3 I;
			    for (int b=0; b<3; b++) {
			        for (int h=0; h<3; h++) {
						float3 sample = tex2D(_MainTex, i.uv + offs[b*3 + h]);
			            // float3 sample  = tex2D(_MainTex, i.screenPos.xy + float2(b-1,h-1));
			            I[b][h] = length(sample); 
			        }
			    }

			    // SOBEL WIKI
				float g1 = abs((I[0][0] + 2*I[0][1] + I[0][2]) - (I[2][0] + 2*I[2][1] + I[2][2]));
				float g2 = abs((I[0][2] + 2*I[1][2] + I[2][2]) - (I[0][0] + 2*I[1][0] + I[2][0]));

				float g = sqrt(pow(g1, 2.5)+pow(g2, 2.5));

				// Yellow + Outline
				// if(g > 0.1) return 0;
				// else return float4(1, 1, 0, 1);

				return float4(dif.x - g, dif.y - g, dif.z - g, 1.0);
			}
			ENDCG
		}
	}
}

