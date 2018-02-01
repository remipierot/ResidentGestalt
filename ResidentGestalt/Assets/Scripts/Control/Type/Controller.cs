using UnityEngine;

namespace Control.Type
{
	public class Controller : Controls
	{
		void Update()
		{
			Up = Input.GetButtonDown("Y") && !A && !X && !B;
			Down = Input.GetButtonDown("A") && !Y && !X && !B;
			Left = Input.GetButtonDown("X") && !Y && !A && !B;
			Right = Input.GetButtonDown("B") && !Y && !A && !X;
		}
	}
}
