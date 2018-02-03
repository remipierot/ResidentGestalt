// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9982,x:33224,y:32707,varname:node_9982,prsc:2|emission-8282-OUT,custl-7846-OUT,olwid-5008-OUT,olcol-3031-RGB;n:type:ShaderForge.SFN_Color,id:3356,x:32215,y:32483,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_3356,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6750984,c2:0.1663286,c3:0.7068965,c4:1;n:type:ShaderForge.SFN_Multiply,id:7825,x:32416,y:32554,varname:node_7825,prsc:2|A-3356-RGB,B-9726-RGB;n:type:ShaderForge.SFN_AmbientLight,id:9726,x:32215,y:32627,varname:node_9726,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:6691,x:31668,y:32987,varname:node_6691,prsc:2;n:type:ShaderForge.SFN_LightColor,id:7828,x:31668,y:32866,varname:node_7828,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3097,x:32038,y:33020,varname:node_3097,prsc:2|A-8890-OUT,B-7828-RGB,C-6691-OUT;n:type:ShaderForge.SFN_Lerp,id:7846,x:32906,y:32875,varname:node_7846,prsc:2|A-7971-OUT,B-3356-RGB,T-3097-OUT;n:type:ShaderForge.SFN_Multiply,id:7971,x:32534,y:32793,varname:node_7971,prsc:2|A-3356-RGB,B-1862-OUT;n:type:ShaderForge.SFN_Slider,id:1862,x:32038,y:32940,ptovrint:False,ptlb:ShadowDarkness,ptin:_ShadowDarkness,varname:node_1862,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_LightVector,id:2689,x:31225,y:32629,varname:node_2689,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:312,x:31225,y:32751,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:7867,x:31423,y:32686,varname:node_7867,prsc:2,dt:1|A-2689-OUT,B-312-OUT;n:type:ShaderForge.SFN_Multiply,id:782,x:31612,y:32666,varname:node_782,prsc:2|A-7867-OUT,B-7729-OUT;n:type:ShaderForge.SFN_Divide,id:8890,x:31971,y:32647,varname:node_8890,prsc:2|A-5980-OUT,B-7729-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7465,x:31429,y:32453,ptovrint:False,ptlb:Tones,ptin:_Tones,varname:node_7465,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Vector1,id:6114,x:31429,y:32511,varname:node_6114,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:7729,x:31612,y:32475,varname:node_7729,prsc:2|A-7465-OUT,B-6114-OUT;n:type:ShaderForge.SFN_Round,id:5980,x:31799,y:32686,varname:node_5980,prsc:2|IN-782-OUT;n:type:ShaderForge.SFN_Slider,id:8708,x:32488,y:32398,ptovrint:False,ptlb:EmissionValue,ptin:_EmissionValue,varname:node_8708,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:8282,x:32873,y:32498,varname:node_8282,prsc:2|A-8708-OUT,B-3356-RGB,C-9629-RGB;n:type:ShaderForge.SFN_Tex2d,id:9629,x:32622,y:32186,ptovrint:False,ptlb:node_9629,ptin:_node_9629,varname:node_9629,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:5008,x:32587,y:33108,ptovrint:False,ptlb:OutlineWidth,ptin:_OutlineWidth,varname:node_5008,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.01;n:type:ShaderForge.SFN_Color,id:3031,x:32744,y:33252,ptovrint:False,ptlb:OutlineColor,ptin:_OutlineColor,varname:node_3031,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:3356-1862-7465-8708-9629-5008-3031;pass:END;sub:END;*/

Shader "Custom/ToonTest" {
    Properties {
        _BaseColor ("BaseColor", Color) = (0.6750984,0.1663286,0.7068965,1)
        _ShadowDarkness ("ShadowDarkness", Range(0, 1)) = 0
        _Tones ("Tones", Float ) = 3
        _EmissionValue ("EmissionValue", Range(0, 10)) = 1
        _node_9629 ("node_9629", 2D) = "white" {}
        _OutlineWidth ("OutlineWidth", Range(0, 0.01)) = 0
        _OutlineColor ("OutlineColor", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _OutlineWidth;
            uniform float4 _OutlineColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_OutlineWidth,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(_OutlineColor.rgb,0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _BaseColor;
            uniform float _ShadowDarkness;
            uniform float _Tones;
            uniform float _EmissionValue;
            uniform sampler2D _node_9629; uniform float4 _node_9629_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _node_9629_var = tex2D(_node_9629,TRANSFORM_TEX(i.uv0, _node_9629));
                float3 emissive = (_EmissionValue*_BaseColor.rgb*_node_9629_var.rgb);
                float node_7729 = (_Tones-1.0);
                float3 finalColor = emissive + lerp((_BaseColor.rgb*_ShadowDarkness),_BaseColor.rgb,((round((max(0,dot(lightDirection,normalDirection))*node_7729))/node_7729)*_LightColor0.rgb*attenuation));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _BaseColor;
            uniform float _ShadowDarkness;
            uniform float _Tones;
            uniform float _EmissionValue;
            uniform sampler2D _node_9629; uniform float4 _node_9629_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float node_7729 = (_Tones-1.0);
                float3 finalColor = lerp((_BaseColor.rgb*_ShadowDarkness),_BaseColor.rgb,((round((max(0,dot(lightDirection,normalDirection))*node_7729))/node_7729)*_LightColor0.rgb*attenuation));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
