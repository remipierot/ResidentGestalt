using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class SobelEdgeDetectionScript : MonoBehaviour {

	public Material my_mat;

	void Start () {
		Camera.main.depthTextureMode = DepthTextureMode.Depth;
	}

	// Use this for initialization
	void OnRenderImage (RenderTexture source, RenderTexture dest) {
		Graphics.Blit(source, dest, my_mat);
	}
}
