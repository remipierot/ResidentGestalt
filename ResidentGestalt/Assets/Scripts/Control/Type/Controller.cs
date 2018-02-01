using UnityEngine;

namespace Control.Type
{
	public class Controller : Controls
	{
		void Update()
		{
			Up = Input.GetButtonDown("Up");
			Down = Input.GetButtonDown("Down");
			Left = Input.GetButtonDown("Left");
			Right = Input.GetButtonDown("Right");
		}
	}
}
