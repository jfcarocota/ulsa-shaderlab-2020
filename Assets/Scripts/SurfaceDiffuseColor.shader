Shader "Custom/SurfaceDiffuseColor"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1) //rgba
    }

    Subshader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            #pragma surface surf Lambert

            half4 _Albedo;

            struct Input
            {
                float2 uv_MainTex;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _Albedo;
            }
        ENDCG
    }
}