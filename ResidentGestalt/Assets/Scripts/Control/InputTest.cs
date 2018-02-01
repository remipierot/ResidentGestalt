using UnityEngine;

namespace Control
{
	public class InputTest : MonoBehaviour
	{
		private void Start()
		{
			if(!GetComponent<ControlManager>())
			{
				gameObject.AddComponent<ControlManager>();
			}
		}

		private void Update()
		{
			if (ControlManager.InputPressed)
			{
				if (ControlManager.Up)
				{
					Debug.LogError("Up");
				}

				if (ControlManager.Down)
				{
					Debug.LogError("Down");
				}

				if (ControlManager.Left)
				{
					Debug.LogError("Left");
				}

				if (ControlManager.Right)
				{
					Debug.LogError("Right");
				}
			}
		}
	}
}
