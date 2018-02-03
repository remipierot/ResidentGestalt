using UnityEngine;
using UnityEngine.SceneManagement;

public class InputChoice : MonoBehaviour
{
	public Control.Type.TYPE Type;

	private void OnMouseDown()
	{
		InputType.Type = Type;
		SceneManager.LoadScene(1);
	}

	private void OnMouseEnter()
	{
		MeshRenderer render = GetComponent<MeshRenderer>();
		Material mat = render.material;
		mat.SetColor("_BaseColor", Color.cyan);
		render.material = mat;
	}

	private void OnMouseExit()
	{
		MeshRenderer render = GetComponent<MeshRenderer>();
		Material mat = render.material;
		mat.SetColor("_BaseColor", Color.black);
		render.material = mat;
	}
}
