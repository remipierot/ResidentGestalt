using UnityEngine;

namespace Control.Type
{
	public class Keyboard : Controls
	{
		void Update()
		{
			Up = Input.GetButtonDown("Up") && !Down && !Left && !Right;
			Down = Input.GetButtonDown("Down") && !Up && !Left && !Right;
			Left = Input.GetButtonDown("Left") && !Up && !Down && !Right;
			Right = Input.GetButtonDown("Right") && !Up && !Down && !Left;
		}
	}
}
