// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9147,x:32988,y:32478,varname:node_9147,prsc:2|diff-2796-OUT,alpha-856-OUT;n:type:ShaderForge.SFN_Tex2d,id:2820,x:32002,y:32616,ptovrint:False,ptlb:Mask_cutoff,ptin:_Mask_cutoff,varname:node_2820,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:013317fe9160e774b9f4336921ff7418,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:3966,x:32002,y:33003,ptovrint:False,ptlb:TimerColor,ptin:_TimerColor,varname:node_3966,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08823529,c2:0.3183391,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:1002,x:31845,y:32520,ptovrint:False,ptlb:_Cutoff,ptin:__Cutoff,varname:node_1002,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_If,id:2796,x:32242,y:32616,varname:node_2796,prsc:2|A-1002-OUT,B-2820-R,GT-6332-RGB,EQ-3966-RGB,LT-3966-RGB;n:type:ShaderForge.SFN_Color,id:6332,x:32002,y:32816,ptovrint:False,ptlb:EmptyColor,ptin:_EmptyColor,varname:node_6332,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:0;n:type:ShaderForge.SFN_Tex2d,id:5841,x:32350,y:32980,ptovrint:False,ptlb:Mask_shape,ptin:_Mask_shape,varname:node_5841,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bc339dbb0793e52419f86fac4a1edbee,ntxv:0,isnm:False;n:type:ShaderForge.SFN_If,id:2856,x:32472,y:32728,varname:node_2856,prsc:2|A-2796-OUT,B-2474-OUT,GT-2501-OUT,EQ-2474-OUT,LT-2474-OUT;n:type:ShaderForge.SFN_Vector1,id:2474,x:32242,y:32742,varname:node_2474,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:2501,x:32242,y:32800,varname:node_2501,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:5377,x:32671,y:32866,varname:node_5377,prsc:2|A-2856-OUT,B-5841-R;n:type:ShaderForge.SFN_ComponentMask,id:856,x:32759,y:32672,varname:node_856,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-5377-OUT;proporder:2820-3966-1002-6332-5841;pass:END;sub:END;*/

Shader "Custom/Timer" {
    Properties {
        _Mask_cutoff ("Mask_cutoff", 2D) = "white" {}
        _TimerColor ("TimerColor", Color) = (0.08823529,0.3183391,0.5,1)
        __Cutoff ("_Cutoff", Range(0, 1)) = 0
        _EmptyColor ("EmptyColor", Color) = (0,0,0,0)
        _Mask_shape ("Mask_shape", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Mask_cutoff; uniform float4 _Mask_cutoff_ST;
            uniform float4 _TimerColor;
            uniform float __Cutoff;
            uniform float4 _EmptyColor;
            uniform sampler2D _Mask_shape; uniform float4 _Mask_shape_ST;
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
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _Mask_cutoff_var = tex2D(_Mask_cutoff,TRANSFORM_TEX(i.uv0, _Mask_cutoff));
                float node_2796_if_leA = step(__Cutoff,_Mask_cutoff_var.r);
                float node_2796_if_leB = step(_Mask_cutoff_var.r,__Cutoff);
                float3 node_2796 = lerp((node_2796_if_leA*_TimerColor.rgb)+(node_2796_if_leB*_EmptyColor.rgb),_TimerColor.rgb,node_2796_if_leA*node_2796_if_leB);
                float3 diffuseColor = node_2796;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                float node_2474 = 0.0;
                float node_2856_if_leA = step(node_2796,node_2474);
                float node_2856_if_leB = step(node_2474,node_2796);
                float4 _Mask_shape_var = tex2D(_Mask_shape,TRANSFORM_TEX(i.uv0, _Mask_shape));
                fixed4 finalRGBA = fixed4(finalColor,(lerp((node_2856_if_leA*node_2474)+(node_2856_if_leB*1.0),node_2474,node_2856_if_leA*node_2856_if_leB)*_Mask_shape_var.r).r);
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Mask_cutoff; uniform float4 _Mask_cutoff_ST;
            uniform float4 _TimerColor;
            uniform float __Cutoff;
            uniform float4 _EmptyColor;
            uniform sampler2D _Mask_shape; uniform float4 _Mask_shape_ST;
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
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _Mask_cutoff_var = tex2D(_Mask_cutoff,TRANSFORM_TEX(i.uv0, _Mask_cutoff));
                float node_2796_if_leA = step(__Cutoff,_Mask_cutoff_var.r);
                float node_2796_if_leB = step(_Mask_cutoff_var.r,__Cutoff);
                float3 node_2796 = lerp((node_2796_if_leA*_TimerColor.rgb)+(node_2796_if_leB*_EmptyColor.rgb),_TimerColor.rgb,node_2796_if_leA*node_2796_if_leB);
                float3 diffuseColor = node_2796;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                float node_2474 = 0.0;
                float node_2856_if_leA = step(node_2796,node_2474);
                float node_2856_if_leB = step(node_2474,node_2796);
                float4 _Mask_shape_var = tex2D(_Mask_shape,TRANSFORM_TEX(i.uv0, _Mask_shape));
                fixed4 finalRGBA = fixed4(finalColor * (lerp((node_2856_if_leA*node_2474)+(node_2856_if_leB*1.0),node_2474,node_2856_if_leA*node_2856_if_leB)*_Mask_shape_var.r).r,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
