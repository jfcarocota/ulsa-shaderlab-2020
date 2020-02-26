Shader "Custom/SDNormalStrength"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
        _MainTex("Main Texture", 2D) = "white" {}
        _NormalTex("Normal Texture", 2D) = "bump" {}
        _NormalStrength("Normal Strength", Range(-5, 5)) = 1
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            #pragma surface surf Lambert

            fixed3 _Albedo;
            sampler2D _MainTex;
            sampler2D _NormalTex;
            float _NormalStrength;

            struct Input
            {
                float2 uv_MainTex;
                float2 uv_NormalTex;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
               fixed3 texColor = tex2D(_MainTex,IN.uv_MainTex);
               o.Albedo = texColor * _Albedo;
               fixed4 normalColor = tex2D(_NormalTex, IN.uv_NormalTex);
               fixed3 normal = UnpackNormal(normalColor).rgb;
               normal.z = normal.z / _NormalStrength;
               o.Normal = normalize(normal); 
            }
        ENDCG
    }
}