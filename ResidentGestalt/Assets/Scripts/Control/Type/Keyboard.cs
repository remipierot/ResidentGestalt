using UnityEngine;

namespace Control.Type
{
	public class Keyboard : Controls
	{
		void Update()
		{
			Up = Input.GetKeyDown(KeyCode.UpArrow) && !Down && !Left && !Right;
			Down = Input.GetKeyDown(KeyCode.DownArrow) && !Up && !Left && !Right;
			Left = Input.GetKeyDown(KeyCode.LeftArrow) && !Up && !Down && !Right;
			Right = Input.GetKeyDown(KeyCode.RightArrow) && !Up && !Down && !Left;
		}
	}
}
