using UnityEngine;
using Control.Type;

namespace Control
{
	public class InputTest : MonoBehaviour
	{
		private Controls controller;
		private Controls keyboard;

		private void Start()
		{
			controller = gameObject.AddComponent<Controller>();
			keyboard = gameObject.AddComponent<Keyboard>();
		}

		private void Update()
		{
			if (controller.InputPressed)
			{
				if (controller.Up)
				{
					Debug.LogError("CONTROLLER - Up");
				}

				if (controller.Down)
				{
					Debug.LogError("CONTROLLER - Down");
				}

				if (controller.Left)
				{
					Debug.LogError("CONTROLLER - Left");
				}

				if (controller.Right)
				{
					Debug.LogError("CONTROLLER - Right");
				}
			}

			if (keyboard.InputPressed)
			{
				if (keyboard.Up)
				{
					Debug.LogError("KEYBOARD - Up");
				}

				if (keyboard.Down)
				{
					Debug.LogError("KEYBOARD - Down");
				}

				if (keyboard.Left)
				{
					Debug.LogError("KEYBOARD - Left");
				}

				if (keyboard.Right)
				{
					Debug.LogError("KEYBOARD - Right");
				}
			}
		}
	}
}
