using UnityEngine;

namespace Control.Type
{
	public class Keyboard : Controls
	{
		void Update()
		{
			Up = Input.GetKeyDown(KeyCode.UpArrow);
			Down = Input.GetKeyDown(KeyCode.DownArrow);
			Left = Input.GetKeyDown(KeyCode.LeftArrow);
			Right = Input.GetKeyDown(KeyCode.RightArrow);
		}
	}
}
